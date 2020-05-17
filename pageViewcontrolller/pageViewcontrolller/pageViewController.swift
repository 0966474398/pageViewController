//
//  pageViewController.swift
//  pageViewcontrolller
//
//  Created by Nguyen Quoc Dich on 5/17/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class pageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    lazy var subViewcontrollers:[UIViewController] = {
        return[
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "pageViewController1") as! pageViewController1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "pageViewController2") as! pageViewController2,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "pageViewController3") as! pageViewController3,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "pageViewController4") as! pageViewController4,
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewcontrollers[0]], direction: .forward, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewcontrollers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewcontrollers.firstIndex(of: viewController) ?? 0
        if(currentIndex <= 0){
            return nil
        }
        return subViewcontrollers[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewcontrollers.firstIndex(of: viewController) ?? 0
        if(currentIndex >= subViewcontrollers.count-1){
            return nil
        }
        return subViewcontrollers[currentIndex+1]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
