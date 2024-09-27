//
//  MatchUsers.swift
//  Matchbox
//
//  Created by kai on 3/16/24.
//

import SwiftUI
//import Firebase

func matchUsers() {
    @EnvironmentObject var networkManager: NetworkManager
    @State var matchedUsers: [User] = []
    @State var unmatchedUsers : [User] = networkManager.users
    @State var userMatchings: [User: User] = [:]
//    removeAll() when starting over
    
    //    @State var genderPrefFemale : [User] = []
    //    @State var genderPrefMale : [User] = []
    //    @State var genderPrefOther : [User] = []
    //
    //    @State var genderFemale : [User] = []
    //    @State var genderMale : [User] = []
    //    @State var genderOther : [User] = []
    
    let genderPrefFemale = unmatchedUsers.filter { $0.genderPref == "FemalePref"}
    let genderPrefMale = unmatchedUsers.filter { $0.genderPref == "MalePref"}
    let genderPrefOther = unmatchedUsers.filter { $0.genderPref == "OtherPref"}
    
    let genderFemale = unmatchedUsers.filter { $0.gender == "Female"}
    let genderMale = unmatchedUsers.filter { $0.gender == "Male"}
    let genderOther = unmatchedUsers.filter { $0.gender == "Other"}
    
    //    for user in unmatchedUsers {
    //        func sortUsersGender() {
    //            if user.gender == "Female" {
    //                genderFemale.append(user)
    //            } else if user.gender == "Male" {
    //                genderMale.append(user)
    //            } else {
    //                genderOther.append(user)
    //            }
    //        }
    //
    //        func sortUsersGenderPref() {
    //            if user.genderPref == "Female" {
    //                genderPrefFemale.append(user)
    //            } else if user.genderPref == "Male" {
    //                genderPrefMale.append(user)
    //            } else {
    //                genderPrefOther.append(user)
    //            }
    //        }
    //    }
    
    //choose w random gender pref female user then match user w random person from female cat
    func match() {
        for user in unmatchedUsers {
            if user.gender == "Female" {
                let randomIndexGender = Int.random(in: 0...(genderFemale.count - 1))
                let randomIndexGenderPref = Int.random(in: 0...(genderPrefFemale.count - 1))
                userMatchings[genderFemale[randomIndexGender]] = genderPrefFemale[randomIndexGenderPref]
                matchedUsers.append(genderFemale[randomIndexGender])
                matchedUsers.append(genderPrefFemale[randomIndexGenderPref])
            } else if user.gender == "Male" {
                let randomIndexGender = Int.random(in: 0...(genderMale.count - 1))
                let randomIndexGenderPref = Int.random(in: 0...(genderPrefMale.count - 1))
                userMatchings[genderMale[randomIndexGender]] = genderPrefMale[randomIndexGenderPref]
                matchedUsers.append(genderMale[randomIndexGender])
                matchedUsers.append(genderPrefMale[randomIndexGenderPref])
            } else {
                let randomIndexGender = Int.random(in: 0...(genderOther.count - 1))
                let randomIndexGenderPref = Int.random(in: 0...(genderPrefOther.count - 1))
                userMatchings[genderOther[randomIndexGender]] = genderPrefOther[randomIndexGenderPref]
                matchedUsers.append(genderOther[randomIndexGender])
                matchedUsers.append(genderPrefOther[randomIndexGenderPref])
            }
        }
    }
    
    match()
    for user in userMatchings {
//        updateUser(user, user.value)
    }
}
