//
//  Colors.swift
//  KidKeeper
//
//  Created by M1 on 07/08/2023.
//

import Foundation
import SwiftUI

enum AppColor: String {
    case primary = "Yellow"
    case secondaryLight = "White"
    case secondaryDark = "Black"
    case primaryYellow = "Yellows"
    case OnClickColour = "Onclick"
    case AddChildScreen = "AddChildScreen"
    case darkgray = "DarkGray"
    case lightgray = "lightgray"
    case lightblue = "lightblue"
   // case yellows = "yellows"
    func getColor() -> Color {
        switch self {
        case .primary:
            return Color.yellow
        case .secondaryDark:
            return Color.black
        case .secondaryLight:
            return Color.white
        case.primaryYellow:
            return Color.yellows
        case .OnClickColour:
            return Color.OnClickColour
        case.AddChildScreen:
            return Color.AddChildScreen
        case.darkgray:
            return Color.darkgray
        case.lightgray:
            return Color.lightgray
        case.lightblue:
            return Color.lightblue
        }
        
    }
}
extension Color {
    static let yellows = Color(red: 253/255    , green: 187/255   , blue: 31/255)
    static let OnClickColour = Color(red: 252/255    , green: 230/255   , blue: 36/255)
    static let AddChildScreen = Color(red: 191/255    , green: 191/255   , blue: 133/255)
    static let darkgray = Color(red: 130/255, green: 127/255, blue: 117/255)
    static let lightgray = Color (red: 163/255,green:  162/255, blue:  160/255)
 
    static let lightblue = Color (red: 111/255,green:  172/255, blue:  230/255)
}



