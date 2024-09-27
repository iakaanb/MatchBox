////
////  Backend.swift
////  Matchbox
////
////  Created by kai on 3/12/24.
////
//
//import SwiftUI
//
//class Network: ObservableObject {
//    @Published var messages: [Message] = []
//    @Published var users: [User] = []
//    
//    func getMessages() {
//        guard let url = URL(string: "https://192.168.2.53:5000/messages/") else { fatalError("Missing URL") }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else { return }
//            
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([Message].self, from: data)
//                        self.messages = decodedUsers
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//    
//    func getUsers() {
//        guard let url = URL(string: "https://192.168.2.53:5000/users/") else { fatalError("Missing URL") }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else { return }
//            
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
//                        self.users = decodedUsers
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//    
//    //    func sendMessages() {
//    //        guard let url = URL(string: "https://192.168.2.53:5000/users/") else { fatalError("Missing URL") }
//    //
//    //        let urlRequest = URLRequest(url: url)
//    //
//    //        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//    //            if let error = error {
//    //                print("Request error: ", error)
//    //                return
//    //            }
//    //        dataTask.resume()
//    //    }
//    //    }
//}
