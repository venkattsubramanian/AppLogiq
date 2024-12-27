//
//  TabCell.swift
//  AppLogiq
//
//  Created by venkat subramaian on 27/12/24.
//

import Foundation
import UIKit

class TabCell: UICollectionViewCell {
    
    static let identifier = "TabCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsUIElements() {
        
        contentView.addSubview(titleLabel)
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        titleLabel.edges        == contentView.edges
    
    }
    
    func configure(with title: String, isSelected: Bool) {
           titleLabel.text = title
           contentView.backgroundColor = isSelected ? .white : .clear
           titleLabel.textColor = isSelected ? .black : .gray
       }
}
