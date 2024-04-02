//
//  DogsImageView.swift
//  Dogs
//
//  Created by Guilherme Delfino on 12/03/24.
//

import Foundation
import UIKit
import DogsApi

class DogsImageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        ])
        
    }

    
}
