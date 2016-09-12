//
//  ViewController.swift
//  XCActionSheet
//
//  Created by tm on 16/9/9.
//  Copyright © 2016年 tm. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XCActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let acView = XCActionSheet()
        acView.delegate = self
        acView.initView(title: "哈哈", buttonTitles: ["哈哈哈","嗯男","嗯哼"], cancleBtuttonTitle: "取消")
        acView.showInView(view)
    }
    
    func dismissWithButtonIndex(object: AnyObject, index: NSInteger) {
        print(object)
        print(index)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

