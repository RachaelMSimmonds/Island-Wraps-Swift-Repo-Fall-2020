//
//  MenuDetailView.swift
//  IslandWrapsApp
//
//  Created by Alex Ketavongsa on 11/11/20.
//

import SwiftUI

struct MenuDetailView: View {
    var menu: Menu
    @EnvironmentObject var menus: Menus
    @Binding var selectedTab: Tabs
    
    @State private var showNameInfo = false
    @State private var showStateInfo = false
    @State var showMenuDetails: Bool = false
    @State private var count: Int = 0
    
    var body: some View {

        VStack(alignment: .trailing) {
               
            NavigationLink(destination: CartView()) {
                    Text("Cart").font(.title)
                    Image(systemName: "cart").imageScale(.large)
                }
                .navigationBarTitle(Text("Menu"), displayMode: .automatic)
          
            }
        
        VStack {
            // form
            Form {
                
                // Header with image and title
                Section() {
                    Image("\(menu.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .center) {
                        Text("Available Items")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    } // End of VStack
                } // End of Header Section
                
                // ***Available Items
                
                // Section 1 - Wraps
                VStack(alignment: .leading) {
                    Text("\(menu.optionOne)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Text("\(menu.priceOne)")
                        .fontWeight(.bold)
                        .padding(.vertical, 3)
                    Text("\(menu.descOne)")
                        .foregroundColor(.secondary)

                
                
                // Cart Buttons
                HStack(alignment: .center, spacing: 15) {
                    // Add and Subtract Button...
                    Button(action: {
                        count += 1
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    } // End of plus button
                    
                    Text("\(count)")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.08))
                    
                    Button(action: {
                            count -= 1
                        
                    }) {
                        Image(systemName: "minus")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    } // End of minus button
                    
                    // add items to cart
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        
                        Text("Add to Cart")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                            .background(Color.orange)
                            .clipShape(Capsule())
                    } // End of Add to Cart Button
                    
                    
                } // End of HStack
                .padding(.horizontal)
                .padding(.vertical, 15)
                    
                } // End of VStack
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("\(menu.optionTwo)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Text("\(menu.priceTwo)")
                        .fontWeight(.bold)
                        .padding(.vertical, 3)
                    Text("\(menu.descTwo)")
                        .foregroundColor(.secondary)
                    
                    // Cart Buttons
                    HStack(alignment: .center, spacing: 15) {
                        // Add and Subtract Button...
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of plus button
                        
                        Text("\(count)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.08))
                        
                        Button(action: {
                                count -= 1
                            
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of minus button
                        
                        // add items to cart
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        } // End of Add to Cart Button
                        
                        
                    } // End of HStack
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                } // End of Section Two
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
                
                VStack(alignment: .leading) {
                    Text("\(menu.optionThree)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Text("\(menu.priceThree)")
                        .fontWeight(.bold)
                        .padding(.vertical, 3)
                    Text("\(menu.descThree)")
                        .foregroundColor(.secondary)
                    
                    // Cart Buttons
                    HStack(alignment: .center, spacing: 15) {
                        // Add and Subtract Button...
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of plus button
                        
                        Text("\(count)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.08))
                        
                        Button(action: {
                                count -= 1
                            
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of minus button
                        
                        // add items to cart
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        } // End of Add to Cart Button
                        
                        
                    } // End of HStack
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                } // End of Section Three
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                
                VStack(alignment: .leading) {
                    Text("\(menu.optionFour)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Text("\(menu.priceFour)")
                        .fontWeight(.bold)
                        .padding(.vertical, 3)
                    Text("\(menu.descFour)")
                        .foregroundColor(.secondary)
                    
                    // Cart Buttons
                    HStack(alignment: .center, spacing: 15) {
                        // Add and Subtract Button...
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of plus button
                        
                        Text("\(count)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.08))
                        
                        Button(action: {
                                count -= 1
                            
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of minus button
                        
                        // add items to cart
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        } // End of Add to Cart Button
                        
                        
                    } // End of HStack
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                } // End of section four
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("\(menu.optionFive)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    Text("\(menu.priceFive)")
                        .fontWeight(.bold)
                        .padding(.vertical, 3)
                    Text("\(menu.descFive)")
                        .foregroundColor(.secondary)
                    
                    // Cart Buttons
                    HStack(alignment: .center, spacing: 15) {
                        // Add and Subtract Button...
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of plus button
                        
                        Text("\(count)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.08))
                        
                        Button(action: {
                                count -= 1
                            
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        } // End of minus button
                        
                        // add items to cart
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                                .background(Color.orange)
                                .clipShape(Capsule())
                        } // End of Add to Cart Button
                        
                        
                    } // End of HStack
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                } // End of Section five
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            } // form
            .navigationBarTitle("", displayMode: .inline)
        } // End of Main VStack
    } // body
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(menu: Menus().list.first!, selectedTab: .constant(Tabs.order))
    }
}
