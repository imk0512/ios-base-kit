//
//  CreateUserNameView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct CreateUserNameView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: RegistrationViewModel

  var body: some View {
    VStack(spacing: 12) {
      Text("Create username")
        .font(.title2)
        .fontWeight(.bold)
        .padding(.top)
      
      Text("Pick a username for your new account. You can always change it later.")
        .font(.footnote)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)
      
      TextField("Username", text: $viewModel.username)
        .autocapitalization(.none)
        .modifier(IGTextFieldModifier())
      
      NavigationLink {
        CreatePasswordView()
          .navigationBarBackButtonHidden(true)
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

struct CreateUserNameView_Previews: PreviewProvider {
  static var previews: some View {
    CreateUserNameView()
  }
}
