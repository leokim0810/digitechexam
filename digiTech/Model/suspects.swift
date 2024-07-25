//
//  suspects.swift
//  digiTech
//
//  Created by Leo Bogeun Kim on 26/07/24.
//

import SwiftUI

struct Suspect
{
    
    //This creates a picture of the suspects
    func suspectManager(levelName: String, suspectCounter: Int) -> some View
    {
        var suspectNumber = ["Zero", "One", "Two", "Three"]
        
        return Image("level\(levelName)Suspect\(suspectNumber[suspectCounter])")
                    .resizable()
                    .frame(minWidth: 50, maxWidth: 75, minHeight: 50, maxHeight: 75)
    }
    
    //Pressing this button allows the player to make a guess at who the culprit is. It will redirect them to a different view that will either say correct or wrong.
    func capture(suspectCounter: Int, culprit: Int) -> some View
    {
        
        return Button(action:
        {
            if suspectCounter == culprit
            {
                print("correct")
            }
            else
            {
                print("wrong")
            }
        }){
            Text("Arrest")
                .padding()
                .font(Font.custom("papyrus", size: 30))
                .bold()
                .underline()
                .shadow(radius: 10)
                .foregroundStyle(.white)
            
        }
    }
    
    //THis displays the name of the suspect.
    func suspectNameManager(suspectCounter: Int) -> String
    {
        var levelName: [String] = ["Zero", "One", "Two", "Three", "Four", "Five"]
        return levelName[suspectCounter]
    }
}
