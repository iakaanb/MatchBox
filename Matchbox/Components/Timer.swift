//
//  Timer.swift
//  Matchbox
//
//  Created by kai on 3/7/24.
//
import SwiftUI

var timerDone = false

func timer() {
    let currentDay = Calendar.current.component(.day, from: .now)
    let numDays = Int.random(in: 7...27)
    let daysRemaining = numDays - currentDay
    let endDate = 1 + numDays
    
    if currentDay == endDate {
        timerDone = true
    }
}


