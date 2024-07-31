//
//  AssemblageView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import SwiftUI

struct AssemblageView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel : AssemblageViewModel
    @StateObject var cartViewModel : CartViewModel
    @State private var isOpenSheetMilk = false
    @State private var isOpenSheetSyrup = false
    @State private var goToCart = false
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    
                    NavigationLink{
                        BaristaChoiceView(viewModel: viewModel, cartViewModel: cartViewModel)
                    } label: {
                        HStack{
                            Text("Select a barista")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 10)
                    
                    Divider()
                    
                    HStack(alignment: .top, spacing : 20){
                        Text("Coffee type")
                            .padding(.top, 8)
                        VStack{
                            Slider(value: $viewModel.speed, in: 0...100)
                                .accentColor(Color("CyanDark"))
                            HStack{
                                Text("Arabica")
                                Spacer()
                                Text("Robusta")
                            }
                            .foregroundStyle(Color(.systemGray))
                            .font(.system(size: 15))
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                    
                    NavigationLink{
                        SortView(viewModel : viewModel)
                    } label: {
                        HStack{
                            Text("Coffee sort")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.black)
                    
                    Divider()
                    
                    HStack{
                        Text("Roasting")
                        Spacer()
                        HStack(alignment : .bottom, spacing : 20){
                            Button{
                                viewModel.roasting = "small"
                            } label: {
                                Image(viewModel.roasting == "small" ? "fireActive" : "fireInactive")
                            }
                            
                            Button{
                                viewModel.roasting = "medium"
                            } label: {
                                HStack(spacing : -5){
                                    Image(viewModel.roasting == "medium" ? "fireActive" : "fireInactive")
                                    Image(viewModel.roasting == "medium" ? "fireActive" : "fireInactive")
                                }
                            }
                            
                            Button {
                                viewModel.roasting = "large"
                            } label : {
                                VStack(spacing : 0){
                                    Image(viewModel.roasting == "large" ? "fireActive" : "fireInactive")
                                    HStack(spacing : -5){
                                        Image(viewModel.roasting == "large" ? "fireActive" : "fireInactive")
                                        Image(viewModel.roasting == "large" ? "fireActive" : "fireInactive")
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                    
                    HStack{
                        Text("Grinding")
                        Spacer()
                        HStack(spacing : 40){
                            Button {
                                viewModel.grind = "small"
                            } label: {
                                Image(viewModel.grind == "small" ? "grindSmall" : "grindLarge")
                                    .resizable()
                                    .frame(width: 25, height : 25)
                            }
                            
                            Button {
                                viewModel.grind = "large"
                            } label: {
                                Image(viewModel.grind == "large" ? "grindSmall" : "grindLarge")
                                    .resizable()
                                    .frame(width: 40, height : 40)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    
                    Divider()
                    
                    HStack{
                        Text("Milk")
                        Spacer()
                        Button {
                            isOpenSheetMilk.toggle()
                        } label: {
                            Text(viewModel.milkSelected == "" ? "Select" : viewModel.milkSelected.capitalized)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.black)
                    
                    Divider()
                    
                    HStack{
                        Text("Syrup")
                        Spacer()
                        Button {
                            isOpenSheetSyrup.toggle()
                        } label: {
                            Text(viewModel.syrupSelected == "" ? "Select" : viewModel.syrupSelected.capitalized)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.black)
                    
                    Divider()
                    
                    NavigationLink{
                        AdditivesView(viewModel: viewModel, cartViewModel : cartViewModel)
                    } label: {
                        HStack{
                            Text("Additives")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.black)
                    
                    Divider()
                    
                    HStack(){
                        Text("Ice")
                        Spacer()
                        HStack(spacing : 30){
                            Button {
                                viewModel.ice = "small"
                            } label: {
                                Image(systemName: "square")
                                    .padding(.top, -5)
                                    .foregroundStyle(viewModel.ice == "small" ? .black : Color(.systemGray3))
                            }
                            
                            Button{
                                viewModel.ice = "medium"
                            } label: {
                                HStack(spacing : 0){
                                    Image(systemName: "square")
                                        .foregroundStyle(viewModel.ice == "medium" ? .black : Color(.systemGray3))
                                    Image(systemName: "square")
                                        .foregroundStyle(viewModel.ice == "medium" ? .black : Color(.systemGray3))
                                        .padding(.top)
                                }
                            }
                            
                            Button {
                                viewModel.ice = "large"
                            } label: {
                                VStack{
                                    Image(systemName: "square")
                                        .foregroundStyle(viewModel.ice == "large" ? .black : Color(.systemGray3))
                                    HStack(spacing : 0){
                                        Image(systemName: "square")
                                            .foregroundStyle(viewModel.ice == "large" ? .black : Color(.systemGray3))
                                        Image(systemName: "square")
                                            .foregroundStyle(viewModel.ice == "large" ? .black : Color(.systemGray3))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    
                }
                .padding(.horizontal, 10)
                Spacer()
                VStack{
                    HStack{
                        Text("Total Amount")
                        Spacer()
                        Text("VND: 30.000")
                    }
                    .padding(.horizontal, 10)
                    .fontWeight(.semibold)
                    
                    Button{
                        dismiss()
                    } label: {
                        Text("Finish Assemblage")
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                            .background(Color("CyanDark"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                }
            }
            .sheet(isPresented: $isOpenSheetMilk){
                VStack{
                    Text("What type of milk do you prefer?")
                    ForEach(viewModel.listMike){milk in
                        Button{
                            viewModel.milkSelected = milk.name
                            isOpenSheetMilk.toggle()
                        } label : {
                            Text(milk.name.capitalized)
                                .font(.system(size: 20))
                                .frame(width: 300, height: 40)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.systemGray), lineWidth : 1)
                                }
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button{
                        isOpenSheetMilk.toggle()
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(width: 300, height: 40)
                            .foregroundStyle(.white)
                            .background(Color("CyanDark"))
                            .cornerRadius(10)
                    }
                }
                .padding()
                .presentationDetents([.height(340)])
                .presentationCornerRadius(30)
            }
            .sheet(isPresented: $isOpenSheetSyrup){
                VStack{
                    Text("What type of milk do you prefer?")
                    ForEach(viewModel.listSyrup){syrup in
                        Button{
                            viewModel.syrupSelected = syrup.name
                            isOpenSheetSyrup.toggle()
                        } label : {
                            Text(syrup.name.capitalized)
                                .font(.system(size: 20))
                                .frame(width: 300, height: 40)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.systemGray), lineWidth : 1)
                                }
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button{
                        isOpenSheetSyrup.toggle()
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(width: 300, height: 40)
                            .foregroundStyle(.white)
                            .background(Color("CyanDark"))
                            .cornerRadius(10)
                    }
                }
                .padding()
                .presentationDetents([.height(340)])
                .presentationCornerRadius(30)
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
    AssemblageView(viewModel : AssemblageViewModel(), cartViewModel: CartViewModel())
}
