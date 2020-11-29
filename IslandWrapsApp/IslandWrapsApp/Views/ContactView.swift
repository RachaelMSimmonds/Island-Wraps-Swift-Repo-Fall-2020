//
//  ContactView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Image("water_mark")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: -140, y: -300)
            Text("Island Wraps")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 30, y: -300)
            
            Text("Contact Us Below!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 0, y: -150)

        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
