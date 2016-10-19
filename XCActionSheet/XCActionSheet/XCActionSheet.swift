
//
//  XCActionSheet.swift
//  XCActionSheet
//
//  Created by tm on 16/9/9.
//  Copyright © 2016年 tm. All rights reserved.
//

import UIKit
let cellHeight: CGFloat = 50
let blackMarganHeight: CGFloat = 5

protocol XCActionSheetDelegate: class {
    func dismissWithButtonIndex (_ object: AnyObject, index: Int) -> ()
}

class XCActionSheet: UIView {
    
    weak var delegate: XCActionSheetDelegate?
    
    let items = NSMutableArray()
    
    let contentView = UIView()
    
    let templayer = CALayer()
    
    var cancleTitle = ""
    
    var fatherView: UIView?
    
    
    func initView(title: String,buttonTitles titles: [String],cancleBtuttonTitle: String) -> () {
        items.addObjects(from: titles)
        cancleTitle = cancleBtuttonTitle
        
    }
    
    fileprivate func config() {
//        backgroundColor = UIColor.init(red: 230, green: 230, blue: 230, alpha
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//        contentView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        addSubview(contentView)
        
        
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: fatherView!.bounds.size.width, height: cellHeight * CGFloat(self.items.count + 1) + blackMarganHeight)
        contentView.addSubview(blurView)
        addbuttons()
        addlines()
        addBottomMargion()
        addCancleButton()
        addBgView()
    }
    
    func dismiss() -> () {
        UIView.animate(withDuration: 0.2, animations: { 
            self.contentView.frame = CGRect(x: 0, y: self.fatherView!.bounds.size.height, width: self.fatherView!.bounds.size.width, height: cellHeight * CGFloat(self.items.count + 1) + blackMarganHeight)
            }, completion: { (isAn) in
                self.removeFromSuperview()
        }) 
    }
    
    fileprivate func addBgView() {
        let view = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(XCActionSheet.dismiss))
        view.addGestureRecognizer(tap)
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.backgroundColor = UIColor.clear
        templayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        templayer.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        view.layer.addSublayer(templayer)
        insertSubview(view, at: 0)
    }
    
    fileprivate func addbuttons() {
        var index: CGFloat = 0
        for item in items {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: cellHeight * index, width: UIScreen.main.bounds.size.width, height: cellHeight)
            button.setTitle(item as? String, for: UIControlState())
            button.setTitleColor(UIColor.white, for: .highlighted)
            button.setTitleColor(UIColor.black, for: UIControlState())
            button.setBackgroundImage(UIImage(named: "button"), for: .highlighted)
            contentView.addSubview(button)
            index += 1
            button.tag = Int(index)
            button.addTarget(self, action: #selector(XCActionSheet.click), for: .touchUpInside)
        }
    }
    
    fileprivate func addlines() {
        for index in 1..<items.count {
            let line = UIView()
            line.backgroundColor = UIColor.lightGray
            contentView.addSubview(line)
            line.frame = CGRect(x: 0, y: cellHeight * CGFloat(index), width: UIScreen.main.bounds.size.width, height: 0.5)
        }
    }
    
    fileprivate func addBottomMargion() {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 0.9)
        view.frame = CGRect(x: 0, y: cellHeight * CGFloat(items.count), width: UIScreen.main.bounds.size.width, height: blackMarganHeight)
        contentView.addSubview(view)
    }
    
    fileprivate func addCancleButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: cellHeight * CGFloat(items.count) + blackMarganHeight, width: UIScreen.main.bounds.size.width, height: cellHeight)
        button.setTitle(cancleTitle, for: UIControlState())
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.setBackgroundImage(UIImage(named: "button"), for: .highlighted)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(XCActionSheet.click), for: .touchUpInside)
        button.tag = 100
    }
    
    func showInView(_ view: UIView) -> () {
        view.addSubview(self)
        fatherView = view
        
        contentView.frame = CGRect(x: 0, y: view.bounds.size.height, width: view.bounds.size.width, height: cellHeight * CGFloat(items.count + 1) + blackMarganHeight)
        config()
        UIView.animate(withDuration: 0.2, animations: {
            
            self.contentView.frame = CGRect(x: 0, y: view.bounds.size.height - cellHeight * CGFloat(self.items.count + 1) - blackMarganHeight, width: view.bounds.size.width, height: cellHeight * CGFloat(self.items.count + 1) + blackMarganHeight)
        }) 
    }
    
    func click(_ button: UIButton) -> () {
        button.isHighlighted = true
        if button.tag != 100 {
            delegate?.dismissWithButtonIndex(self, index: button.tag)
        }
    }

}
