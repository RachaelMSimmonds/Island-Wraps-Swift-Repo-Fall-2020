//
//  HomeView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//

import SwiftUI

struct HomeView: View {
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
                Image("booth")
                    .resizable()
                    .frame(width: 365, height: 430)
                    .offset(x: 0, y: 90)
            }
        
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
