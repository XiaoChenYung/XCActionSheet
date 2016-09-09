
//
//  XCActionSheet.swift
//  XCActionSheet
//
//  Created by tm on 16/9/9.
//  Copyright © 2016年 tm. All rights reserved.
//

import UIKit
let cellHeight: CGFloat = 44

class XCActionSheet: UIView {
    
//    let tableView = UITableView()
    
    let items = NSMutableArray()
    
    
    

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func initView(title title: String,buttonTitles titles: [String],cancleBtuttonTitle: String) -> () {
//        items.addObject(title)
        items.addObjectsFromArray(titles)
        backgroundColor = UIColor.init(red: 230, green: 230, blue: 230, alpha: 0.84)
        var index: CGFloat = 0
        for item in titles {
            let button = UIButton()
            button.frame = CGRectMake(0, cellHeight * index, UIScreen.mainScreen().bounds.size.width, cellHeight)
            button.setTitle(item, forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
//            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            addSubview(button)
            index += 1
        }
        
    }
    
    func showInView(view: UIView) -> () {
        view.addSubview(self)
        frame = CGRectMake(0, view.bounds.size.height, view.bounds.size.width, (cellHeight * CGFloat(items.count)))
        UIView.animateWithDuration(0.2) { 
            self.frame = CGRectMake(0, view.bounds.size.height - cellHeight * CGFloat(self.items.count), view.bounds.size.width, cellHeight * CGFloat(self.items.count))
        }
    }

}
