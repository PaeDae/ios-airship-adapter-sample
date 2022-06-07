//
//  MainView.swift
//  airship-adapter-sample
//
//  Created by Andrew Tran on 5/18/22.
//

import Foundation
import UIKit

class MainView: UIView {
    private let header: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Airship Adapter Sample"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(header)
        
        header.anchor(
            top: topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            size: .init(width: 0, height: 80),
            centerX: centerXAnchor,
            centerY: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}
