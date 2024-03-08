//
//  VerifyOTP.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI
import Combine

struct VerifyOTPView: View {
    @StateObject private var viewModel = VerifyOTPViewModel()
    @FocusState private var focusIndex : Int?
    @State private var timer : Timer?
    @State private var count = 30
    @State private var againOtp = false
    
    @Binding var email : String
    
    public init(email: Binding<String>) {
        _email = email
    }
    
    private var widthRectangle = (UIScreen.main.bounds.width / 6) - 20
    
    var timerPublisher: Timer.TimerPublisher {
        Timer.publish(every: 1, on: .main, in: .common)
    }
    
    var body: some View {
        NavigationStack{
            
            NavigationLink(
                destination: RefreshPassswordView(email : $viewModel.email),
                isActive: $viewModel.isSuccess,
                label: { EmptyView() }
            )
            .hidden()
            
            ZStack{
                VStack(){
                    HStack{
                        Text("Verification")
                            .font(.system(size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    HStack{
                        Text("Enter the OTP code we sent you")
                            .foregroundStyle(Color(.systemGray))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    // Field Text
                    HStack(spacing : 10){
                        ForEach(0..<$viewModel.otpArray.count, id : \.self){ character in
                            ZStack{
                                Rectangle()
                                    .frame(height: 60)
                                    .foregroundColor(Color(.systemGray6))
                                    .cornerRadius(10)
                                
                                TextField("", text: $viewModel.otpArray[character])
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .onChange(of: viewModel.otpArray[character]){ oldValue, newValue in
                                        
                                        if viewModel.otpArray[character].count > 1 {
                                            viewModel.otpArray[character] = String(viewModel.otpArray[character].suffix(1))
                                        }
                                    }
                                    .textInputAutocapitalization(.never)
                                    .multilineTextAlignment(.center)
                                    .focused($focusIndex, equals: character)
                                    .tag(character)
                                    .onChange(of: viewModel.otpArray[character]) { oldValue, newValue in
                                        if !newValue.isEmpty {
                                            focusIndex = (focusIndex ?? 0) + 1
                                        } else {
                                            focusIndex = (focusIndex ?? 0) - 1
                                        }
                                    }
                            }
                            .frame(width: widthRectangle)
                        }
                    }
                    .frame(width: 330, height: 100)
                    .padding(.vertical, 0)
                    
                    if viewModel.errorMessage != "" {
                        Text(viewModel.errorMessage)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                    
                    //prompt resend second
                    HStack(spacing : 0){
                        Text("Fill OTP code in ")
                        Text("\(count)")
                            .fontWeight(.semibold)
                        Text("s")
                    }
                    .onReceive(timerPublisher){ _ in
                        if count > 0 {
                            count -= 1
                        } else {
                            stopTimer()
                            againOtp = true
                        }
                    }
                    .foregroundColor(Color(.systemGray))
                    
                    // button again otp
                    if againOtp {
                        HStack(spacing : 0){
                            Button{
                                startTimer()
                                count = 30
                                againOtp = false
                                viewModel.errorMessage = ""
                            } label: {
                                HStack{
                                    Text("Send OTP Again? ")
                                    Text("Send")
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                        .font(.system(size: 15))
                        .foregroundStyle(.black)
                        .padding(.top, 5)
                    }
                    
                    Spacer()
                }
                
                
                // button main
                HStack{
                    Spacer()
                    
                    Button{
                        viewModel.email = email
                        Task{
                            await viewModel.requestVerifyOTP()
                        }
                    } label: {
                        ButtonCircleView()
                    }
                }
                .padding(.trailing, 50)
                .padding(.top, 100)
            }
            .onAppear{
                startTimer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if count > 0 {
                count -= 1
            } else {
                stopTimer()
                againOtp = true
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    VerifyOTPView(email : .constant("example@example.com"))
}
