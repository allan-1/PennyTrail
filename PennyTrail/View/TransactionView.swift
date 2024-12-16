//
//  TransactionView.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    @StateObject private var transactionViewModel: TransactionViewModel
    
    @State private var isShowingSheet = false
    
    init(modelContext: ModelContext){
        _transactionViewModel = StateObject(wrappedValue: TransactionViewModel(modelContext: modelContext))
    }
    @State private var searchText: String = ""
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
                        ForEach(transactionViewModel.transactions, id:\.id){
                            trans in TransactionItemComponent(transactionName: trans.name, transactionCategory: trans.category, transactionAmount: "\(trans.amount)", transactionDate: trans.date)
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
                        isShowingSheet.toggle()
                    }label: {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }.tint(.black)
                }
            }.sheet(isPresented: $isShowingSheet) {
                AddTransactionSheet(isPresented: $isShowingSheet, transactionViewModel: transactionViewModel).onDisappear {
                    transactionViewModel.fetchTransactions()
                }
            }
        }
    }
}

//#Preview {
//    TransactionView()
//}
