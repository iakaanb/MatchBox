
//  NetworkManager.swift
//  Matchbox
//
//  Created by kai on 3/15/24.

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

class NetworkManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var users: [User] = []
    @Published var currentUser: User?
//    static let shared = UserService()
    
    init() {
//        getUsers()
        getCurrentUser()
//        addUser(fullName: String, username: String, gender: String, age: Int, genderPref: String, netIDEmail: String, isValid: Bool)
    }
//    override init () {
////        FirebaseApp.configure()
//        if FirebaseApp.app() == nil {
//            FirebaseApp.configure()
//        }
//        
//        super.init()
//    }
    
    func getCurrentUser()  {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Could not find firebase id.")
            return
        }
//        let snapshot = try await Firestore.firestore().collection("Users").document(uid).getDocument()
//        let  user = try snapshot.data(as: User.self)
//        self.currentUser = user
//        print("Current user is \(currentUser)")
//
//        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            //                    { error in
            if let error = error {
                print("Cannot reach current user.")
                return
            }
            
            //
            ////            self.errorMessage = "123"
            //
            guard let userData = snapshot?.data() else {
                print("No data found")
                return
                
            }
            print(userData)
//        }
//                        let id = userData["id"] as? String ?? ""
                        guard let userId = Auth.auth().currentUser?.uid else { return }
                        let fullName = userData["full name"] as? String ?? ""
                        let username = userData["username"] as? String ?? ""
                        let gender = userData["gender"] as? String ?? ""
                        let age = userData["age"] as? Int ?? 18
                        let genderPref = userData["genderPref"] as? String ?? ""
                        let netIDEmail = userData["net ID email"] as? String ?? ""
                        let isValid = userData["is valid"] as? Bool ?? true
                        
//            let user = User(id: id, fullName: fullName, username: username, gender: gender, age: age, genderPref: genderPref, netIDEmail: netIDEmail, isValid: isValid)
            let user = User(fullName: fullName, username: username, gender: gender, age: age, genderPref: genderPref, netIDEmail: netIDEmail, isValid: isValid, uid: userId)
            
        print(user.username)
        }
//    }
        
    }
    
    func getUsers() {
        users.removeAll()
        let usersDatabase = Firestore.firestore()
        let reference = usersDatabase.collection("Users")
        reference.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
//                    let id = data["id"] as? String ?? ""
                    guard let userId = Auth.auth().currentUser?.uid else { return }
                    let fullName = data["full name"] as? String ?? ""
                    let username = data["username"] as? String ?? ""
                    let gender = data["gender"] as? String ?? ""
                    let age = data["age"] as? Int ?? 18
                    let genderPref = data["genderPref"] as? String ?? ""
                    let netIDEmail = data["net ID email"] as? String ?? ""
                    let isValid = data["is valid"] as? Bool ?? true
                    let match = data["match"] as? String ?? ""
                    
//                    let user = User(id: id, fullName: fullName, username: username, gender: gender, age: age, genderPref: genderPref, netIDEmail: netIDEmail, isValid: isValid)
                    let user = User(fullName: fullName, username: username, gender: gender, age: age, genderPref: genderPref, netIDEmail: netIDEmail, isValid: isValid, uid: userId)
                    self.users.append(user)
                }
            }
        }
    }
    
    func addUser(fullName: String, username: String, gender: String, age: Int, genderPref: String, netIDEmail: String, isValid: Bool) {
        let usersDatabase = Firestore.firestore()
//        guard let userID = Auth.auth().currentUser?.uid else { return }
//        let userData = ["id": userID, "fullName": fullName, "username": username, "gender": gender, "age": age, "genderPref": genderPref, "netIDEmail": netIDEmail, "isValid": isValid] as [String : Any]
//        let username: String = usernameCreator()
        let userData = ["fullName": fullName, "username": username, "gender": gender, "age": age, "genderPref": genderPref, "netIDEmail": netIDEmail, "isValid": isValid] as [String : Any]
//        let reference = usersDatabase.collection("Users").document(userID)
        let reference = usersDatabase.collection("Users").document()
        reference.setData(userData)
//        { error in
//            if let error = error {
//                print(error.localizedDescription)
//            }
            print("Checking")
//        }
    }
        //    func sendMessages() {
        //        guard let url = URL(string: "https://192.168.2.53:5000/users/") else { fatalError("Missing URL") }
        //
        //        let urlRequest = URLRequest(url: url)
        //
        //        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        //            if let error = error {
        //                print("Request error: ", error)
        //                return
        //            }
        //        dataTask.resume()
        //    }
        //    }
    
    
    
    
    
    
    
    
}

func updateUser(user: User, match: User) {
//    let usersDatabase = Firestore.firestore()
//    usersDatabase.collection("Users").whereField("id", isEqualTo: id).get
}

