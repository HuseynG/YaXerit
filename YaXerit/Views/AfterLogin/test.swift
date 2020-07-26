//
//  test.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 24/07/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//
import SwiftUI
struct test: View {
    @EnvironmentObject var session: SessionStore
    @State var showAlert: Bool
    @State var showLoginView = false
    func signOut(){
        session.signOut()
    }
    var body: some View {
        VStack{
            NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true)
            , isActive: $showLoginView){
                EmptyView() // ofset it afterwards
            }
            Text("Hello, there, welcome to main view!")
            Text("You have successfully loged in!")
            Button(action:{
                self.signOut()
            }){
                Text("Sign out")
            }
        }.alert(isPresented: $showAlert) { () -> Alert in
            Alert(
                title: Text("Verification needed!"),
                message: Text("Please verify your email address. Your account is not verified."),
                dismissButton: .default(Text("Okay"), action: {
                    print("Okay tapped")
                    self.signOut()
                    self.showLoginView.toggle()
                })
            )
        }
    }
}

//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        test()
//    }
//}
