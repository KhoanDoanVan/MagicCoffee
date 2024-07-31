//
//  BaristaChoiceView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import SwiftUI

struct BaristaChoiceView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : AssemblageViewModel
    @StateObject var cartViewModel : CartViewModel
    @State private var goToCart = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment : .leading){
                Text("Select a barista")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(spacing : 20){
                    ForEach(viewModel.listBarista){ barista in
                        Button {
                            viewModel.baristaSelected = barista
                            dismiss()
                        } label: {
                            HStack(spacing : 5){
                                Image(barista.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(20)
                                
                                Spacer()
                                
                                HStack{
                                    VStack(alignment : .leading){
                                        Text(barista.name)
                                            .font(.title3)
                                            .foregroundStyle(viewModel.baristaSelected.name == barista.name ? .white : .black)
                                        Text(barista.role)
                                            .foregroundStyle(Color(.systemGray))
                                    }
                                    Spacer()
                                    Image(systemName: "circle.fill")
                                        .foregroundStyle(barista.status == true ? .green : .red)
                                        .cornerRadius(20)
                                }
                            }
                            .padding()
                            .background(viewModel.baristaSelected.name == barista.name ? Color("CyanDark") : Color(.systemGray6))
                            .cornerRadius(20)
                            .shadow(radius: 7, x: 2, y: 10)
                        }
                    }
                }
                
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
//                CartView(viewModel: cartViewModel)
            }
        }
    }
}

#Preview {
    BaristaChoiceView(viewModel: AssemblageViewModel(), cartViewModel: CartViewModel())
}
