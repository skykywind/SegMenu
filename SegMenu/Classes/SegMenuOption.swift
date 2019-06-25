//
//  SegMenuOption.swift
//  FBSnapshotTestCase
//
//  Created by 贾富佳 on 2019/6/24.
//

import UIKit

import UIKit

public enum SegMenuOption {
    case indicatorHeight(CGFloat)
    case menuItemSeparatorWidth(CGFloat)
    case scrollMenuBackgroundColor(UIColor)
    case viewBackgroundColor(UIColor)
    case bottomMenuHairlineColor(UIColor)
    case indicatorColor(UIColor)
    case menuItemSeparatorColor(UIColor)
    case menuMargin(CGFloat)
    case menuItemMargin(CGFloat)
    case menuHeight(CGFloat)
    case selectedMenuItemTextColor(UIColor)
    case unselectedMenuItemTextColor(UIColor)
    case useMenuAsSegmentedControl(Bool)
    case menuItemSeparatorRoundEdges(Bool)
    case menuItemFont(UIFont)
    case menuItemSeparatorPercentageHeight(CGFloat)
    case menuItemWidth(CGFloat)
    case enableHorizontalBounce(Bool)
    case addBottomMenuHairline(Bool)
    case autoAdjustMenuItemWidthWithTitle(Bool)
    case autoAdjustFontWithMenuItemWidth(Bool)
    case scrollDuration(Int) // Milliseconds
    case centerMenuItems(Bool)
    case hideTopMenuBar(Bool)
}
