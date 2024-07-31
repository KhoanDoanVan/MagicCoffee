//
//  CartView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : CartViewModel
    @StateObject var profileViewModel : ProfileViewModel
    @State private var isOpenSheetPayment : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.listCart.count != 0 {
                    VStack(alignment : .leading, spacing : 40){
                        Text("My Order")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)
                        
                        VStack{
                            List(viewModel.listCart){ item in
                                HStack{
                                    HStack{
                                        Image(item.imageCoffee)
                                            .resizable()
                                            .frame(width: 80, height: 70)
                                        VStack(alignment : .leading, spacing : 5){
                                            Text(item.nameCoffee.capitalized)
                                                .fontWeight(.semibold)
                                            // how to use options here
                                            Text("\(item.orderCoffee.restritto).\(item.orderCoffee.volume.capitalized).\(item.orderCoffee.isOnsite ? "Onsite" : "Takeaway")")
                                                .font(.system(size: 15))
                                                .foregroundStyle(Color(.systemGray))
                                            Text("x \(item.orderCoffee.amountState)")
                                                .fontWeight(.semibold)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Text("VND")
                                        Text(String(format: "%.3f", item.total))
                                    }
                                    .fontWeight(.semibold)
                                }
                                .listRowBackground(Color(.systemGray6))
                                .padding()
                                .frame(width : UIScreen.main.bounds.width - 40)
                                .cornerRadius(20)
                                .swipeActions(){
                                    Button {
                                        viewModel.removeItemFromList(item: item)
                                    } label: {
                                        Image(systemName: "trash")
                                            .font(.system(size: 30))
                                            .tint(.red).opacity(0.5)
                                            .foregroundStyle(.red)
                                    }
                                }
                            }
                            .listRowSpacing(10.0)
                            .background(.white)
                            .scrollContentBackground(.hidden)
                            .scrollIndicators(.hidden)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 500)
                        
                        
                        HStack{
                            VStack{
                                Text("Total price")
                                    .font(.callout)
                                    .foregroundStyle(Color(.systemGray))
                                Text(String(format: "%0.3f",  viewModel.totalPriceIntoCart() ))
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                            Button{
                                isOpenSheetPayment.toggle()
                            }label: {
                                HStack(spacing : 20){
                                    Image(systemName : "cart")
                                        .font(.system(size: 20))
                                    Text("Payment")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 200, height: 60)
                                .background(Color("CyanDark"))
                                .foregroundStyle(.white)
                                .cornerRadius(40)
                            }
                        }
                        .padding(20)
                    }
                } else {
                    VStack{
                        VStack(spacing : 10){
                            Image(systemName: "cart.badge.plus")
                                .font(.system(size: 60))
                            Text("Oops, you haven't ordered anything yet !")
                        }
                        .foregroundStyle(Color(.systemGray))
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement : .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "arrow.backward")
                            .padding()
                            .foregroundStyle(.black)
                    }
                }
            }
            .sheet(isPresented: $isOpenSheetPayment){
                VStack{
                    Text("Order Payment")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                        .padding(.bottom, 30)
                    VStack(alignment : .leading){
                        HStack(spacing : 20){
                            Rectangle()
                                .frame(width : 60, height: 60)
                                .foregroundStyle(Color(.systemGray6))
                                .cornerRadius(20)
                                .overlay{
                                    Image(systemName: "cart")
                                        .font(.system(size: 20))
                                }
                            VStack(alignment : .leading){
                                Text(profileViewModel.user.username.capitalized)
                                    .fontWeight(.semibold)
                                Text("Magic Coffee store")
                                    .font(.footnote)
                                    .foregroundStyle(Color(.systemGray))
                                    .fontWeight(.semibold)
                                Text(profileViewModel.user.addressCoffee)
                                    .font(.footnote)
                                    .foregroundStyle(Color(.systemGray))
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                    }
                    VStack(spacing : 10){
                        HStack{
                            Button{
                                viewModel.paymentChoice = "OnlinePayment"
                            }label: {
                                ZStack{
                                    Image(systemName: "circle")
                                        .font(.system(size: 25))
                                        .foregroundStyle(Color(.systemGray))
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 15))
                                        .foregroundStyle(viewModel.paymentChoice == "OnlinePayment" ? .black : Color(.systemGray6))
                                }
                            }
                            Spacer()
                            VStack(alignment : .leading){
                                Text("Online Payment")
                                    .fontWeight(.semibold)
                                Text("Assist Belarus")
                                    .font(.caption)
                                    .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                            Image("payment1")
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        
                        VStack{
                            HStack{
                                Button{
                                    viewModel.paymentChoice = "CreditCard"
                                }label: {
                                    ZStack{
                                        Image(systemName: "circle")
                                            .font(.system(size: 25))
                                            .foregroundStyle(Color(.systemGray))
                                        Image(systemName: "circle.fill")
                                            .foregroundStyle(viewModel.paymentChoice == "CreditCard" ? .black : Color(.systemGray6))
                                    }
                                }
                                Spacer()
                                VStack(alignment : .leading){
                                    Text("Credit Card")
                                        .fontWeight(.semibold)
                                    Text("2930 xxxx xxxx 1024")
                                        .font(.caption)
                                        .foregroundStyle(Color(.systemGray))
                                }
                                Spacer()
                                HStack{
                                    Image("payment")
                                    Image("payment2")
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Amount")
                        Spacer()
                        Text("VND : \(String(format: "%0.3f",  viewModel.totalPriceIntoCart() ))")
                    }
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                    HStack{
                        VStack(alignment : .leading){
                            Text("Total price")
                                .font(.callout)
                                .foregroundStyle(Color(.systemGray))
                            Text(String(format: "%0.3f",  viewModel.totalPriceIntoCart() ))
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        Button{
                            isOpenSheetPayment.toggle()
                        }label: {
                            HStack(spacing : 20){
                                Image(systemName : "cart")
                                    .font(.system(size: 20))
                                Text("Payment")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 200, height: 60)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(40)
                        }
                    }
                }
                .padding(30)
                .presentationDetents([.height(640)])
                .presentationCornerRadius(30)
            }
        }
    }
}


#Preview {
    CartView(viewModel : CartViewModel(), profileViewModel: ProfileViewModel())
}
