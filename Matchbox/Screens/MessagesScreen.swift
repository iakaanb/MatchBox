//
//  MessagesScreen.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//
import SwiftUI


struct MessagesScreen: View {
    
//    @EnvironmentObject var network: Network
//    @State private var messageText = ""
//    @State private var otherUser : User?
//    let chatroom: Chatroom
    @StateObject var viewModel: MessageViewModel
//    let currentUser: User?
//
//    private var user: User? {
//        return message
//    }
//    init (chatroom: Chatroom) {
//        self.chatroom = chatroom
//        viewModel.fetchData(docId: chatroom.id)
//    }
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: MessageViewModel(user: user))
    }
    var body: some View {
        ScrollView {
            VStack(spacing: -7) {
                ForEach(viewModel.messages) { message in
//                    MessageCell(username: otherUser.username, message: message)
                }
                //                List(viewModel.messages) { message in
//                    HStack {
//                        Text(message.content)
//                        Spacer()
//                    }
//                }
//                ForEach(viewModel.messages) { message in
//                    VStack (alignment: .leading, spacing: 0) {
//                        if !Auth.auth().currentUser {
//                        Text("@" + username)
//                            .foregroundColor(Color.gray)
//                            .font(.system(size: 12))
//                    }
//                        Text(message.content)
//                            .padding(10)
//                            .foregroundColor(Color.white)
//                            .background(isCurrentUser ? Color.yellow : Color(Color.orange ))
//                            .cornerRadius(10)
//                    }
//                    .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
//                    .padding()
                    
//                ForEach(network.messages) { message in
//                    MessageCell(username: message.username, message: message.messageContent, isCurrentUser: message.isCurrentUser)
//                }
                
//                                ForEach(network.messages) { message in
//                                    MessageCell(username: message.username, message: message.messageContent, isCurrentUser: message.isCurrentUser)
//                                }
                
//                .onAppear {
//                    network.getMessages()
//                }
//                                Button(action: {network.sendMessages()}) {
//                                    //send texts button
//                                         }
            }
        }
        Spacer()
        ZStack(alignment: .trailing) {
            TextField("Message", text: $viewModel.messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
//                .clipShape(Capsule)
                .cornerRadius(10)
                .font(.subheadline)
            Button {
//                print("Send a message")
                viewModel.sendMessage()
                viewModel.messageText = ""
            } label: {
                Text("Send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
//        .frame(width: .infinity)
    }
    
//    func storeMessage() {
//        
//    }
    }

//#Preview {
////    MessagesScreen(chatroom: Chatroom(id: "10101", timeUp: false))
//}
