//
//  SignupPage.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 23/07/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import FirebaseAuth
// add name to data base and also other values. when user is signed up they will have id assign to their email address the based on that id we create a row in the database and assign user meta data to that id.
struct SignupPage: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State private var showEmailNeedsToBeVerifiedAlert = false
    @EnvironmentObject var session: SessionStore
    @State var showLoginView = false//should be false
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
//            print("____\(String(describing: error))")
            if let error = error {
                if let errCode = AuthErrorCode(rawValue: error._code) {
                    print("**********************")
                    print("Error type: ", error._code)
                    print("**********************")
                    self.error = self.session.returnErrorCorrespondingMessageToSignup(of: errCode)
                }
                return
                //
            } else {
                self.email = ""
                self.name = ""
                self.password = ""
                self.session.SendVerificationEmail()
                self.showEmailNeedsToBeVerifiedAlert = true
            }
        }
    }
    
    var body: some View {
        
        VStack{
//            navigation link is problematic
//            NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true)
//            , isActive: $showLoginView){
//                EmptyView().frame(width: 0, height: 0) // ofset it afterwards
//            }
            // back to main screen, root
            
            // email
            TextField("Email address", text: $email)
            
            // nickname
            TextField("Name", text: $name)
            
            // pass
            SecureField("Password", text: $password)
            
            // sign up button
            Button(action:{
                self.signUp()
            }){
                Text("Create an account")
            }.alert(isPresented: $showEmailNeedsToBeVerifiedAlert) { () -> Alert in
                Alert(
                    title: Text("Verification needed!"),
                    message: Text("Congradulations, you have successfully registered. Please verify your email address before logging in."),
                    dismissButton: .default(Text("Okay"), action: {
                        print("Okay tapped")
//                        self.showLoginView.toggle()
                        self.session.signOut()
                    })
                )
            }
            // show error
            if (error != ""){
                // get the type of error and, errormesage variable is changing accordingly eacch time
                Text(error)
            }
            Spacer()
        }
//        .padding().navigationBarTitle("")
//        .navigationBarHidden(true)
        
        
    }
}

struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage()
    }
}
