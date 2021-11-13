//
//  Constants.swift
//  sleepestonboard
//
//  Created by ashlee.muscroft on 12/11/2021.
//

import Foundation
import UIKit
import AsyncDisplayKit

struct AppFont {
    enum fontType: String, CaseIterable {
     case bold = "Montserrat-Bold"
     case regular = "Montserrat-Regular"
     case light = "Montserrat-Light"
     case italic = "Montserrat-Italic"
     case semiBold = "Montserrat-SemiBold"
    }
    
    enum fontSize: CGFloat, CaseIterable {
        case body = 28
        case cta = 30
        case title = 53
        case button = 35
    }
}

let title: UIFont = UIFont(name: "Montserrat-Bold", size: 53)!
let body: UIFont = UIFont(name: "Montserrat-Bold", size: 28)!
let boldBody: UIFont = UIFont(name: "Montserrat-SemiBold", size: 28)!
let ctaDesc: UIFont = UIFont(name: "Montserrat-SemiBold", size: 30)!
let ctaLink: UIFont = UIFont(name: "Montserrat-Bold", size: 30)!
let ctaLabel: UIFont = UIFont(name: "Montserrat-Bold", size: 35)!

extension Notification.Name {
    static let presentedControllerNotification = Notification.Name("PresentedController")
    //TBD if needed, copied of above
    static let subscriptionControllerNotification = Notification.Name("SubscriptionController")
}