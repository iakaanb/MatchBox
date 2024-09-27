//
//  SignUpScreen.swift
//  Matchbox
//
//  Created by kai on 3/15/24.
//

import SwiftUI
import Firebase

struct SignUpScreen: View {
//    @EnvironmentObject var network: Network
    @EnvironmentObject var networkManager: NetworkManager
//    @StateObject var signUpModel = SignUpModel()
    @State var id = ""
    @State var fullName = ""
    @State var username = ""
    @State var gender = "Female"
    @State var age = 18
    @State var genderPref = "FemalePref"
    @State var netIDEmail = ""
    @State var isValid = true
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 27) {
                //add logo/title
                // sign in with google
                VStack (alignment: .leading, spacing: 15) {
                    Text("Sign Up")
                        .font(Font.custom("Judson", size: 27))
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 7) {
                        //                    Text("User Information")
                        //                        .font(Font.custom("Judson", size: 15))
                        //                        .foregroundColor(.black)
                        
                        TextField("Cornell Email", text: $netIDEmail)
                            .padding(10)
                            .foregroundColor(.black)
                            .frame(width: 324, height: 35)
                            .background(Color(red: 0.95, green: 0.44, blue: 0.17).opacity(0.76))
                            .cornerRadius(5)
                        TextField("Full Name", text: $fullName)
                            .padding(10)
                            .foregroundColor(.black)
                            .frame(width: 324, height: 35)
                            .background(Color(red: 0.95, green: 0.44, blue: 0.17).opacity(0.76))
                            .cornerRadius(5)
                        Picker("Gender",
                               selection: $gender) {
                            //                        Text("Gender")
                            //                            .tag("Gender")
                            Text("Female")
                                .tag("Female")
                            Text("Male")
                                .tag("Male")
                            Text("Other")
                                .tag("Other")
                        }
                        //                TextField("Gender", text: $gender)
                               .frame(width: 324, alignment: .leading)
                               .accentColor(Color.gray)
                        //                           .labelsHidden()
                               .padding(10)
                        //                           .foregroundColor(.black)
                               .frame(width: 324, height: 35)
                               .background(Color(red: 0.95, green: 0.44, blue: 0.17).opacity(0.76))
                               .cornerRadius(5)
                        TextField("Age", value: $age, formatter: NumberFormatter())
                            .accentColor(Color.black)
                            .keyboardType(.numberPad)
                            .padding(10)
                            .foregroundColor(.black)
                            .frame(width: 324, height: 35)
                            .background(Color(red: 0.95, green: 0.44, blue: 0.17).opacity(0.76))
                            .cornerRadius(5)
                    }
                }
                
                VStack(alignment: .leading, spacing: 7) {
                    Text("What Gender Would You prefer to Speak to?")
                        .font(Font.custom("Judson", size: 15))
                        .foregroundColor(.black)
                    Picker("Gender",
                           selection: $genderPref) {
                        //                    Text("Gender")
                        //                        .tag("Gender")
                        Text("Female")
                            .tag("FemalePref")
                        Text("Male")
                            .tag("MalePref")
                        Text("Other")
                            .tag("OtherPref")
                    }
                    //                TextField("Gender", text: $gender)
                           .frame(width: 324, alignment: .leading)
                           .accentColor(Color.gray)
                    //                       .labelsHidden()
                           .padding(10)
                    //                       .foregroundColor(.black)
                           .frame(width: 324, height: 35)
                           .background(Color(red: 0.93, green: 0.87, blue: 0.76).opacity(0.76))
                           .cornerRadius(5)
                }
                Button {
                    Task {
                        addUser(fullName: self.fullName, username: self.username, gender: self.gender, age: self.age, genderPref: self.genderPref, netIDEmail: self.netIDEmail, isValid: self.isValid) }
                } label: {
                    Text("Continue")
                        .font(Font.custom("Judson", size: 19))
                        .foregroundColor(.white)
//                    NavigationLink(
////                        destination: HomeScreen(),
//                        destination: MessagesScreen(),
//                        label: {
//                            Text("Continue")
//                                .font(Font.custom("Judson", size: 19))
//                                .foregroundColor(.white)
//                        })
                }
                .padding()
                .foregroundColor(.clear)
                .frame(width: 324, height: 40)
                .background(Color(red: 0.45, green: 0.23, blue: 0.13))
                .cornerRadius(5)
                //            .frame(width: 390, height: 844)
                //            .background(.white);
            }
        }
    }
    func addUser(fullName: String, username: String, gender: String, age: Int, genderPref: String, netIDEmail: String, isValid: Bool) {
            let usersDatabase = Firestore.firestore()
            let userData = ["fullName": fullName, "username": username, "gender": gender, "age": age, "genderPref": genderPref, "netIDEmail": netIDEmail, "isValid": isValid] as [String : Any]
            let reference = usersDatabase.collection("Users").document()
            reference.setData(userData)
        //        { error in
        //            if let error = error {
        //                print(error.localizedDescription)
        //            }
                print("Checking")
        }
    }

#Preview {
    SignUpScreen()
}
