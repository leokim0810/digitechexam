//
//  ContentView.swift
//  digiTech
//
//  Created by Leo Bogeun Kim on 26/07/24.
//

import SwiftUI

struct ContentView: View
{
    //creating instances of structs.
    var document = Documents()
    var level = Level()
    var suspect = Suspect()
    

    //The @State will refresh/update the view everytime any of the @State variables are altered.
    
    //The document that is shown is controlled through the documentcounter variable.
    @State var documentCounter: Int = 0
    //The suspect that is shown is controlled through the suspectcounter variable.
    @State var suspectCounter: Int = 0
    @State var currentLevel: Int = 1

    //This creates a button that increases/decreases the documentCounter when pressed
    func documentArrowManager(buttonType: String, maximumDocumentCount: Int) -> some View
    {
        return Button(action:
        {
            if buttonType == "right" && documentCounter < maximumDocumentCount
            {
                documentCounter += 1
                print("\(documentCounter)")
            }
            else if buttonType == "right" && documentCounter == maximumDocumentCount
            {
                documentCounter = 0
                print("\(documentCounter)")
            }
            else if buttonType == "left" && documentCounter > 0
            {
                documentCounter -= 1
                print("\(documentCounter)")
            }
            else if buttonType == "left" && documentCounter == 0
            {
                documentCounter = maximumDocumentCount
                print("\(documentCounter)")
            }
        })
        {
           Image("\(buttonType)Arrow")
                .resizable()
                .frame(width: 75, height: 75)
        }
    }
    
    //This creates a button that increases/decreases the suspectCounter when pressed
    func suspectArrowManager(buttonType: String, maximumSuspectCount: Int) -> some View
    {
        return Button(action:
        {
            if buttonType == "up" && suspectCounter < maximumSuspectCount
            {
                suspectCounter += 1
                print("\(suspectCounter)")
            }
            else if buttonType == "up" && suspectCounter == maximumSuspectCount
            {
                suspectCounter = 0
                print("\(suspectCounter)")
            }
            else if buttonType == "down" && suspectCounter > 0
            {
                suspectCounter -= 1
                print("\(suspectCounter)")
            }
            else if buttonType == "down" && suspectCounter == 0
            {
                suspectCounter = maximumSuspectCount
                print("\(suspectCounter)")
            }
        })
        {
           Image("\(buttonType)Arrow")
                .resizable()
                .frame(width: 75, height: 75)
        }
        
    }

    var body: some View
    {
        NavigationView {
            ZStack
            {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                   
                VStack(spacing: 20)
                {
                    HStack(spacing: -50)
                    {
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Level\(level.levelName[currentLevel]!)")
                            .padding(30)
                            .font(Font.custom("papyrus", size: 30))
                            .bold()
                            .underline()
                            .shadow(radius: 10)
                            .foregroundStyle(.white)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                }
                HStack(spacing: 10)
                {
                    Spacer()
                    VStack(spacing: 0)
                    {
                        Spacer()
                        Spacer()
                        Text("\(level.documentDisplays[currentLevel]![documentCounter])")
                            .padding()
                            .font(Font.custom("papyrus", size: 30))
                            .bold().underline()
                            .shadow(radius: 10)
                            .foregroundStyle(.white)
                        
                        VStack(spacing: 10)
                        {
                            document.documentManager(
                                currentLevel: currentLevel,
                                documentCounter: documentCounter,
                                documents: level.documents,
                                clickableDocuments: level.clickableDocuments,
                                levelName: level.levelName)
                            // stuff
                            
                            HStack(spacing: 20)
                            {
                                documentArrowManager(
                                    buttonType: "left",
                                    maximumDocumentCount: level.numberOfDocuments[currentLevel]!)
                                documentArrowManager(
                                    buttonType: "right",
                                    maximumDocumentCount: level.numberOfDocuments[currentLevel]!)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    VStack(spacing: -10)
                    {
                        Spacer()
                        Text("\(level.suspectNames[currentLevel]![suspectCounter])")
                            .padding()
                            .font(Font.custom("papyrus", size: 30))
                            .bold()
                            .underline()
                            .shadow(radius: 10)
                            .foregroundStyle(.white)
                        
                        HStack(spacing: 10)
                        {
                            ZStack
                            {
                                Image("characterFrame")
                                    .resizable()
                                    .frame(minWidth: 60, maxWidth: 120, minHeight: 85, maxHeight: 170)
                                suspect.suspectManager(
                                    levelName: level.levelName[currentLevel]!,
                                    suspectCounter: suspectCounter)
                            }
                            VStack(spacing: 10)
                            {
                                suspectArrowManager(
                                    buttonType: "up",
                                    maximumSuspectCount: level.numberOfSuspects[currentLevel]!)
                                suspectArrowManager(
                                    buttonType: "down",
                                    maximumSuspectCount: level.numberOfSuspects[currentLevel]!)
                                
                            }
                        }
                        
                        VStack(spacing: -20){
                            //produces a button that leads the player to a different view. The view depends on whether the player gets the answer right or wrong.
                            NavigationLink(destination: suspectCounter == level.theCulprit[currentLevel] ? AnyView(winScreen()) : AnyView(loseScreen())){Text("Arrest")
                                    .padding()
                                    .font(Font.custom("papyrus", size: 30))
                                    .bold()
                                    .underline()
                                    .shadow(radius: 10)
                                    .foregroundStyle(.white)}
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
