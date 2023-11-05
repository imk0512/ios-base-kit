//
//  CreatePasswordView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct CreatePasswordView: View {
  @State private var password = ""
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      VStack(spacing: 12) {
        Text("Create a password")
          .font(.title2)
          .fontWeight(.bold)
          .padding(.top)
        
        Text("Your password must be at least 6characters in length")
          .font(.footnote)
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 24)
        
        SecureField("Password", text: $password)
          .autocapitalization(.none)
          .modifier(IGTextFieldModifier())
          .padding(.top)
        
        NavigationLink {
          CompleteSignUpView()
            .navigationBarBackButtonHidden()
        } label: {
          Text("Next")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
        }
        .padding(.vertical)
        
        Spacer()
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Image(systemName: "chevron.left")
            .imageScale(.large)
            .onTapGesture {
              dismiss()
            }
        }
      }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
