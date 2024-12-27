//
//  HomeViewController.swift
//  AppLogiq
//
//  Created by venkat subramaian on 27/12/24.
//

import Foundation
import UIKit


class HomeViewController: UIViewController, UITabBarDelegate {
    
    
    lazy var headerView: HeaderView = {
        let view = HeaderView()
        return view
    }()
    
    private let roomTabs: UISegmentedControl = {
        let  segmentedControl = UISegmentedControl(items: ["Living Room", "Bedroom 1", "Dining", "Kitchen"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGray6
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        segmentedControl.layer.cornerRadius = 50
        segmentedControl.layer.masksToBounds = true
        return segmentedControl
       }()
    
    lazy var acTempView: AcTempView = {
        let view = AcTempView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.configure(setAcImag: UIImage(named: "AcImage"), setAcLabel: "AC", setTempImage: UIImage(named: "Temp"), setTempLabel: "Temp")
        return view
    }()
    
    
    lazy var smartTvView: SubControllViews = {
        let view = SubControllViews()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.configure(setControllImag:  UIImage(named: "monitor"), setConnectImages:  UIImage(named: "wifi"), setOnOffLabel: "OFF", setconnectLabel: "Smart TV")
        return view
    }()
    
    lazy var lampView: SubControllViews = {
        let view = SubControllViews()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.configure(setControllImag:  UIImage(named: "lamp"), setConnectImages:  UIImage(named: "wifi"), setOnOffLabel: "OFF", setconnectLabel: "Table Lamp")
        return view
    }()
    
    lazy var routerView: SubControllViews = {
        let view = SubControllViews()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.configure(setControllImag:  UIImage(named: "router"), setConnectImages:  UIImage(named: "wifi"), setOnOffLabel: "OFF", setconnectLabel: "Router")
        return view
    }()
    
    lazy var speakerView: SubControllViews = {
        let view = SubControllViews()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 4
        view.configure(setControllImag:  UIImage(named: "speaker"), setConnectImages:  UIImage(named: "bluetooth"), setOnOffLabel: "OFF", setconnectLabel: "Speakers")
        return view
    }()
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        let homeImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 25, height: 25))
        let wifiImage = UIImage(named: "airdrop")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 25, height: 25))
        let personImage = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal).resizeImage(targetSize: CGSize(width: 25, height: 25))
        tabBar.items = [
                UITabBarItem(title: nil, image: homeImage, tag: 0),
                UITabBarItem(title: nil, image: wifiImage, tag: 1),
                UITabBarItem(title: nil, image: personImage, tag: 2)
            ]
        tabBar.selectedItem = tabBar.items?.first
        tabBar.tintColor = .black
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.items?.forEach { item in
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -3, right: 0)
        }
        return tabBar
    }()
    
    private let dotView: UIView = {
          let view = UIView()
          view.backgroundColor = .black
          view.layer.cornerRadius = 3
          view.isHidden = true
          return view
      }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        view.backgroundColor = .systemGray5
        tabBar.delegate = self
        positionDotView()
        
    }
    
    fileprivate func setUpSubViews() {
        view.addSubviews(with: [headerView, roomTabs, acTempView, smartTvView, lampView, routerView, speakerView, tabBar, dotView])
        
        headerView.top              == view.safeAreaLayoutGuide.topAnchor
        headerView.leading          == view.leading + .ratioHeightBasedOniPhoneX(10)
        headerView.trailing         == view.trailing - .ratioHeightBasedOniPhoneX(10)
        headerView.height           == .ratioHeightBasedOniPhoneX(120)
        
        roomTabs.top                == headerView.bottom + .ratioHeightBasedOniPhoneX(10)
        roomTabs.leading            == view.leading + .ratioHeightBasedOniPhoneX(10)
        roomTabs.trailing           == view.trailing - .ratioHeightBasedOniPhoneX(10)
        
        
        acTempView.top              ==  roomTabs.bottom + .ratioHeightBasedOniPhoneX(20)
        acTempView.leading          == view.leading + .ratioHeightBasedOniPhoneX(10)
        acTempView.trailing         == view.trailing - .ratioHeightBasedOniPhoneX(10)
        acTempView.height           ==  .ratioHeightBasedOniPhoneX(150)
        
        smartTvView.top             ==  acTempView.bottom + .ratioHeightBasedOniPhoneX(20)
        smartTvView.leading         == view.leading + .ratioHeightBasedOniPhoneX(10)
        smartTvView.height          ==  .ratioHeightBasedOniPhoneX(150)
        smartTvView.width           == .ratioWidthBasedOniPhoneX(170)
        
        lampView.top                ==  acTempView.bottom + .ratioHeightBasedOniPhoneX(20)
        lampView.trailing           == view.trailing - .ratioHeightBasedOniPhoneX(10)
        lampView.height             ==  .ratioHeightBasedOniPhoneX(150)
        lampView.width              == .ratioWidthBasedOniPhoneX(170)
        
        routerView.top              ==  smartTvView.bottom + .ratioHeightBasedOniPhoneX(20)
        routerView.leading          == view.leading + .ratioHeightBasedOniPhoneX(10)
        routerView.height           ==  .ratioHeightBasedOniPhoneX(150)
        routerView.width            == .ratioWidthBasedOniPhoneX(170)
        
        speakerView.top             ==  lampView.bottom + .ratioHeightBasedOniPhoneX(20)
        speakerView.trailing        == view.trailing - .ratioHeightBasedOniPhoneX(10)
        speakerView.height          ==  .ratioHeightBasedOniPhoneX(150)
        speakerView.width           == .ratioWidthBasedOniPhoneX(170)
        
        tabBar.bottom               ==  view.bottom - .ratioWidthBasedOniPhoneX(20)
        tabBar.leading              == view.leading + .ratioWidthBasedOniPhoneX(10)
        tabBar.trailing             == view.trailing - .ratioWidthBasedOniPhoneX(10)
        tabBar.height               == .ratioHeightBasedOniPhoneX(60)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else { return }
        updateDotPosition(for: index)
    }
    
    private func positionDotView() {
        guard let selectedIndex = tabBar.items?.firstIndex(of: tabBar.selectedItem ?? UITabBarItem()) else { return }
        updateDotPosition(for: selectedIndex)
    }
    
    private func updateDotPosition(for index: Int) {
        let tabBarItemWidth = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 1)
        let dotX = (tabBarItemWidth * CGFloat(index)) + (tabBarItemWidth / 2) + 7
        let tabBarItemHeight = tabBar.frame.height
        let dotY = tabBar.frame.origin.y + tabBarItemHeight - 20
        dotView.frame = CGRect(x: dotX, y: dotY, width: 6, height: 6)
        dotView.isHidden = false
    }

}
