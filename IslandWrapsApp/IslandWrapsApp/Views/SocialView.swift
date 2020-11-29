//
//  SocialView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//

import SwiftUI

struct SocialView: View {
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
            
            Text("Follow Us on Our Social Medias!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 0, y: -150)
            
            VStack {
                
                // Make These buttons to the social links I sent you
                Image("fb_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: 90)
                Image("ig_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: 100)
                Image("Twitter")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: 110)
                
            } // End of VStack for Social Medias
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
