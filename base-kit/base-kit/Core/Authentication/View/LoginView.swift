//
//  LoginView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = LoginViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        
        Spacer()
        
        // logo image
        Image("appLogo")
          .resizable()
          .scaledToFit()
          .frame(width: 220,height: 100)
        
        // text fields
        VStack {
          TextField("Emter your email", text: $viewModel.email)
            .autocapitalization(.none)
            .modifier(IGTextFieldModifier())
          
          SecureField("Emter your password", text: $viewModel.password)
            .modifier(IGTextFieldModifier())
          
        }
        
        Button {
          print("show forgot password")
        } label: {
          Text("Forget Password?")
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.top)
            .padding(.trailing, 28)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        
        Button {
          Task {try await viewModel.signIn()}
         
        } label: {
          Text("Login")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
        }
        .padding(.vertical)
        
        HStack {
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            .foregroundColor(.gray)
          
          Text("OR")
            .font(.footnote)
            .fontWeight(.semibold)
          
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(.gray)
        
        HStack {
          Image("facebook-login-logo")
            .resizable()
            .frame(width: 20, height: 20)
          
          Text("Continue with Facebook")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemBlue))
        }
        .padding(.top, 8)
        
        Spacer()
        
        Divider()
        
        NavigationLink{
          AddEmailView()
            .navigationBarBackButtonHidden(true)
        } label:{
          HStack {
            Text("Don't have an account?")
            
            Text("Sign Up")
              .fontWeight(.semibold)
          }
          .font(.footnote)
        }
        .padding(.vertical, 16)
        
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
