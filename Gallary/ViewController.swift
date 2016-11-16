//
//  ViewController.swift
//  Gallary
//
//  Created by MichelleMeng on 16/11/3.
//  Copyright © 2016年 MichelleMeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animalPicker.dataSource = self
        animalPicker.delegate = self
        
        
        let item = UIBarButtonItem(title: "动物画廊", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item

    }
    
    
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animals.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animals[row]
    }
    
    
    @IBOutlet weak var animalPicker: UIPickerView!
    
    let animals = ["小鹿", "长颈鹿", "小象", "羊驼"]

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 页面之间通过segue传递数据
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // 首先确定，是哪个segue，因为一个页面可能通过多个segue导向多个页面
        if segue.identifier == "toGallary" {
            
            // 以下是pickerView的取值。通过index来判断，取得了哪个值
            
            let index = animalPicker.selectedRowInComponent(0)
            
            var imageName: String?
            
            switch index {
            case 0:
                imageName = "xiaolu"
            case 1:
                imageName = "changjinglu"
            case 2:
                imageName = "xiaoxiang"
            case 3:
                imageName = "yangtuo"
            default:
                imageName = nil
            }
            
            // 以下是绑定将要传递数据去的页面，并把数据传递过去

            let gvc = segue.destinationViewController as! GallaryViewController
            gvc.imageName = imageName
        }
    }
    
    @IBAction func close (segue: UIStoryboardSegue) {
        
    }
    
}

