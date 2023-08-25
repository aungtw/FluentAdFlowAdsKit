//
//  FLuentAdsKitView.swift
//  FluentAdFlowAdsKit
//
//  Created by Austin Wong on 8/24/23.
//

import UIKit
import WebKit

@available(iOS 13.0, *)
public protocol FluentAdFlowAdsKitViewProtocol {
    init(frame:CGRect)
    init?(coder aDecoder: NSCoder)
    func updateView(_ changedProps: [String]!)
//    func getFluentAdsKitView(email: String, firstName: String, lastName: String, orderId: String,
//              transactionValue: String, zip: String) -> FluentAdsKitView
}

open class FluentAdFlowAdsKitView : UIView, WKNavigationDelegate, FluentAdFlowAdsKitViewProtocol {
    @objc public var email: String = ""
    @objc public var firstName: String = ""
    @objc public var lastName: String = ""
    @objc public var orderId: String = ""
    @objc public var transactionValue: String = ""
    @objc public var zip: String = ""
    
    let HEADER_REFERER = "Referer"
    let referer = "http://af-sdk-ios.com/"
    var webView: WKWebView!
    
    required public override init(frame:CGRect) {
        super.init(frame: frame)
        setupView(frame:frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupView(frame:CGRect){
        //        let cssURL = "https://www.novatechconsultancy.com/css/injected.css"
        //        let source = """
        //            var link = document.createElement('link');
        //            link.href = '\(cssURL)';
        //            link.rel= 'stylesheet'
        //            document.head.appendChild(link);
        //            """
        //        let userScript = WKUserScript(source: source,
        //                                      injectionTime: .atDocumentEnd,
        //                                      forMainFrameOnly: true)
        //
        //        let userContentController = WKUserContentController()
        //        userContentController.addUserScript(userScript)
        
        let webConfiguration = WKWebViewConfiguration()
        //        webConfiguration.userContentController = userContentController
        
        webView = WKWebView(frame: frame, configuration: webConfiguration)
        webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true;
        //webView.configuration.preferences.javaScriptEnabled = true;
        webView.navigationDelegate = self
        webView.frame = self.bounds
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(webView)
    }
    
    public func updateView(_ changedProps: [String]!) {
        var request = URLRequest(url: URL(string:getUrl())!)
        request.setValue(referer, forHTTPHeaderField: HEADER_REFERER)
        webView.load(request)
    }
    
    public func getUrl()->String {
        return "https://preview.minionplatform.com/uat/e81d3920-56dd-08db-c359-ad5417b03ec6/customize/customize.html?sourceid=ced-001122&subaff2=ced-001122&implementationType=embedonpage&email=" + self.email + "&firstname=" + self.firstName + "&lastname=" + self.lastName + "&orderId=" + self.orderId + "&transactionValue=" + self.transactionValue + "&zip=" + self.zip
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.linkActivated {
            if let url = navigationAction.request.url {
                let app = UIApplication.shared
                if app.canOpenURL(url) {
                    app.open(url, options: [:], completionHandler: nil)
                }
            }
            
            // webView.load(navigationAction.request)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
