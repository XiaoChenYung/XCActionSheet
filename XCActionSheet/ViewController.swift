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
    
    @IBAction func show(_ sender: AnyObject) {
        let acView = XCActionSheet()
        acView.delegate = self
        acView.initView(title: "哈哈", buttonTitles: ["哈哈哈","嗯男","嗯哼"], cancleBtuttonTitle: "取消")
        acView.showInView(view)
    }
    
    deinit {
        print("控制器挂了")
    }
    
    func dismissWithButtonIndex(_ object: AnyObject, index: NSInteger) {
        print(object)
        print(index)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

