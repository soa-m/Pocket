//
//  PageViewContoroller.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/05/16.
//

import Foundation
import UIKit



class PageViewController: UIPageViewController, UIPageViewControllerDelegate {

    var pageViewControllers: [UIViewController] = []
    var nowPage: Int = 0
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        //インスタンス化
        let pageViewA = storyboard!.instantiateViewController(withIdentifier: "AViewController") as! FirstViewController
        let pageViewB = storyboard!.instantiateViewController(withIdentifier: "BViewController") as! SecondViewController
        let pageViewC = storyboard!.instantiateViewController(withIdentifier: "CViewController") as! ThirdViewController
        pageViewControllers = [pageViewA, pageViewB, pageViewC]

        //最初に表示するページの指定
        self.setViewControllers([pageViewControllers[0]], direction: .forward, animated: true, completion: nil)

        pageViewA.onButtonTapped = {
            //追加
            self.currentPage = 1
            self.setViewControllers([self.pageViewControllers[1]], direction: .forward, animated: true, completion: nil)
        }
        pageViewB.onButtonTapped = {
            //追加
            self.currentPage = 2
            self.setViewControllers([self.pageViewControllers[2]], direction: .forward, animated: true, completion: nil)
        }
        pageViewC.onButtonTapped = {
            //追加
            self.currentPage = 0
            self.setViewControllers([self.pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
        }
    }
}
extension PageViewController : UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == 0 {
            return nil
        } else{
            return pageViewControllers[index!-1]
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == pageViewControllers.count - 1 {
            return nil
        } else {
            return pageViewControllers[index!+1]
        }
    }
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return pageViewControllers.count
        }
        //現在のページを返すメソッド
        func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            return currentPage
        }
}
