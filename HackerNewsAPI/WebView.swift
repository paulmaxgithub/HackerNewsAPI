//
// WebView.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 13.12.22.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: url) else { return WKWebView.pageNotFound() }
        
        let request = URLRequest(url: url)
        
        let webView = WKWebView()
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        uiView.load(request)
    }
}
