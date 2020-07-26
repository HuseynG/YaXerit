//
//  LoginPage.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 23/07/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    @State private var showEmailNeedsToBeVerifiedAlert = false

    func isUserVerified() -> Bool {
        if session.checkUserEmailVerification() == true { //        if email is verified
            return true
        } else { //        else email is not verifed
            return false
        }
    }
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
//            print("____\(String(describing: error))")
            if let error = error {
                if let errCode = AuthErrorCode(rawValue: error._code) {
                    print("**********************")
                    print("Error type: ", error._code)
                    print("**********************")
                    self.error = self.session.returnErrorCorrespondingMessageToLogin(of: errCode)
                    
                }
                return
            }else{
                self.email = ""
                self.password = ""
                
            }
        }
    }
    func removeTextFieldsContent() {
        self.email = ""
        self.password = ""
    }
    
    var body: some View {
//        NavigationView{
            VStack{
                // email
                TextField("Enter your email address", text: $email)
                // pass
                SecureField("Enter your password", text: $password)
                
                // login button
                Button(action: {
//                    if verifed account
                    print(1)
                    self.signIn()

                }){
                    Text("Log in")
                }
                // dont have account? sign up now. this is navigation to sign up
                NavigationLink(destination: SignupPage().onAppear {
                    self.removeTextFieldsContent()
                }) {
                    HStack{
                        
                        Text("Create an account!")
                    }
                }
                // show error
                if (error != ""){ // ???????????????????? which error
                    Text(error)
                }
                
            }
//        }.padding()
        
        // error checking should be done, any labels for showing errors ?
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
