//
//  ColorDropDown.swift
//  PennyTrail
//
//  Created by Allan on 12/24/24.
//

import SwiftUI

struct ColorDropDown: View {
    @Binding var selectedColor: ThemeModel
    
    private let colorThemes: [ThemeModel] = [ThemeModel(name: "Cyan", color: 0x00FFFF), ThemeModel(name: "Green", color: 0x00FF00), ThemeModel(name: "Yellow", color: 0xFFFF00), ThemeModel(name: "Navy", color: 0x000080), ThemeModel(name: "Red", color: 0xFF0000), ThemeModel(name: "Purple", color: 0x800080), ThemeModel(name: "Turqoise", color: 0x30D5C8), ThemeModel(name: "Brown", color: 0x964B00), ThemeModel(name: "Magenta", color: 0xFF00FF), ThemeModel(name: "Gold", color: 0xFFD700), ThemeModel(name: "Army Green", color: 0x4B5320), ThemeModel(name: "Pink", color: 0xFF8DA1), ThemeModel(name: "Orange", color: 0xFFA500)]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Menu {
                ForEach(colorThemes, id: \.self) { theme in
                    Button(action: {
                        selectedColor = theme
                    }) {
                        Text(theme.name)
                    }
                }
            } label: {
                HStack {
                    HStack{
                        Rectangle().frame(width: 10, height: 10).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(.trailing, 4).foregroundStyle(Color(hex: selectedColor.color))
                        Text(selectedColor.name).foregroundStyle(Color.black)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    ColorDropDown()
//}
