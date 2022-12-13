//
//  WKWebView+Ext.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 13.12.22.
//

import WebKit

extension WKWebView {
    
    static func pageNotFound() -> WKWebView {
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page Not Found!<h1><body><html>", baseURL: nil)
        return wk
    }
}
