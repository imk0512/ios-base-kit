//
//  AddEmailView.swift
//  base-kit
//
//  Created by 緒方亮平 on 2023/11/04.
//

import SwiftUI

struct AddEmailView: View {
  @State private var email = ""
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      VStack {
        Text("Add your email")
          .font(.title2)
          .fontWeight(.bold)
          .padding(.top)
        
        Text("You'll use this email to sign in to your account")
          .font(.footnote)
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 24)
        
        TextField("Email", text:$email)
          .autocapitalization(.none)
          .modifier(IGTextFieldModifier())
          
        
        NavigationLink {
          CreateUserNameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
