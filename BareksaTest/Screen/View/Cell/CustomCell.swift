//
//  CustomCell.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    lazy var bg: UIView = {
       let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 4
        return iv
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        bg.layer.cornerRadius = 4

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        bg.addSubview(valueLabel)
        valueLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
