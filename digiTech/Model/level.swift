//
//  levelManager.swift
//  digiTech
//
//  Created by Leo Bogeun Kim on 26/07/24.
//


import SwiftUI

struct Level
{
    //All the dictionaries contain relevant information about the levels such as the name of the suspects for that level.
    let documents: [Int: [String]] =
    [
        1: ["CrimeScene", "GuardComment"],
        2: ["CrimeScene", "cctvFootage"]
    ]
    
    let documentDisplays: [Int: [String]] = 
    [
        1: ["Crime Scene", "Guard's words"],
        2: ["Crime Scene", "CCTV Footage"]
    ]
    
    let numberOfDocuments: [Int: Int] =
    [
        1: 1,
        2: 1
    ]
    
    let suspectNames: [Int: [String]] = 
    [
        1: ["Benjamin", "Bruce", "Marcus"],
        2: ["Alice", "Clementine", "Elizabeth"]
    ]
    
    let levelName: [Int: String] =
    [
        1: "One",
        2: "Two",
        3: "Three",
    ]
    
    
    let clickableDocuments: [[Int]] =
    [
        [0, 0],
        [1, 2]
    ]
    
    let theCulprit: [Int: Int] =
    [
        1: 0,
        2: 1
    ]
    
    let numberOfSuspects: [Int: Int] =
    [
        1: 2,
        2: 1
    ]
    let clickableDocumentName: [Int: String] =
    [
        1: "hello"
    ]
}
