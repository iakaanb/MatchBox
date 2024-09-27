//
//  Message.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Hashable, Codable {
    @DocumentID var messageId: String?
//    var id: String
    let fromUserId: String
    let toUserId: String
    let username: String
    let messageContent: String
    let timestamp: Timestamp
//    var isCurrentUser: Bool
//    let isTimeUp: Bool
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    var chatPartnerId: String {
        return fromUserId == Auth.auth().currentUser?.uid ? toUserId : fromUserId
    }
    var isFromCurrentUser: Bool {
        return fromUserId == Auth.auth().currentUser?.uid
    }
}
//struct Chatroom: Codable, Identifiable {
//    var id: String
//}

//struct Message: Codable, Identifiable {
//    var id: String?
//    var content: String
////    var name: String
//}

//class MessageViewModel: ObservableObject {
//    @Published var messages = [Message]()
//    private let db = Firestore.firestore()
//    private let user = Auth.auth().currentUser
//    
//    func sendMessages(messageContent: String, docId: String) {
//        if (user != nil) {
//            db.collection("Chatroom").document(docId).collection("Messages").addDocument(data: ["sentAt": Date(), "content": messageContent, "sender": user!.uid])
//        }
//    }
//    
//    func fetchData(docId: String) {
//        if (user != nil) {
//            db.collection("Chatroom").document(docId).collection("Messages").order(by: "sentAt", descending: false).addSnapshotListener({( snapshot, error) in
//                guard let documents = snapshot?.documents else {
//                    print("no documents")
//                    return
//                }
//                
//                self.messages = documents.map { docSnapshot -> Message in
//                    let data = docSnapshot.data()
//                    let docId = docSnapshot.documentID
//                    let content = data["Content"] as? String ?? ""
////                    let displayName = data["displayName"] as? String ?? ""
////                    return Message(id: docId, content: content, name: displayName)
//                    return Message(id: docId, content: content)
//
//                    
//                }
//            })
//        }
//    }
//}

struct MessageNetwork {
    
    static let messageCollection = Firestore.firestore().collection("messages")
    static func sendMessages(_ messageContent: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let otherUserId = user.id

        let currentUserRef = messageCollection.document(currentUid).collection(otherUserId).document()
 
        let otherUserRef = messageCollection.document(otherUserId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId, fromUserId: currentUid, toUserId: otherUserId, username: user.username, messageContent: messageContent, timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        otherUserRef.document(messageId).setData(messageData)
    }
    static func observeMessages(otherUser: User, completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let otherUserId = otherUser.id
        
        let query = messageCollection
            .document(currentUid)
            .collection(otherUserId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
            
            for (index, message) in messages.enumerated() where message.fromUserId != currentUid {
                messages[index].user = otherUser
            }
            
            completion(messages)
        }
    }

}
//class MessageViewModel: ObservableObject {
//    @Published var messages = [Message]()
//    private let db = Firestore.firestore()
//    private let user = Auth.auth().currentUser
//
//    func sendMessages(messageContent: String, docId: String) {
//        if (user != nil) {
//            db.collection("Chatroom").document(docId).collection("Messages").addDocument(data: ["sentAt": Date(), "content": messageContent, "sender": user!.uid])
//        }
//    }
//
//    func fetchData(docId: String) {
//        if (user != nil) {
//            db.collection("Chatroom").document(docId).collection("Messages").order(by: "sentAt", descending: false).addSnapshotListener({( snapshot, error) in
//                guard let documents = snapshot?.documents else {
//                    print("no documents")
//                    return
//                }
//
//                self.messages = documents.map { docSnapshot -> Message in
//                    let data = docSnapshot.data()
//                    let docId = docSnapshot.documentID
//                    let content = data["Content"] as? String ?? ""
////                    let displayName = data["displayName"] as? String ?? ""
////                    return Message(id: docId, content: content, name: displayName)
//                    return Message(id: docId, content: content)
//
//
//                }
//            })
//        }
//    }
//}

