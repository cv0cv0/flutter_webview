//
//  WebViewController.swift
//  flutter_webview
//
//  Created by 关蕤 on 2019/3/19.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    private var webView: WKWebView!
    
    private let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.frame, configuration: configuration)
        webView.uiDelegate = self
        view.addSubview(webView)
        
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11.0, *) {
            let insets = view.safeAreaInsets
            let width = view.frame.width - insets.left - insets.right
            let height = view.frame.height - insets.top - insets.bottom
            webView.frame = CGRect(x: insets.left, y: insets.top, width: width, height: height)
        }
    }
}
