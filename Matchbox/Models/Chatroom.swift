//
//  Chatroom.swift
//  Matchbox
//
//  Created by kai on 3/22/24.
//

import Firebase

struct Chatroom: Codable, Identifiable {
    var id: String
    var timeUp: Bool
}

//class ChatroomViewModel: ObservableObject {
//    @Published var chatroom = [Chatroom]()
//    private let db = Firestore.firestore()
//    private let user = Auth.auth().currentUser
//    
//    func fetchData() {
//        if (user != nil) {
//            db.collection("Chatrooms").whereField("Users", arrayContains: user!.uid).addSnapshotListener({(snapshot, error) in
//                guard let documents = snapshot?.documents else {
//                    print("no docs returned")
//                    return
//                }
//                
//                self.chatroom = documents.map({docSnapshot -> Chatroom in
//                    let data = docSnapshot.data()
//                    let docId = docSnapshot.documentID
//                    let timeUp: Bool = data["timeUp"] as? Bool ?? false
//                    return Chatroom(id: docId, timeUp: timeUp)
//                })
//            })
//        }
//    }
//}

class MessageViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    let user: User
    
    init(user: User){
        self.user = user
        observeMessage()
    }
    func observeMessage() {
        MessageNetwork.observeMessages(otherUser: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    func sendMessage() {
        MessageNetwork.sendMessages(messageText, toUser: user)
    }
}
