//
//  AcTempView.swift
//  AppLogiq
//
//  Created by venkat subramaian on 27/12/24.
//

import Foundation
import UIKit

class AcTempView: UIView {
    
    
    lazy var acImage: UIImageView! = {
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
    
    lazy var tempImage: UIImageView! = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let acLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "18°"
        label.font = UIFont.systemFont(ofSize: 60, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
       }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(decreaseTemperature), for: .touchUpInside)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(increaseTemperature), for: .touchUpInside)
        return button
    }()
    
    private let acSwitch: UISwitch = {
        let acSwitch = UISwitch()
        acSwitch.isOn = true
        acSwitch.onTintColor = .black
        acSwitch.thumbTintColor = .white
        acSwitch.tintColor = .lightGray
        return acSwitch
    }()
    
    
    private var temperature: Int = 18
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsUIElements()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsUIElements()
    }
    
    private func addSubviewsUIElements() {
        
        addSubviews(with: [backView, acLabel, tempImage, tempLabel, temperatureLabel, acSwitch, plusButton, minusButton])
        backView.addSubview(acImage)
        
        
        backView.top             ==  top + .ratioHeightBasedOniPhoneX(20)
        backView.leading         ==  leading + .ratioHeightBasedOniPhoneX(20)
        backView.height          == .ratioHeightBasedOniPhoneX(40)
        backView.width           == .ratioHeightBasedOniPhoneX(40)
        
        acLabel.centerY          == backView.centerY
        acLabel.leading          == backView.trailing + .ratioWidthBasedOniPhoneX(5)
        
        acImage.centerX          ==  backView.centerX
        acImage.centerY          ==  backView.centerY
        acImage.height           == .ratioHeightBasedOniPhoneX(24)
        acImage.width            == .ratioHeightBasedOniPhoneX(24)
        
        
        tempImage.bottom         ==  bottom - .ratioHeightBasedOniPhoneX(40)
        tempImage.leading        ==  leading + .ratioHeightBasedOniPhoneX(20)
        tempImage.height         == .ratioHeightBasedOniPhoneX(24)
        tempImage.width          == .ratioHeightBasedOniPhoneX(24)
        
        tempLabel.centerY        == tempImage.centerY
        tempLabel.leading        == tempImage.trailing + .ratioWidthBasedOniPhoneX(5)
        
        acSwitch.top             ==  top + .ratioHeightBasedOniPhoneX(20)
        acSwitch.trailing        ==  trailing - .ratioHeightBasedOniPhoneX(30)
        acSwitch.height          == .ratioHeightBasedOniPhoneX(30)
        acSwitch.width           == .ratioHeightBasedOniPhoneX(30)
        
        minusButton.bottom       ==  bottom - .ratioHeightBasedOniPhoneX(40)
        minusButton.leading      ==  tempLabel.trailing + .ratioHeightBasedOniPhoneX(40)
        minusButton.height       == .ratioHeightBasedOniPhoneX(35)
        minusButton.width        == .ratioHeightBasedOniPhoneX(35)
        
        temperatureLabel.bottom  == bottom - .ratioHeightBasedOniPhoneX(20)
        temperatureLabel.leading ==  minusButton.trailing + .ratioHeightBasedOniPhoneX(30)

        
        plusButton.bottom         ==  bottom - .ratioHeightBasedOniPhoneX(40)
        plusButton.trailing       ==  trailing - .ratioHeightBasedOniPhoneX(20)
        plusButton.height         == .ratioHeightBasedOniPhoneX(35)
        plusButton.width          == .ratioHeightBasedOniPhoneX(35)
        
    }
    
    
    func configure(setAcImag: UIImage?, setAcLabel: String, setTempImage: UIImage?, setTempLabel: String) {
           acImage.image = setAcImag
           acLabel.text = setAcLabel
           tempImage.image = setTempImage
           tempLabel.text = setTempLabel
       }
    
    @objc private func increaseTemperature() {
        if temperature < 32 {
            temperature += 1
            updateTemperatureLabel()
        }
    }

    @objc private func decreaseTemperature() {
        if temperature > 16 {
            temperature -= 1
            updateTemperatureLabel()
        }
    }

    private func updateTemperatureLabel() {
        temperatureLabel.text = "\(temperature)°"
    }
    
    
}
