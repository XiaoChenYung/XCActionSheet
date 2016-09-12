
//
//  XCActionSheet.swift
//  XCActionSheet
//
//  Created by tm on 16/9/9.
//  Copyright © 2016年 tm. All rights reserved.
//

import UIKit
let cellHeight: CGFloat = 44
let blackMarganHeight: CGFloat = 5

class XCActionSheet: UIView {
    
    let items = NSMutableArray()
    
    var cancleTitle = ""
    
    
    func initView(title title: String,buttonTitles titles: [String],cancleBtuttonTitle: String) -> () {
        items.addObjectsFromArray(titles)
        cancleTitle = cancleBtuttonTitle
        config()
    }
    
    private func config() {
        backgroundColor = UIColor.init(red: 230, green: 230, blue: 230, alpha: 0.84)
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurView)
        addbuttons()
        addlines()
        addBottomMargion()
        addCancleButton()
    }
    
    private func addbuttons() {
        var index: CGFloat = 0
        for item in items {
            let button = UIButton()
            button.frame = CGRectMake(0, cellHeight * index, UIScreen.mainScreen().bounds.size.width, cellHeight)
            button.setTitle(item as? String, forState: .Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setBackgroundImage(UIImage(named: "button"), forState: .Highlighted)
            addSubview(button)
            index += 1
        }
    }
    
    private func addlines() {
        for index in 1..<items.count {
            let line = UIView()
            line.backgroundColor = UIColor.lightGrayColor();
            addSubview(line)
            line.frame = CGRectMake(0, cellHeight * CGFloat(index), UIScreen.mainScreen().bounds.size.width, 0.5)
        }
    }
    
    private func addBottomMargion() {
        let view = UIView()
        view.backgroundColor = UIColor.darkGrayColor()
        view.frame = CGRectMake(0, cellHeight * CGFloat(items.count), UIScreen.mainScreen().bounds.size.width, blackMarganHeight)
        addSubview(view)
    }
    
    private func addCancleButton() {
        let button = UIButton()
        button.frame = CGRectMake(0, cellHeight * CGFloat(items.count) + blackMarganHeight, UIScreen.mainScreen().bounds.size.width, cellHeight)
        button.setTitle(cancleTitle, forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setBackgroundImage(UIImage(named: "button"), forState: .Highlighted)
        addSubview(button)
    }
    
    func showInView(view: UIView) -> () {
        view.addSubview(self)
        frame = CGRectMake(0, view.bounds.size.height, view.bounds.size.width, cellHeight * CGFloat(items.count + 1) + blackMarganHeight)
        UIView.animateWithDuration(0.2) { 
            self.frame = CGRectMake(0, view.bounds.size.height - cellHeight * CGFloat(self.items.count + 1) - blackMarganHeight, view.bounds.size.width, cellHeight * CGFloat(self.items.count + 1) + blackMarganHeight)
        }
    }

}
