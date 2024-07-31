//
//  MenuView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 20/03/2024.
//

import SwiftUI

struct MenuView: View {
    private let gridItem : [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible())
    ]
    private let widthItem = (UIScreen.main.bounds.width - 50) / 2
    
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView(.vertical){
                    VStack(alignment : .leading){
                        Text("Select Your Coffee")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        LazyVGrid(columns : gridItem, spacing: 10){
                            ForEach(CoffeeType.allCases){ item in
                                withAnimation{
                                    NavigationLink {
                                        OrderView(cartViewModel : cartViewModel, imageName: item.imageCoffee, coffeeName: item.nameCoffee)
                                    } label: {
                                        ZStack{
                                            VStack{
                                                Image(item.imageCoffee)
                                                Text(item.nameCoffee.capitalized)
                                                    .textInputAutocapitalization(.characters)
                                                    .foregroundColor(Color("CyanDark"))
                                                    
                                            }
                                        }
                                        .frame(width: widthItem, height: 200)
                                        .background(.white)
                                        .cornerRadius(30)
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50)
                    .background(Color("CyanDark"))
                    .cornerRadius(25)
                    .padding(.top, 100)
                }
                
                VStack{
                    HStack{
                        VStack(alignment : .leading, spacing: 5){
                            Text("Welcome!")
                                .font(.system(size: 15))
                                .foregroundStyle(Color(.systemGray))
                            Text(profileViewModel.user.username.capitalized)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                        }
                        
                        Spacer()
                        
                        HStack(spacing : 20){
                            NavigationLink{
                                CartView(viewModel : cartViewModel, profileViewModel: profileViewModel)
                            } label: {
                                Image(systemName: "cart")
                            }
                            
                            NavigationLink{
                                ProfileView(viewModel : profileViewModel)
                            } label: {
                                Image(systemName: "person")
                            }
                        }
                        .font(.system(size: 25))
                        .foregroundColor(Color("CyanDark"))
                    }
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
