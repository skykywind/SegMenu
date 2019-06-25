//
//  SegMenu+UIConfiguration.swift
//  FBSnapshotTestCase
//
//  Created by 贾富佳 on 2019/6/24.
//

import UIKit

import UIKit

extension SegMenu {
    func configureSegMenu(options: [SegMenuOption]) {
        for option in options {
            switch (option) {
            case let .indicatorHeight(value):
                configuration.indicatorHeight = value
            case let .menuItemSeparatorWidth(value):
                configuration.menuItemSeparatorWidth = value
            case let .scrollMenuBackgroundColor(value):
                configuration.scrollMenuBackgroundColor = value
            case let .viewBackgroundColor(value):
                configuration.viewBackgroundColor = value
            case let .bottomMenuHairlineColor(value):
                configuration.bottomMenuHairlineColor = value
            case let .indicatorColor(value):
                configuration.indicatorColor = value
            case let .menuItemSeparatorColor(value):
                configuration.menuItemSeparatorColor = value
            case let .menuMargin(value):
                configuration.menuMargin = value
            case let .menuItemMargin(value):
                menuItemMargin = value
            case let .menuHeight(value):
                configuration.menuHeight = value
            case let .selectedMenuItemTextColor(value):
                configuration.selectedMenuItemTextColor = value
            case let .unselectedMenuItemTextColor(value):
                configuration.unselectedMenuItemTextColor = value
            case let .useMenuAsSegmentedControl(value):
                configuration.useMenuAsSegmentedControl = value
            case let .menuItemSeparatorRoundEdges(value):
                configuration.menuItemSeparatorRoundEdges = value
            case let .menuItemFont(value):
                configuration.menuItemFont = value
            case let .menuItemSeparatorPercentageHeight(value):
                configuration.menuItemSeparatorPercentageHeight = value
            case let .menuItemWidth(value):
                configuration.menuItemWidth = value
            case let .enableHorizontalBounce(value):
                configuration.enableHorizontalBounce = value
            case let .addBottomMenuHairline(value):
                configuration.addBottomMenuHairline = value
            case let .autoAdjustMenuItemWidthWithTitle(value):
                configuration.autoAdjustItemWidthWithTitle = value
            case let .autoAdjustFontWithMenuItemWidth(value):
                configuration.autoAdjustFontWithItemWidth = value
            case let .scrollDuration(value):
                configuration.scrollDuration = value
            case let .centerMenuItems(value):
                configuration.centerMenuItems = value
            case let .hideTopMenuBar(value):
                configuration.hideTopMenuBar = value
            }
        }
        
        if configuration.hideTopMenuBar {
            configuration.addBottomMenuHairline = false
            configuration.menuHeight = 0.0
        }
    }
    
