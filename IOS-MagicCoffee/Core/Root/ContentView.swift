//
//  ContentView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    VStack{
                        ZStack{
                            Image("Vector")
                                .padding(.top, 60)
                            Image("Magic Coffee")
                                .padding(.top, 180)
                        }
                        .frame(height: 300)
                        .background(Color("CyanDark"))
                    }
                    .padding(.top, 50)
                    
                    VStack{
                        Text("Feel Yourself Like a Barista!")
                            .font(.system(size: 32))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                        
                        Text("Magic Coffee on order")
                            .font(.title3)
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink{
                            LoginView()
                        } label: {
                            ButtonCircleView()
                        }
                        .padding(.trailing, 50)
                        .padding(.bottom, 50)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
