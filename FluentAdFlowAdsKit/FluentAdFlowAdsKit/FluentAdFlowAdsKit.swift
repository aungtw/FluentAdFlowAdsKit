//
//  FluentAdFlowAdsKit.swift
//  FluentAdFlowAdsKit
//
//  Created by Austin Wong on 8/24/23.
//

import SwiftUI
import WebKit
 
@available(iOS 13.0, *)
public protocol FluentAdFlowAdsKitProtocol {
    init()
    func load(email: String, firstName: String, lastName: String, orderId: String,
              transactionValue: String, zip: String) -> WebView
//    func getFluentAdsKitView(email: String, firstName: String, lastName: String, orderId: String,
//              transactionValue: String, zip: String) -> FluentAdsKitView
}

public class FluentAdFlowAdsKit: FluentAdFlowAdsKitProtocol {
    required public init(){
        
    }
    
    public func load(email: String, firstName: String, lastName: String, orderId: String,
                     transactionValue: String, zip: String) -> WebView {
        return WebView(email: email, firstName: firstName, lastName: lastName, orderId: orderId, transactionValue: transactionValue, zip: zip)
    }
    
//    public func getFluentAdsKitView(email: String, firstName: String, lastName: String, orderId: String, transactionValue: String, zip: String) -> FluentAdsKitView {
//        let view = FluentAdsKitView()
//        view.email = email
//        view.firstName = firstName
//        view.lastName = lastName
//        view.orderId = orderId
//        view.transactionValue = transactionValue
//        view.zip = zip
//        view.updateView([])
//        
//        return view
//    }
}
