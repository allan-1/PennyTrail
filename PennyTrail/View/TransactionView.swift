//
//  TransactionView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI

struct TransactionView: View {
    @State private var searchText: String = ""
    let transList = [1,2,3,4,5]
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex:0xF8F4F0)
                ScrollView {VStack{
                    HStack{
                        SearchFieldComponent(searchText: searchText)
                        Button{
                            
                        }label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill").foregroundStyle(.black)
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "arrow.up.and.down.text.horizontal").foregroundStyle(.black)
                        }
                    }.padding()
                    LazyVStack{
                        ForEach(transList, id:\.self){
                            trans in TransactionItemComponent()
                        }
                    }.padding()
                    HStack{
                        Button{
                            
                        }label:{
                            Image(systemName: "arrowtriangle.left.fill").foregroundStyle(.black)
                        }.buttonStyle(.bordered)
                        Button{
                            
                        }label:{
                            Image(systemName: "arrowtriangle.right.fill").foregroundStyle(.black)
                        }.buttonStyle(.bordered)
                    }.padding()
                }.frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 0)
                        .padding(.horizontal, 20).textFieldStyle(.roundedBorder)
                }
            }.background(Color(hex:0xF8F4F0)).navigationTitle("Transactions").toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }.tint(.black)
                }
            }
        }
    }
}

#Preview {
    TransactionView()
}
