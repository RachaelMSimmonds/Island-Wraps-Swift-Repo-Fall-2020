//
//  CartView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/17/20.
//

import SwiftUI

struct CartView: View {
   
    var body: some View {
        VStack {
            
            HStack(spacing: 20) {
                Button(action: {}) {
                    
                    Image(systemName: "chavron.left")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.black)
                }
                
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
            } // End of HStack
            .padding()
            
            
           // Spacer(minLength: 0)
            
            VStack() {
                Text("This is where cart items will be added")
            }

            
        } // End of VStack
        .background(Color.white.ignoresSafeArea())
    } // End of Body

} // End of CartView

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
