//
//  LoginView.swift
//  PennyTrail
//
//  Created by Allan on 12/4/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack{
            Color(hex:0xF8F4F0)
            VStack(alignment: .leading){
                Text("Login").font(.title).fontWeight(.bold).padding(.bottom, 30)
                Text("Email").foregroundStyle(Color(hex: 0x696968))
                TextField("", text: $email).autocorrectionDisabled().padding(.bottom)
                Text("Password").foregroundStyle(Color(hex: 0x696968))
                PasswordFieldComponent(password: password).padding(.bottom, 28)
                Button{
                } label: {
                    Text("Login").fontWeight(.bold).frame(maxWidth: .infinity)
                }.buttonStyle(.borderedProminent).tint(.black).padding(.bottom, 32)
                HStack{
                    Text("Need to create an account?").foregroundStyle(Color(hex: 0x696968))
                    Button{
                        
                    }label: {
                        Text("Sign Up").underline().foregroundStyle(.black).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }.padding(.bottom)
            }.padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 0)
                .padding(.horizontal, 20).textFieldStyle(.roundedBorder)
        }.background(Color(hex:0xF8F4F0))
    }
}

#Preview {
    LoginView()
}
