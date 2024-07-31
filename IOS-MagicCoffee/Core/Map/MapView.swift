//
//  MapView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition : MapCameraPosition = .region(.userRegion)
    @State private var isSheet = false
    @State private var nextLink = false
    
    var body: some View {
        NavigationLink(
            destination: TabMenuView(),
            isActive: $nextLink,
            label: { EmptyView() }
        )
        .hidden()
        
        NavigationStack{
            Map(position: $cameraPosition){
                Annotation("Your", coordinate: .userLocation){
                    ZStack{
                        Image("mark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                        
                        Image(systemName: "house")
                            .foregroundColor(.white)
                    }
                }
                
                Annotation("", coordinate: .coffeeA){
                    ZStack{
                        Image("mark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                        
                        Image("Vector")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(.top, 25)
                    }
                }
                Annotation("", coordinate: .coffeeB){
                    ZStack{
                        Image("mark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                        
                        Image("Vector")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(.top, 25)
                    }
                }
                Annotation("", coordinate: .coffeeC){
                    ZStack{
                        Image("mark")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                        
                        Image("Vector")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(.top, 25)
                    }
                }
            }
        }
        .sheet(isPresented: $isSheet){
            NavigationStack{
                ZStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("CyanDark"))
                        
                        VStack{
                            Text("Select Magic Coffee Store")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(.top, 50)
                            
                            Spacer()
                        }
                    }
                    
                    VStack{
                        Button{
                            nextLink.toggle()
                            isSheet.toggle()
                        } label: {
                            ZStack{
                                Image("rectanglePlace")
                                
                                HStack{
                                    HStack{
                                        Image(systemName: "storefront")
                                        Text("Au Duong Lan, P3, Q8")
                                            .font(.footnote)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                            }
                            .frame(width: 350)
                        }
                        
                        Button{
                            
                        } label: {
                            ZStack{
                                Image("rectanglePlace")
                                
                                HStack{
                                    HStack{
                                        Image(systemName: "storefront")
                                        Text("Huynh Thuc, P12, Binh Thanh")
                                            .font(.footnote)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                            }
                            .frame(width: 350)
                        }
                        
                        Button{
                            
                        } label: {
                            ZStack{
                                Image("rectanglePlace")
                                
                                HStack{
                                    HStack{
                                        Image(systemName: "storefront")
                                        Text("Quoc Giang, P3, Q10")
                                            .font(.footnote)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                            }
                            .frame(width: 350)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                    .background(.white)
                    .padding(.top, 100)
                }
            }
            .presentationDetents([.height(300)])
            .presentationCornerRadius(30)
        }
        .onAppear{
            isSheet = true
        }
    }
}

#Preview {
    MapView()
}
