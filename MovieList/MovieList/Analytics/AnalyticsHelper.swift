//
//  AnalyticsHelper.swift
//  MovieList
//
//  Created by Burhan Akkuş on 13.01.2019.
//  Copyright © 2019 Burhan Akkuş. All rights reserved.
//

import Firebase

class AnalyticsHelper: NSObject {

    static func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Void {
        FirebaseApp.configure()
    }

    static func movieDetail(movieModel : MovieModel)  {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(movieModel)
            let jsonString = String(data: jsonData, encoding: .utf8)
            
            let firebaseParameters : [String:NSObject] =  [
                AnalyticsParameterItemID:movieModel.imdbId.stringValue() as NSObject,
                AnalyticsParameterItemName:movieModel.Title.stringValue() as NSObject,
                AnalyticsParameterContent:jsonString.stringValue() as NSObject
            ]

            Analytics.logEvent(AnalyticsEventViewItem, parameters: firebaseParameters)
        }
        catch {
            
        }
    }

    func sendDefaultEvent(eventName:String)  {
        Analytics.logEvent(eventName, parameters: nil)
    }
    
}
