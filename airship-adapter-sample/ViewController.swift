//
//  ViewController.swift
//  airship-adapter-sample
//
//  Created by Andrew Tran on 5/17/22.
//

import UIKit

class ViewController: BaseViewController<MainView> {

    private let gimbalService: GimbalService
    
    init() {
        self.gimbalService = GimbalService()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

