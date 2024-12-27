//
//  SubControllViews.swift
//  AppLogiq
//
//  Created by venkat subramaian on 27/12/24.
//

import Foundation
import UIKit

class SubControllViews: UIView {
    
    
    lazy var controllImages: UIImageView! = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var backView: UIView! = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = .ratioHeightBasedOniPhoneX(20)
        return view
    }()
    
    lazy var lineView: UIView! = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var connectImages: UIImageView! = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let connectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let OnOffLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "OFF"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let Switch: UISwitch = {
        let Switch = UISwitch()
        Switch.isOn = false
        Switch.onTintColor = .black
        Switch.thumbTintColor = .white
        Switch.tintColor = .lightGray
        Switch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return Switch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsUIElements()
    }
    
    private func addSubviewsUIElements() {
   addSubviews(with: [backView, controllImages, lineView, connectImages, Switch, OnOffLabel, connectLabel])
        
        backView.top             ==  top + .ratioHeightBasedOniPhoneX(15)
        backView.leading         ==  leading + .ratioHeightBasedOniPhoneX(15)
        backView.height          == .ratioHeightBasedOniPhoneX(40)
        backView.width           == .ratioHeightBasedOniPhoneX(40)
        
        connectImages.top        ==  top + .ratioHeightBasedOniPhoneX(20)
        connectImages.trailing   ==  trailing - .ratioHeightBasedOniPhoneX(15)
        connectImages.height     == .ratioHeightBasedOniPhoneX(24)
        connectImages.width      == .ratioHeightBasedOniPhoneX(24)
        
   
        
        controllImages.centerX    ==  backView.centerX
        controllImages.centerY    ==  backView.centerY
        controllImages.height     == .ratioHeightBasedOniPhoneX(24)
        controllImages.width      == .ratioHeightBasedOniPhoneX(24)
        
        connectLabel.leading      == leading + .ratioHeightBasedOniPhoneX(20)
        connectLabel.top          ==  backView.bottom + .ratioHeightBasedOniPhoneX(10)
        
        lineView.top              == connectLabel.bottom + .ratioHeightBasedOniPhoneX(7)
        lineView.leading          == leading + .ratioWidthBasedOniPhoneX(20)
        lineView.trailing         == trailing - .ratioWidthBasedOniPhoneX(20)
        lineView.height           == .ratioHeightBasedOniPhoneX(1)
        
        Switch.bottom             ==  bottom - .ratioHeightBasedOniPhoneX(25)
        Switch.trailing           ==  trailing - .ratioHeightBasedOniPhoneX(40)
        Switch.height             == .ratioHeightBasedOniPhoneX(20)
        Switch.width              == .ratioHeightBasedOniPhoneX(20)
        
        
       OnOffLabel.bottom           ==  bottom - .ratioHeightBasedOniPhoneX(25)
       OnOffLabel.leading          == leading + .ratioWidthBasedOniPhoneX(20)
       OnOffLabel.centerY          == OnOffLabel.centerY
        
        
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            OnOffLabel.text = "ON"
            OnOffLabel.textColor = .black
        } else {
            OnOffLabel.text = "OFF"
            OnOffLabel.textColor = .gray
        }
    }
    
    func configure(setControllImag: UIImage?, setConnectImages: UIImage?, setOnOffLabel: String, setconnectLabel: String) {
        controllImages.image = setControllImag
        connectImages.image = setConnectImages
        OnOffLabel.text = setOnOffLabel
        connectLabel.text = setconnectLabel
       }
    
    
}
