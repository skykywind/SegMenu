//
//  SegMenuConfiguration.swift
//  FBSnapshotTestCase
//
//  Created by 贾富佳 on 2019/6/24.
//

import UIKit

public class SegMenuConfiguration {
    
    open var menuHeight: CGFloat      = 34.0
    open var menuMargin: CGFloat      = 15.0
    open var menuItemWidth: CGFloat   = 111.0
    open var indicatorHeight: CGFloat = 3.0
    
    open var scrollDuration: Int = 500 // Milliseconds
    
    open var indicatorColor: UIColor              = UIColor.white
    open var selectedMenuItemTextColor: UIColor   = UIColor.white
    open var unselectedMenuItemTextColor: UIColor = UIColor.lightGray
    open var scrollMenuBackgroundColor: UIColor   = UIColor.black
    open var viewBackgroundColor: UIColor         = UIColor.white
    open var bottomMenuHairlineColor: UIColor     = UIColor.white
    open var menuItemSeparatorColor: UIColor      = UIColor.lightGray
    
    open var menuItemFont: UIFont = UIFont.systemFont(ofSize: 15.0)
    
    open var menuItemSeparatorPercentageHeight: CGFloat = 0.2
    open var menuItemSeparatorWidth: CGFloat            = 0.5
    open var menuItemSeparatorRoundEdges: Bool          = false
    
    open var addBottomMenuHairline: Bool        = true
    open var autoAdjustItemWidthWithTitle: Bool = false
    open var autoAdjustFontWithItemWidth: Bool  = false
    open var useMenuAsSegmentedControl: Bool    = false
    open var centerMenuItems:Bool               = false
    open var enableHorizontalBounce: Bool       = false
    open var hideTopMenuBar:Bool                = false
    
    public init() {}

}
