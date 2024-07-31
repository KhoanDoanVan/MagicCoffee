//
//  OrderView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 20/03/2024.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    @StateObject private var viewModelAseemblage = AssemblageViewModel()
    @StateObject var cartViewModel : CartViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var goToCart = false
    
    var imageName : String
    var coffeeName : String
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image(imageName)
                        .resizable()
                        .frame(width: 200, height: 150)
                        .scaledToFit()
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
                // amount
                HStack{
                    Text(coffeeName.capitalized)
                    
                    Spacer()
                    
                    HStack(spacing : 20){
                        Button{
                            if viewModel.amountState > 0 {
                                viewModel.amountState -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Text("\(viewModel.amountState)")
                        
                        Button{
                            viewModel.amountState += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .frame(width: 100, height: 30)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                }
                .padding(.horizontal, 10)
                .foregroundColor(.black)
                
                Divider()
                
                // ristretoo
                HStack{
                    Text("Ristretto")
                    Spacer()
                    HStack{
                        Button{
                            if viewModel.restritto == "One"{
                                viewModel.restritto = ""
                            } else {
                                viewModel.restritto = "One"
                            }
                        } label: {
                            ButtonRistretto(viewModel: viewModel, textButton: "One")
                        }
                        
                        Button{
                            if viewModel.restritto == "Two"{
                                viewModel.restritto = ""
                            } else {
                                viewModel.restritto = "Two"
                            }
                        } label: {
                            ButtonRistretto(viewModel: viewModel, textButton: "Two")
                        }
                    }
                    .foregroundColor(.black)
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                Divider()
                
                HStack{
                    Text("Onsite/Takeaway")
                    Spacer()
                    HStack(spacing : 20){
                        
                        Button{
                            if !viewModel.isOnsite {
                                viewModel.isOnsite.toggle()
                            }
                        }label : {
                            Image(systemName: "chair.lounge.fill")
                                .foregroundStyle(viewModel.isOnsite ? Color("CyanDark") : Color(.systemGray4))
                        }
                        
                        Button {
                            if viewModel.isOnsite {
                                viewModel.isOnsite.toggle()
                            }
                        } label : {
                            Image(systemName: "figure.walk")
                                .foregroundStyle(viewModel.isOnsite ? Color(.systemGray4) : Color("CyanDark"))
                        }
                    }
                    .font(.system(size: 30))
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                Divider()
                
                HStack{
                    Text("Volume, ml")
                    Spacer()
                    HStack(spacing: 10){
                        VStack{
                            Spacer()
                            Button{
                                viewModel.volume = "small"
                            } label : {
                                Image(systemName: "cup.and.saucer")
                                    .font(.system(size: 27))
                                    .foregroundStyle(viewModel.volume == "small" ? Color("CyanDark") : Color(.systemGray4))
                            }
                        }
                        VStack{
                            Spacer()
                            Button{
                                viewModel.volume = "medium"
                            } label : {
                                Image(systemName: "cup.and.saucer")
                                    .font(.system(size: 35))
                                    .foregroundStyle(viewModel.volume == "medium" ? Color("CyanDark") : Color(.systemGray4))
                            }
                        }
                        VStack{
                            Spacer()
                            Button{
                                viewModel.volume = "large"
                            } label : {
                                Image(systemName: "cup.and.saucer")
                                    .font(.system(size: 43))
                                    .foregroundStyle(viewModel.volume == "large" ? Color("CyanDark") : Color(.systemGray4))
                            }
                        }
                    }
                }
                .frame(height : 40)
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                Divider()
                
                VStack{
                    HStack{
                        Button{
                            withAnimation{
                                viewModel.isTime.toggle()
                            }
                        } label : {
                            Toggle("Prepare by a certain time today?", isOn: $viewModel.isTime)
                                .tint(Color("CyanDark"))
                        }
                    }
                    
                    if viewModel.isTime {
                        HStack{
                            Spacer()
                            DatePicker("", selection: $viewModel.timePicker, displayedComponents: .hourAndMinute)
                                        .labelsHidden()
                        }
                    }
                }
                .foregroundStyle(.black)
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                NavigationLink{
                    AssemblageView(viewModel: viewModelAseemblage, cartViewModel: cartViewModel)
                } label : {
                    ZStack{
                        Image("rectanglePlace")
                        HStack{
                            HStack{
                                Image(systemName: "lasso.badge.sparkles")
                                Text("Coffee lover assemblage")
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 50)
                    }
                }
                
                Spacer()
                
                VStack{
                    HStack{
                        Text("Total Amount")
                        Spacer()
                        Text(String(format: "VND : %0.3f", Double(viewModel.amountState) * 30.0))
                    }
                    .padding(.horizontal, 10)
                    .fontWeight(.semibold)
                    
                    Button{
                        if viewModel.amountState > 0 {
                            cartViewModel.addItemToList(
                                item: Cart(nameCoffee: coffeeName, imageCoffee: imageName, total: Double(viewModel.amountState) * 30.0, orderCoffee: Order(amountState: viewModel.amountState, restritto: viewModel.restritto, isOnsite: viewModel.isOnsite, volume: viewModel.volume, timePicker: viewModel.timePicker, assemblage: Assemblage(roasting: viewModelAseemblage.roasting, speed: viewModelAseemblage.speed, grind: viewModelAseemblage.grind, ice: viewModelAseemblage.ice, milkSelected: viewModelAseemblage.milkSelected, syrupSelected: viewModelAseemblage.syrupSelected, baristaSelected: viewModelAseemblage.baristaSelected, countrySelected: viewModelAseemblage.countrySelected.name, citySelected: viewModelAseemblage.citySelected.name, additiveSelected: viewModelAseemblage.additiveSelected)))
                            )
                            
                            dismiss()
                        }
                    } label: {
                        Text("Add To Cart")
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                            .background(Color("CyanDark"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                }
            }
            .padding(20)
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement : .topBarLeading){
                    Button{
                        withAnimation{
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                
                ToolbarItem(placement : .topBarTrailing){
                    Button{
                        goToCart.toggle()
                    } label: {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
            .navigationDestination(isPresented: $goToCart){
//                CartView(viewModel: cartViewModel)
            }
        }
    }
}

#Preview {
    OrderView(cartViewModel: CartViewModel(),imageName: "", coffeeName: "")
}
