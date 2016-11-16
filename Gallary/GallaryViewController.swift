//
//  GallaryViewController.swift
//  Gallary
//
//  Created by MichelleMeng on 16/11/4.
//  Copyright © 2016年 MichelleMeng. All rights reserved.
//

import UIKit
import Social

class GallaryViewController: UIViewController {

    @IBOutlet weak var gallaryImage: UIImageView!

    var imageName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        navigationItem.leftBarButtonItem?.title = "返回"
        
        if let imageName = imageName {
            gallaryImage.image = UIImage(named: imageName)
            
            switch imageName {
            case "xiaolu":
                navigationItem.title = "小鹿"
            case "changjinglu":
                navigationItem.title = "长颈鹿"
            case "xiaoxiang":
                navigationItem.title = "小象"
            case "yangtuo":
                navigationItem.title = "羊驼"
            default:
                navigationItem.title = "动物园"
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func shareClicked(sender: AnyObject) {
        var controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller.setInitialText("一起来玩动物画廊App!")
        controller.addImage(gallaryImage.image)
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
