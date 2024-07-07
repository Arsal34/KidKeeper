//
//  SideMenuOptionModel.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 21/03/2024.
//
import SwiftUI
import Foundation

enum SideMenuOptionModel: Int, CaseIterable, Identifiable {
    case AddChannel
    case RemoveChannel
    case TimeLimit
    case History
    case ChildUser
    case AddChild
    case Logout

    var id: Int { self.rawValue }

    var title: String {
        switch self {
        case .AddChannel:
            return "Add Channels"
        case .RemoveChannel:
            return "Remove Channels"
        case .TimeLimit:
            return "Time Limit"
        case .History:
            return "Watching History"
        case .ChildUser:
            return "First Child's Profile"
        case .Logout:
            return "Logout"
        case .AddChild:
            return "Add Child"
        }
    }

    var ImageName: String {
        switch self {
        case .AddChannel:
            return "plus"
        case .RemoveChannel:
            return "minus"
        case .TimeLimit:
            return "clock"
        case .History:
            return "history"
        case .ChildUser:
            return "user1"
        case .Logout:
            return "logout"
        case .AddChild:
            return "add-user"
        }
    }
}

/*import SwiftUI
import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case AddChannel
    case RemoveChannel
    case TimeLimit
    case History
    case ChildUser
    case AddChild
    case Settings
   
    
    var title: String{
        switch self{
        case.AddChannel:
            return "Add Channels"
        case.RemoveChannel:
            return "Remove Channels"
        case.TimeLimit:
            return "Time Limit"
        case.History:
            return "Watching History"
        case.ChildUser:
            return "First Child's Profile"
        case.Settings:
            return "Settings"
        case.AddChild:
            return "Add Child"
       
            
        }
            
    }
    var ImageName: String
    {
        switch self{
        case.AddChannel:
            return "plus"
        case.RemoveChannel:
            return "minus"
        case.TimeLimit:
            return "clock"
        case.History:
            return "history"
        case.ChildUser:
            return "user1"
        case.Settings:
            return "settings"
        case.AddChild:
            return "add-user"
       
        }
    }
}
extension SideMenuOptionModel: Identifiable{
    var id: Int {return self.rawValue}
}
*/
