//
//  SignUpView.swift
//  PennyTrail
//
//  Created by Allan on 12/6/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var nameField: String = ""
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    var body: some View {
        ZStack{
            Color(hex:0xF8F4F0)
            VStack(alignment: .leading){
                Text("Sign Up").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title).padding(.bottom, 32)
                Text("Name").foregroundStyle(Color(hex: 0x696968))
                TextField("", text: $nameField).padding(.bottom, 24)
                Text("Email").foregroundStyle(Color(hex: 0x696968))
                TextField("", text: $emailField).padding(.bottom, 24)
                Text("Password").foregroundStyle(Color(hex: 0x696968))
                PasswordFieldComponent(password: passwordField).padding(.bottom, 8)
                Text("Password must be at least 8 Characters").font(.footnote).foregroundStyle(Color(hex: 0x64748b)).padding(.bottom, 28).frame(maxWidth: .infinity, alignment: .trailing)
                Button{
                    
                }label: {
                    Text("Create Account").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 28)
                HStack{
                    Text("Need to create an account?").foregroundStyle(Color(hex: 0x696968))
                    Button{
                        
                    }label: {
                        Text("Login").underline().foregroundStyle(.black).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }.padding(.bottom)
            }.padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 0)
                .padding(.horizontal, 20).textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    SignUpView()
}
