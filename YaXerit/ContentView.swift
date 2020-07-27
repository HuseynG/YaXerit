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
    func reloadUserr(){
        session.reloadUser()
    }
    func isUserVerified() -> Bool {
        self.reloadUserr()
        if session.checkUserEmailVerification() == true { //        if email is verified
            print("yes verified, this message from content view")
            return true
        } else { //        else email is not verifed
            print("From content view: isUserVerified returns \(session.checkUserEmailVerification())")
            return false
        }
    }
    
    var body: some View {
        NavigationView{
            Group{
                if (session.session != nil){
                    // reload user here
                    
                    if isUserVerified() == true {test(showAlert: false)}else{
                        test(showAlert: true)
                    }
                    //
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
