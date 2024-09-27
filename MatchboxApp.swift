//
//  MatchboxApp.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//

import SwiftUI
import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {

//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}

@main
struct MatchboxApp: App {
//    var network = Network()
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var networkManager = NetworkManager()
    
    init() {
        FirebaseApp.configure()
    }
//    
    var body: some Scene {
        WindowGroup {
//            NavigationView {
//            ContentView()
//                .environmentObject(network)
            SignUpScreen()
                .environmentObject(networkManager)
        }
    }
}
