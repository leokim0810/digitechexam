//
//  levelOneDocument.swift
//  digiTech
//
//  Created by Leo Bogeun Kim on 26/07/24.
//

import Foundation
import SwiftUI

struct Documents
{
    
    //This returns a picture with some of them being clickable. These are the clues.
    //The inputs allow the document manager to find the correct image.
    func documentManager(currentLevel: Int, documentCounter: Int, documents: [Int: [String]], clickableDocuments: [[Int]], levelName: [Int: String]) -> some View
    {
            Image("level\(levelName[currentLevel]!)\(documents[currentLevel]![documentCounter])")
                .resizable()
                .frame(minWidth: 150, maxWidth: 300, minHeight: 75, maxHeight: 150)
    }
}
