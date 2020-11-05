//
//  ContentView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 10/8/20.
//

import SwiftUI

struct ContentView: View {
    @State private var counterNumber = 0
    var body: some View {
        Text("This is a test!")
            .padding()
        HStack{
            Button(action: {
                counterNumber += 1

//                    if counterNumber < 10 {
//                        counterNumber += 1
//                    } else if counterNumber >= 10 {
//                        ZStack {
//                            Text("Reduce your count!")
//                                .background(Color.red)
//                                //.padding(.bottom, 40)
//                             }
//                    }
                
            }) {
                Image(systemName: "plus")
                    .font(
                        .system(size: 20, weight:
                            .regular)
                    )
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 50)
                    .padding(.top, 50)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            } // end of green button
            .offset(x: -10, y: -160)
            // End of green button HStack
    
            Button(action: {
                // action here
                counterNumber -= 1
            }) {
                Image(systemName: "minus")
                    .font(
                        .system(size: 20, weight:
                            .regular)
                    )
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 60)
                    .padding(.top, 60)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            } // end of red button
            .offset(x: 10, y: -160)
        
        }// End of HStack with buttons
    }
}//This is a test

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
