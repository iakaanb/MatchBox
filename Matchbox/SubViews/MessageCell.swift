//
//  MessageCell.swift
//  Matchbox
//
//  Created by kai on 3/12/24.
//

import SwiftUI

struct MessageCell: View {
    var username: String
    let message: Message
    private var isFromCurrentUser: Bool {
        return message.isFromCurrentUser
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
        if !isFromCurrentUser {
            Text("@" + username)
                .foregroundColor(Color.gray)
                .font(.system(size: 12))
        }
            Text(message.messageContent)
                .padding(10)
                .foregroundColor(Color.white)
                .background(isFromCurrentUser ? Color.yellow : Color(Color.orange ))
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: isFromCurrentUser ? .trailing : .leading)
        .padding()
    }
}

//#Preview {
//    MessageCell(username: "bluebee4", message: "Hey!", isFromCurrentUser: true)
////    MessageCell(username: "greenant1", message: "Hi there!", isCurrentUser: false)
//}
