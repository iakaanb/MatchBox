//
//  UsernameCreater.swift
//  Matchbox
//
//  Created by kai on 3/12/24.
//

import SwiftUI

func usernameCreator() -> String {
    let animalsFilename = "Animals.txt"
    let colorsFilename = "Colors.txt"


    let animalContents = try! String(contentsOfFile: animalsFilename)
    let colorContents = try! String(contentsOfFile: colorsFilename)

    let animalLines = animalContents.split(separator:"\n")
    let colorLines = colorsFilename.split(separator:"\n")

    
    
    var amountAnimalLines: Int = 0
    amountAnimalLines = animalLines.count
    let number = Int.random(in: 1...amountAnimalLines)
    let chosenAnimalName = animalLines[number]
    
    var amountColorLines: Int = 0
    amountColorLines = colorLines.count
    let number2 = Int.random(in: 1...amountColorLines)
    let chosenColor = colorLines[number2]
    
    let randomNum = Int.random(in: 0...999)
    
    return String(chosenAnimalName) + String(chosenColor) + String(randomNum)
//    return chosenUsername
}

