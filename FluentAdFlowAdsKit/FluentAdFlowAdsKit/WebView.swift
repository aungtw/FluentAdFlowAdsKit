//
//  WebView.swift
//  FluentAdFlowAdsKit
//
//  Created by Austin Wong on 8/24/23.
//

import SwiftUI
import WebKit
 
@available(iOS 13.0, *)
public struct WebView: UIViewRepresentable {
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var orderId: String = ""
    var transactionValue: String = ""
    var zip: String = ""
    var loadStatusChanged: ((Bool, Error?) -> Void)? = nil
    
    public func makeUIView(context: Context) -> FluentAdsKitView {
        let view = FluentAdsKitView()
        view.email = email
        view.firstName = firstName
        view.lastName = lastName
        view.orderId = orderId
        view.transactionValue = transactionValue
        view.zip = zip
        view.updateView([])
        return view
    }
    
    public func updateUIView(_ webView: FluentAdsKitView, context: Context) {
        // you can access environment via context.environment here
        // Note that this method will be called A LOT
    }
    
    public func onLoadStatusChanged(perform: ((Bool, Error?) -> Void)?) -> some View {
            var copy = self
            copy.loadStatusChanged = perform
            return copy
    }
}
