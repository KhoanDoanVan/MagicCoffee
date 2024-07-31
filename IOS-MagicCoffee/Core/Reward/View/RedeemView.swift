//
//  Redeem.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 26/03/2024.
//

import SwiftUI

struct RedeemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = RedeemViewModel()
    var viewModelReward : RewardViewModel
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack(spacing: 20){
                        ForEach(viewModel.listRedeem){ redeem in
                            HStack{
                                HStack{
                                    Image(redeem.coffeeImage)
                                        .resizable()
                                        .frame(width: 70, height: 60)
                                    VStack(alignment: .leading){
                                        Text(redeem.coffeeName.capitalized)
                                            .fontWeight(.semibold)
                                        Text("Valid until \(viewModel.getDateFollowFormat(date: redeem.validTime))")
                                            .font(.footnote)
                                            .foregroundStyle(Color(.systemGray))
                                    }
                                }
                                Spacer()
                                VStack{
                                    Button{
                                        viewModelReward.point -= redeem.pts
                                        viewModel.checkActive(point: viewModelReward.point)
                                    }label: {
                                        Text("\(redeem.pts) pts")
                                            .frame(width: 100, height: 35)
                                            .background(redeem.active ? Color(.systemGray2) : Color("CyanDark"))
                                            .foregroundStyle(.white)
                                            .font(.system(size: 13))
                                            .cornerRadius(20)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .disabled(redeem.active)
                            }
                        }
                    }
                }
            }
            .padding(20)
            .navigationTitle("Redeem")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
            .onAppear{
                viewModel.checkActive(point: viewModelReward.point)
            }
        }
    }
}

#Preview {
    RedeemView(viewModelReward: RewardViewModel())
}
