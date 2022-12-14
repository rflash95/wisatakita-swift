//
//  ProfilViewScreen.swift
//  WisataKita
//
//  Created by rzamau on 01/09/22.
//

import SwiftUI

struct ProfileViewScreen: View {
    var body: some View {
        VStack(alignment:.center){
            Image("PhotoProfile")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .scaledToFit()
                .overlay(Circle().stroke(Color.green,lineWidth: 5))
                .frame(width:150,height: 150)
            
            Text("Reza Maulana").font(.system(size: 32))
                .foregroundColor(Color.black).bold()
            Text("reflash95@gmail.com").font(.system(size: 18))
                .foregroundColor(Color.black)
            
        }.navigationTitle("Profile")
    }
}

struct ProfilViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewScreen()
    }
}
