//
//  PasswordFieldComponent.swift
//  PennyTrail
//
//  Created by Allan on 12/5/24.
//

import SwiftUI

struct PasswordFieldComponent: View {
    @State var password: String
    @State private var isSecured: Bool = true
    var body: some View {
        ZStack(alignment: .trailing){
            if isSecured{
                SecureField("", text: $password).autocorrectionDisabled()
            }else{
                TextField("", text: $password).autocorrectionDisabled()
            }
            Button{
                isSecured.toggle()
            }label:{
                Image(systemName: isSecured ? "eye.slash" : "eye").tint(.black)
            }.padding(.trailing, 4)
        }
    }
}

#Preview {
    PasswordFieldComponent(password: "")
}
