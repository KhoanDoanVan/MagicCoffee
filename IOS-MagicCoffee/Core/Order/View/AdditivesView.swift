//
//  SortView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import SwiftUI

struct AdditivesView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : AssemblageViewModel
    @StateObject var cartViewModel : CartViewModel
    @State private var goToCart = false
    
    var body: some View {
        NavigationStack{
            
            VStack(alignment : .leading){
                Text("Select additives")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack{
                    ForEach(viewModel.listAdditives) { additive in
                        Button {
                            if let index = viewModel.additiveSelected.firstIndex(where: { $0.name == additive.name }) {
                                viewModel.additiveSelected.remove(at: index)
                            } else {
                                viewModel.additiveSelected.append(additive)
                            }
                        } label: {
                            VStack{
                                HStack {
                                    Text(additive.name)
                                    Spacer()
                                    if viewModel.additiveSelected.contains(where: { $0.name == additive.name }) {
                                        Image(systemName: "checkmark")
                                    }
                                }
                                .padding(.vertical)
                                .font(.title2)
                                .foregroundStyle(viewModel.additiveSelected.contains(where: { $0.name == additive.name }) ? .blue : .black)
                                
                                Divider()
                            }
                        }
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding(20)
            .navigationTitle("Coffee lover assemblage")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement : .topBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
                ToolbarItem(placement : .topBarTrailing){
                    Button {
                        goToCart.toggle()
                    } label: {
                        Image(systemName: "cart")
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
            }
            .navigationDestination(isPresented: $goToCart){
//                CartView(viewModel : cartViewModel)
            }
        }
    }
}

#Preview {
    AdditivesView(viewModel: AssemblageViewModel(), cartViewModel: CartViewModel())
}
