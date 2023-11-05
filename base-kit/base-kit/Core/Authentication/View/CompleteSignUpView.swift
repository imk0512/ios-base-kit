//
//  CompleteSignUpView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct CompleteSignUpView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: RegistrationViewModel
  
  var body: some View {
    VStack(spacing:12) {
      Spacer()
      
      Text("Welcome to instagram, \(viewModel.username)")
        .font(.title2)
        .fontWeight(.bold)
        .padding(.top)
      
      Text("Click below to complete registration and start using Instagram")
        .font(.footnote)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)
        
      Button {
        Task { try await viewModel.createUser() }
      } label: {
        Text("Complete Sgin up")
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
