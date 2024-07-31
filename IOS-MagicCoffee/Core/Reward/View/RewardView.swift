//
//  RewardView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 26/03/2024.
//

import SwiftUI

struct RewardView: View {
    @StateObject private var viewModel = RewardViewModel()
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("Rewards")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width-40, height: 150)
                        .foregroundColor(Color("CyanDark"))
                        .cornerRadius(20)
                    VStack(spacing: 20){
                        HStack{
                            Text("Loyalty card")
                            Spacer()
                            Text("\(viewModel.getAmountRoyal()) / 8")
                        }
                        .padding(.horizontal, 30)
                        .fontWeight(.semibold)
                        
                        HStack(spacing: 2){
                            ForEach(0..<viewModel.royalCart.count){ index in
                                if viewModel.royalCart[index] != nil {
                                    Image("rewardActive")
                                } else {
                                    Image("reward")
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width-100, height: 70)
                        .background(.white)
                        .cornerRadius(15)
                    }
                    .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width-40, height: 150)
                
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width-40, height: 150)
                        .foregroundColor(Color("CyanDark"))
                        .cornerRadius(20)
                    HStack{
                        VStack(spacing: 5){
                            Text("My Points:")
                            Text("\(viewModel.point)")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        NavigationLink{
                            RedeemView(viewModelReward: viewModel)
                        }label: {
                            Rectangle()
                                .frame(width: 130, height: 40)
                                .foregroundStyle(Color(.systemGray))
                                .opacity(0.5)
                                .cornerRadius(10)
                                .overlay{
                                    Text("Redeem drinks")
                                        .font(.footnote)
                                }
                        }
                    }
                    .padding(.horizontal, 30)
                    .foregroundStyle(.white)
                }
                .frame(width: UIScreen.main.bounds.width-40, height: 150)
                
                VStack(alignment: .leading){
                    Text("History Rewards")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 30)
                    
                    VStack{
                        List(viewModel.listRewards){ reward in
                            HStack{
                                VStack(alignment : .leading){
                                    Text(reward.nameCoffee.capitalized)
                                        .fontWeight(.semibold)
                                    Text("\(viewModel.getDateFollowFormat(date: reward.dateOrder))")
                                        .foregroundStyle(Color(.systemGray))
                                        .font(.footnote)
                                }
                                Spacer()
                                Text("+ \(reward.pts) Pts")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            }
                            .listRowBackground(Color(.white))
                        }
                        .frame(height: 250)
                        .background(.white)
                        .scrollContentBackground(.hidden)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    RewardView()
}
