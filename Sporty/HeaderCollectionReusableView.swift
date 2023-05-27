//
//  HeaderCollectionReusableView.swift
//  Sporty
//
//  Created by Menna Ihab on 27/05/2023.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
//    static let identifier = "HeaderCollectionReusableView"
//     let label:UILabel = {
//        let label = UILabel()
//        label.text = "latest result"
//        label.textColor = .blue
//
//        return label
//
//    }()
//
//    public func configure(){
//        backgroundColor = .systemRed
//        addSubview(label)
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        label.frame = bounds
//
//    }
    static let identifier = "HeaderView"
       let categoryLabel = UILabel()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupContent()
       }
       
       func setupContent() {
           categoryLabel.frame = CGRect(x: 16, y: 15, width:400 , height: 17)
           categoryLabel.font = UIFont(name: "Montserratarm-Medium", size: 22)
          // categoryLabel.text = "Section ?? "
           categoryLabel.textColor = .purple
           categoryLabel.textAlignment = .center
           addSubview(categoryLabel)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
