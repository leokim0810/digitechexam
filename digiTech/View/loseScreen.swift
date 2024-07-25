//
//  loseScreen.swift
//  digiTech
//
//  Created by Leo Bogeun Kim on 20/09/2024.
//

import SwiftUI

struct loseScreen: View {
    var hello = ContentView()
    var body: some View {
        ZStack{
            //This displays the background and the words
            Image("winloss")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            Text("You Lose!")
                .padding(100)
                .font(Font.custom("papyrus", size: 30))
                .bold()
                .underline()
                .shadow(radius: 10)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    loseScreen()
}
