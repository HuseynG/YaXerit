//
//  ContentView.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 18/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    @State private var showEmailNeedsToBeVerifiedAlert = false
    func getUser() {
        session.listen()
    }
    func isUserVerified() -> Bool {
        if session.checkUserEmailVerification() == true { //        if email is verified
            return true
        } else { //        else email is not verifed
            return false
        }
    }
    func signOuDueToNotVerifiedAccount(){
        print("signed out due to not verifed email")
        session.signOut()
    }
    
    
    var body: some View {
        NavigationView{
            Group{
                if (session.session != nil){
    //                if email is verified
                    if isUserVerified() == true {test(showAlert: false)}else{
                        test(showAlert: true)
                    }
                }else {
                    LoginPage()
                }
            }.onAppear(perform: getUser)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
