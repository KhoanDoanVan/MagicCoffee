//
//  MenuView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 20/03/2024.
//

import SwiftUI

struct TabMenuView: View {
    @State private var selected = 0
    
    var body: some View {
        NavigationStack{
            TabView(selection : $selected){
                MenuView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selected == 0 ? .fill : .none)
                    }
                    .onAppear{
                        selected = 0
                    }
                    .tag(0)
                
                RewardView()
                    .tabItem {
                        Image(systemName: "gift")
                            .environment(\.symbolVariants, selected == 1 ? .fill : .none)
                    }
                    .onAppear{
                        selected = 1
                    }
                    .tag(1)
                
                Text("OrderView")
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                            .environment(\.symbolVariants, selected == 2 ? .fill : .none)
                    }
                    .onAppear{
                        selected = 2
                    }
                    .tag(2)            }
            .navigationBarBackButtonHidden(true)
            .tint(Color("CyanDark"))
        }
    }
}

#Preview {
    TabMenuView()
}
