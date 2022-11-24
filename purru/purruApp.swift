//
//  purruApp.swift
//  purru
//
//  Created by renaka agusta on 25/10/22.
//

import SwiftUI
import Sentry

@main
struct purruApp: App {
    
    init() {
//        SentrySDK.start { options in
//               options.dsn = "https://a1adb92ce5684191b811d1d6e12a2ff5@o4503908946280448.ingest.sentry.io/4504196684447744"
//               options.debug = true
//               options.tracesSampleRate = 1.0
//               options.enableAppHangTracking = true
//               options.enableFileIOTracking = true
//               options.enableCoreDataTracking = true
//               options.enableCaptureFailedRequests = true
//           }
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(scheme)
        }
    }
}