    func setUpUserInterface() {
        let viewsDictionary = ["menuScrollView": menuScrollView, "controllerScrollView": controllerScrollView]
        
        // Set up controller scroll view
        controllerScrollView.isPagingEnabled = true
        controllerScrollView.translatesAutoresizingMaskIntoConstraints = false
        controllerScrollView.alwaysBounceHorizontal = configuration.enableHorizontalBounce
        controllerScrollView.bounces = configuration.enableHorizontalBounce
        controllerScrollView.frame = CGRect(x: 0.0, y: configuration.menuHeight, width: view.frame.width, height: view.frame.height)
        view.addSubview(controllerScrollView)
        
        let controllerScrollView_constraint_H:Array = NSLayoutConstraint.constraints(withVisualFormat: "H:|[controllerScrollView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let controllerScrollView_constraint_V:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|[controllerScrollView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(controllerScrollView_constraint_H)
        view.addConstraints(controllerScrollView_constraint_V)
        
        // Set up menu scroll view
        menuScrollView.translatesAutoresizingMaskIntoConstraints = false
        menuScrollView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: configuration.menuHeight)
        self.view.addSubview(menuScrollView)
        
        let menuScrollView_constraint_H:Array = NSLayoutConstraint.constraints(withVisualFormat: "H:|[menuScrollView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let menuScrollView_constraint_V:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:[menuScrollView(\(configuration.menuHeight))]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(menuScrollView_constraint_H)
        view.addConstraints(menuScrollView_constraint_V)
        
        // Add hairline to menu scroll view
        if configuration.addBottomMenuHairline {
            let menuBottomHairline : UIView = UIView()
            
            menuBottomHairline.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(menuBottomHairline)
            
            let menuBottomHairline_constraint_H:Array = NSLayoutConstraint.constraints(withVisualFormat: "H:|[menuBottomHairline]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["menuBottomHairline":menuBottomHairline])
            let menuBottomHairline_constraint_V:Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(configuration.menuHeight)-[menuBottomHairline(0.5)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["menuBottomHairline":menuBottomHairline])
            
            self.view.addConstraints(menuBottomHairline_constraint_H)
            self.view.addConstraints(menuBottomHairline_constraint_V)
            
            menuBottomHairline.backgroundColor = configuration.bottomMenuHairlineColor
        }
        
        // Disable scroll bars
        menuScrollView.showsHorizontalScrollIndicator = false
        menuScrollView.showsVerticalScrollIndicator = false
        controllerScrollView.showsHorizontalScrollIndicator = false
        controllerScrollView.showsVerticalScrollIndicator = false
        
        // Set background color behind scroll views and for menu scroll view
        self.view.backgroundColor = configuration.viewBackgroundColor
        menuScrollView.backgroundColor = configuration.scrollMenuBackgroundColor
    }
    
    func configureUserInterface() {
        // Add tap gesture recognizer to controller scroll view to recognize menu item selection
        let menuItemTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SegMenu.handleMenuItemTap(_:)))
        menuItemTapGestureRecognizer.numberOfTapsRequired = 1
        menuItemTapGestureRecognizer.numberOfTouchesRequired = 1
        menuItemTapGestureRecognizer.delegate = self
        menuScrollView.addGestureRecognizer(menuItemTapGestureRecognizer)
        
        // Set delegate for controller scroll view
        controllerScrollView.delegate = self
        
        // When the user taps the status bar, the scroll view beneath the touch which is closest to the status bar will be scrolled to top,
        // but only if its `scrollsToTop` property is YES, its delegate does not return NO from `shouldScrollViewScrollToTop`, and it is not already at the top.
        // If more than one scroll view is found, none will be scrolled.
        // Disable scrollsToTop for menu and controller scroll views so that iOS finds scroll views within our pages on status bar tap gesture.
        menuScrollView.scrollsToTop = false;
        controllerScrollView.scrollsToTop = false;
        
        // Configure menu scroll view
        if configuration.useMenuAsSegmentedControl {
            menuScrollView.isScrollEnabled = false
            menuScrollView.contentSize = CGSize(width: self.view.frame.width, height: configuration.menuHeight)
            configuration.menuMargin = 0.0
        } else {
            menuScrollView.contentSize = CGSize(width: (configuration.menuItemWidth + configuration.menuMargin) * CGFloat(controllerArray.count) + configuration.menuMargin, height: configuration.menuHeight)
        }
        
        // Configure controller scroll view content size
        controllerScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(controllerArray.count), height: 0.0)
        
        var index : CGFloat = 0.0
        
