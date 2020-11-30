//
//  SocialView.swift
//  IslandWrapsApp
//
//  Created by Rachael Marie Simmonds on 11/29/20.
//

import SwiftUI
import SafariServices

struct SocialView: View {
    // whether or not to show the Safari ViewController
    @State var showSafari = false
    // initial URL string
    @State var link = "https://www.facebook.com/islandwraps2go/reviews/"
    
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
            
            
            VStack(spacing: 30) {
                Spacer()
                    .frame(height: 200)
                // Make These buttons to the social links I sent you
                Button(action: {
                    // update the URL if you'd like to
                    self.link = "https://www.facebook.com/islandwraps2go/reviews/"
                    // tell the app that we want to show the Safari VC
                    self.showSafari = true
                }) {
                Image("fb_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                }
                .sheet(isPresented: $showSafari) {
                            SafariView(url:URL(string: self.link)!)
                        }
                Button(action: {
                    // update the URL if you'd like to
                    self.link = "https://www.instagram.com/island_wraps/"
                    // tell the app that we want to show the Safari VC
                    self.showSafari = true
                }) {
                Image("ig_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                }
                .sheet(isPresented: $showSafari) {
                            SafariView(url:URL(string: self.link)!)
                        }
                .buttonStyle(BorderlessButtonStyle())
                Button(action: {
                    // update the URL if you'd like to
                    self.link = "https://twitter.com/islandwraps2go"
                    // tell the app that we want to show the Safari VC
                    self.showSafari = true
                }) {
                Image("Twitter")
                    .resizable()
                    .frame(width: 100, height: 100)
                }
                .sheet(isPresented: $showSafari) {
                            SafariView(url:URL(string: self.link)!)
                        }
                
            }
            // End of VStack for Social Medias
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
