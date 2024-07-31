//
//  ProfileView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel :  ProfileViewModel
    @State private var showEditName = false
    @State private var showEditPhoneNumber = false
    @State private var showEditEmail = false
    @State private var showEditAddress = false
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing : 20){
                    ProfileComponent(icon: "person", title: "Name", text: viewModel.user.username, showEdit: $showEditName)
                    ProfileComponent(icon: "phone", title: "Phone number", text: viewModel.user.phonenumber, showEdit: $showEditPhoneNumber)
                    ProfileComponent(icon: "envelope", title: "Email", text: viewModel.user.email, showEdit: $showEditEmail)
                    ProfileComponent(icon: "map", title: "Magic Coffee store address", text: viewModel.user.addressCoffee, showEdit: $showEditAddress)
                }
                
                Spacer()
                
                QRCodeGenerate(viewModel: viewModel)
            }
            .sheet(isPresented: $showEditName, content: {
                VStack(spacing: 20){
                    Text("Edit Name:")
                    TextField("Your name...", text: $viewModel.user.username)
                        .frame(width: UIScreen.main.bounds.width-80, height: 20)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    Button{
                        showEditName.toggle()
                        viewModel.userInformationQR()
                    }label:{
                        Text("Done")
                            .frame(width: 100, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                .presentationDetents([.height(600)])
                .presentationCornerRadius(30)
                .padding(20)
            })
            .sheet(isPresented: $showEditPhoneNumber, content: {
                VStack(spacing: 20){
                    Text("Edit phone:")
                    TextField("Your phone number...", text: $viewModel.user.phonenumber)
                        .frame(width: UIScreen.main.bounds.width-80, height: 20)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    Button{
                        showEditPhoneNumber.toggle()
                        viewModel.userInformationQR()
                    }label:{
                        Text("Done")
                            .frame(width: 100, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                .presentationDetents([.height(600)])
                .presentationCornerRadius(30)
                .padding(20)
            })
            .sheet(isPresented: $showEditEmail, content: {
                VStack(spacing: 20){
                    Text("Edit Email:")
                    TextField("Your email...", text: $viewModel.user.email)
                        .frame(width: UIScreen.main.bounds.width-80, height: 20)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    Button{
                        showEditEmail.toggle()
                        viewModel.userInformationQR()
                    }label:{
                        Text("Done")
                            .frame(width: 100, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                .presentationDetents([.height(600)])
                .presentationCornerRadius(30)
                .padding(20)
            })
            .sheet(isPresented: $showEditAddress, content: {
                VStack(spacing: 20){
                    Text("Choose coffee store address:")
                    Button{
                        viewModel.user.addressCoffee = "287 Au Duong Lan, p3, q8"
                        showEditAddress.toggle()
                        viewModel.userInformationQR()
                    }label: {
                        Text("287 Au Duong Lan, p3, q8")
                            .frame(width: UIScreen.main.bounds.width-40, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Button{
                        viewModel.user.addressCoffee = "Ngo Duc Ke, p9, Thu Duc"
                        showEditAddress.toggle()
                        viewModel.userInformationQR()
                    }label: {
                        Text("Ngo Duc Ke, p9, Thu Duc")
                            .frame(width: UIScreen.main.bounds.width-40, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Button{
                        viewModel.user.addressCoffee = "Nhat Trong, p1, q5"
                        showEditAddress.toggle()
                        viewModel.userInformationQR()
                    }label: {
                        Text("Nhat Trong, p1, q5")
                            .frame(width: UIScreen.main.bounds.width-40, height: 40)
                            .background(Color("CyanDark"))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                .presentationDetents([.height(600)])
                .presentationCornerRadius(30)
                .padding(20)
            })
            .padding(20)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement : .topBarLeading){
                    Button{
                        dismiss()
                    }label:{
                        Image(systemName: "arrow.backward")
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView(viewModel : ProfileViewModel())
}
