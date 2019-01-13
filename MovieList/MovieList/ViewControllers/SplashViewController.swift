//
//  SplashViewController.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import UIKit
import Reachability
import Firebase

class SplashViewController: BaseViewController {
    
    let remoteConfigParameterName = "splashText"
    var remoteConfig = RemoteConfig.remoteConfig()
    var reachability = Reachability()!
    
    @IBOutlet weak var splashTextLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
            DispatchQueue.main.async {
                
                self.remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)

                self.remoteConfig.setDefaults([self.remoteConfigParameterName:"Burhan" as NSObject])
                self.remoteConfig.fetch(completionHandler: { (remoteConfigFetchStatus, error) in
                    if remoteConfigFetchStatus == RemoteConfigFetchStatus.success{
                        self.remoteConfig.activateFetched()
                        let splashText = self.remoteConfig[self.remoteConfigParameterName].stringValue
//                        let splashText = self.remoteConfig.configValue(forKey: self.remoteConfigParameterName)
                        
                        self.splashTextLabel.text = splashText
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
                            self.navigateToMovieListViewController()
                        }
                    }
                    else{
                        UIHelper.showError(error: ErrorModel.init(error: error))
                    }
                })
                
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()
            if reachability.connection != .none{
                print("Reachable")
            }
        } catch {
            print("Unable to start notifier")
        }
    }

    func navigateToMovieListViewController() {
        
        let movieListViewController = MovieListViewController()
        let movieListNavigationController = UINavigationController.init(rootViewController: movieListViewController)
        UIApplication.shared.keyWindow?.rootViewController = movieListNavigationController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
