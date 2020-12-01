//
//  HomeView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//

import SwiftUI

struct HomeView: View {
    
    // whether or not to show the Safari ViewController
    @State var showSafari = false
    // initial URL string
    @State var link = "https://www.facebook.com/islandwraps2go/reviews/?ref=page_internal"
    
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
            
            VStack {
                
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x: 0, y: 65)
                Text("We Do: Family & Individual Meal Planning,\nFestival Events, Office & Private Parties, Weddings, Birthdays, Anniversaries,\nGraduations, Funerals, Baby-showers & More!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x: 0, y: 75)
                
                // Make These buttons to the social links I sent you
                Button(action: {
                    // update the URL if you'd like to
                    self.link = "https://www.facebook.com/islandwraps2go/reviews/?ref=page_internal"
                    // tell the app that we want to show the Safari VC
                    self.showSafari = true
                }) {
                Text("Reviews")
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                }
                .offset(x: -160, y: 85)
                .sheet(isPresented: $showSafari) {
                            SafariView(url:URL(string: self.link)!)
                        }
                
                Image("booth")
                    .resizable()
                    .frame(width: 365, height: 430)
                    .offset(x: 0, y: 90)
            } // End of VStack
        
        } // End of ZStack
    } // End of body
    
} // End of HomeView

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
