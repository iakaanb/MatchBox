//
//  Users.swift
//  Matchbox
//
//  Created by kai on 3/12/24.
//

import Foundation
import FirebaseFirestoreSwift

protocol SomeUser: Hashable {
    var id: String  { get }
    var fullName: String  { get }
    var username: String { get }
    var gender: String { get }
    var age: Int { get }
    var genderPref: String { get }
    var netIDEmail: String { get }
    var isValid: Bool { get }
//    var match: String { get }
}
//struct User: SomeUser, Codable, Identifiable {
////struct User: Identifiable, NSHashTable<AnyObject> {
//    @DocumentID var uid: String?
//    var id: String {
//        return uid ?? NSUUID().uuidString
//    }
struct User: SomeUser, Identifiable, Codable {
//struct User: Identifiable, NSHashTable<AnyObject> {
//    var id: String
    var fullName: String
    var username: String
    var gender: String
    var age: Int
    var genderPref: String
    var netIDEmail: String
    var isValid: Bool
//    var match: String
    @DocumentID var uid: String?
        var id: String {
            return uid ?? NSUUID().uuidString
        }
}