        for controller in controllerArray {
            if index == 0.0 {
                // Add first two controllers to scrollview and as child view controller
                controller.viewWillAppear(true)
                addPageAtIndex(0)
                controller.viewDidAppear(true)
            }
            
            // Set up menu item for menu scroll view
            var menuItemFrame : CGRect = CGRect()
            
            if configuration.useMenuAsSegmentedControl {
                //**************************拡張*************************************
                if menuItemMargin > 0 {
                    let marginSum = menuItemMargin * CGFloat(controllerArray.count + 1)
                    let menuItemWidth = (self.view.frame.width - marginSum) / CGFloat(controllerArray.count)
                    menuItemFrame = CGRect(x: CGFloat(menuItemMargin * (index + 1)) + menuItemWidth * CGFloat(index), y: 0.0, width: CGFloat(self.view.frame.width) / CGFloat(controllerArray.count), height: configuration.menuHeight)
                } else {
                    menuItemFrame = CGRect(x: self.view.frame.width / CGFloat(controllerArray.count) * CGFloat(index), y: 0.0, width: CGFloat(self.view.frame.width) / CGFloat(controllerArray.count), height: configuration.menuHeight)
                }
                //**************************拡張ここまで*************************************
            } else if configuration.autoAdjustItemWidthWithTitle {
                let controllerTitle : String? = controller.title
                
                let titleText : String = controllerTitle != nil ? controllerTitle! : "Menu \(Int(index) + 1)"
                let itemWidthRect : CGRect = (titleText as NSString).boundingRect(with: CGSize(width: 1000, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: configuration.menuItemFont], context: nil)
                configuration.menuItemWidth = itemWidthRect.width
                
                menuItemFrame = CGRect(x: totalMenuItemWidthIfDifferentWidths + configuration.menuMargin + (configuration.menuMargin * index), y: 0.0, width: configuration.menuItemWidth, height: configuration.menuHeight)
                
                totalMenuItemWidthIfDifferentWidths += itemWidthRect.width
                menuItemWidths.append(itemWidthRect.width)
            } else {
                if configuration.centerMenuItems && index == 0.0  {
                    startingMenuMargin = ((self.view.frame.width - ((CGFloat(controllerArray.count) * configuration.menuItemWidth) + (CGFloat(controllerArray.count - 1) * configuration.menuMargin))) / 2.0) -  configuration.menuMargin
                    
                    if startingMenuMargin < 0.0 {
                        startingMenuMargin = 0.0
                    }
                    
                    menuItemFrame = CGRect(x: startingMenuMargin + configuration.menuMargin, y: 0.0, width: configuration.menuItemWidth, height: configuration.menuHeight)
                } else {
                    menuItemFrame = CGRect(x: configuration.menuItemWidth * index + configuration.menuMargin * (index + 1) + startingMenuMargin, y: 0.0, width: configuration.menuItemWidth, height: configuration.menuHeight)
                }
            }
            
            let menuItemView: SegMenuItem = SegMenuItem(frame: menuItemFrame)
            menuItemView.configure(for: self, controller: controller, index: index)
            
            // Add menu item view to menu scroll view
            menuScrollView.addSubview(menuItemView)
            menuItems.append(menuItemView)
            
            index += 1
        }
        
        // Set new content size for menu scroll view if needed
        if configuration.autoAdjustItemWidthWithTitle {
            menuScrollView.contentSize = CGSize(width: (totalMenuItemWidthIfDifferentWidths + configuration.menuMargin) + CGFloat(controllerArray.count) * configuration.menuMargin, height: configuration.menuHeight)
        }
        
        // Set selected color for title label of selected menu item
        if menuItems.count > 0 {
            if menuItems[currentPageIndex].titleLabel != nil {
                menuItems[currentPageIndex].titleLabel!.textColor = configuration.selectedMenuItemTextColor
            }
        }
        
        // Configure selection indicator view
        var selectionIndicatorFrame: CGRect = CGRect()
        
        if configuration.useMenuAsSegmentedControl {
            selectionIndicatorFrame = CGRect(x: 0.0, y: configuration.menuHeight - configuration.indicatorHeight, width: self.view.frame.width / CGFloat(controllerArray.count), height: configuration.indicatorHeight)
        } else if configuration.autoAdjustItemWidthWithTitle {
            selectionIndicatorFrame = CGRect(x: configuration.menuMargin, y: configuration.menuHeight - configuration.indicatorHeight, width: menuItemWidths[0], height: configuration.indicatorHeight)
        } else {
            if configuration.centerMenuItems  {
                selectionIndicatorFrame = CGRect(x: startingMenuMargin + configuration.menuMargin, y: configuration.menuHeight - configuration.indicatorHeight, width: configuration.menuItemWidth, height: configuration.indicatorHeight)
            } else {
                selectionIndicatorFrame = CGRect(x: configuration.menuMargin, y: configuration.menuHeight - configuration.indicatorHeight, width: configuration.menuItemWidth, height: configuration.indicatorHeight)
            }
        }
        
        indicatorView = UIView(frame: selectionIndicatorFrame)
        indicatorView.backgroundColor = configuration.indicatorColor
        menuScrollView.addSubview(indicatorView)
    }
}

