//
//  PPTabBarController.swift
//  PPBadgeViewSwift
//
//  Created by AndyPang on 2017/6/19.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

import UIKit

class PPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller1 = PPViewController1.init()
        let controller2 = PPViewController2.init()
        let controller3 = PPViewController3.init()
        let controller4 = PPViewController4.init()
        
        setupChildController(controller: controller1, title: "点餐", image: "dinner", selectedImage: "dinner_1")
        setupChildController(controller: controller2, title: "订单", image: "order", selectedImage: "order_1")
        setupChildController(controller: controller3, title: "充值", image: "top_up", selectedImage: "top_up_1")
        setupChildController(controller: controller4, title: "我的", image: "my", selectedImage: "my_1")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.darkGray], for: .selected)
        
        /*
         给UITabBarItem添加badge
         
         tabBarVC的 viewDidLoad() 中获取不到tabBarItem实例,demo为了演示效果做了0.1s的延时操作,
         在实际开发中,badge的显示是在网络请求成功/推送之后,所以不用担心获取不到tabBarItem添加不了badge
         */
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            
            // 给controller1.tabBarItem
            controller1.tabBarItem.pp_addBadge(text: "99+")
            
            // 给controller2.tabBarItem
            controller2.tabBarItem.pp_addBadge(number: 7)
            controller2.tabBarItem.pp_setBadgeLabel(attributes: { (badgeLabel) in
                badgeLabel.backgroundColor = UIColor.blue
            })
            
            // 给controller3.tabBarItem
            controller3.tabBarItem.pp_addDot(color: UIColor.green)
            
            // 给controller4.tabBarItem
            controller4.tabBarItem.pp_addDot(color: UIColor.orange)
            controller4.tabBarItem.pp_setBadgeHeight(points: 12)
        }
        
    }
    
    func setupChildController(controller: UIViewController, title: String, image: String, selectedImage: String) {
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(UINavigationController.init(rootViewController: controller))
        
    }
    
}
