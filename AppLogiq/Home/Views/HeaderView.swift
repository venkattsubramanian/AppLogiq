//
//  HeaderView.swift
//  AppLogiq
//
//  Created by venkat subramaian on 27/12/24.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    lazy var profileImage: UIImageView! = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = #imageLiteral(resourceName: "profileImage")
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = .ratioHeightBasedOniPhoneX(30)
        return view
    }()
    
    lazy var optionImage: UIImageView! = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = #imageLiteral(resourceName: "options")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Good Morning"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Chris Hemsworth"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsUIElements()
        backgroundColor = .clear

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsUIElements()
    }
    
    private func addSubviewsUIElements() {
        
        addSubviews(with: [profileImage, headLabel, userName, optionImage])
        
        optionImage.leading         == leading + .ratioWidthBasedOniPhoneX(15)
        optionImage.top             == top + .ratioHeightBasedOniPhoneX(10)
        optionImage.height          == .ratioHeightBasedOniPhoneX(15)
        optionImage.width           == .ratioHeightBasedOniPhoneX(22)
        
        profileImage.leading        == leading + .ratioWidthBasedOniPhoneX(10)
        profileImage.top            == optionImage.bottom + .ratioWidthBasedOniPhoneX(20)
        profileImage.height         == .ratioHeightBasedOniPhoneX(60)
        profileImage.width          == .ratioHeightBasedOniPhoneX(60)
        
        headLabel.top               == profileImage.top + .ratioHeightBasedOniPhoneX(10)
        headLabel.leading           == profileImage.trailing + .ratioHeightBasedOniPhoneX(8)
        
        userName.top                == headLabel.bottom + .ratioHeightBasedOniPhoneX(2)
        userName.leading            == profileImage.trailing + .ratioHeightBasedOniPhoneX(8)
        
    }
    
}
