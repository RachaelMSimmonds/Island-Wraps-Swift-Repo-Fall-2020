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
            
            VStack(spacing: 30) {
                Text("Phone Number: ")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                //  Clickable telphone number
                    Link("(585) 432-0442", destination: URL(string: "tel:5854320442")!)
                
                Text("Email: ")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                //  Clickable Email Address
                    Link("islandwraps2go@gmail.com", destination: URL(string: "mailto:islandwraps2go@gmail.com")!)
                

            } // End of VStack

        } // End of ZStack
    } // End of Body
} // End of ContactView

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
