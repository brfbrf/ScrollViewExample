//
//  ViewController.swift
//  ScrollViewExample
//  Created by M1 on 23.04.2020.
//  Copyright © 2020 Dmitry Alexandrov. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet var sv: UIScrollView! = UIScrollView(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = self.sv
        sv.delegate = self
        
        sv.isScrollEnabled = true // false -> to stop scroll
        
        let myImage = UIImage(named: "map.jpg")
        let imageView = UIImageView(image: myImage)

        //добавляем внутрь ScrollView
        //работает с любыми наследниками UIView
        sv.addSubview(imageView)
        
        //ставим contentSize, чтобы понял, сколько скроллить
        var imageHeight : CGFloat = 0
        if let size = myImage?.size {
            imageHeight = size.height
//            scrollView.contentSize = size
        }
        
        
        //где-то берем странички — любые UIView
        let pages: [UIView] = createPages()
        
        for (i, page) in pages.enumerated() {
            //двигаем по x на ширину scrollView
            //page.frame.origin.x = CGFloat(i) * scrollView.bounds.width

            //двигаем по y на высоту scrollView
            page.frame.origin.y = CGFloat(i) * 125 + imageHeight //scrollView.bounds.height

            //добавляем внутрь ScrollView
            sv.addSubview(page)
        }
        
//        //ставим размер контента
//        scrollView.contentSize = CGSize(
//            width: UIScreen.main.bounds.width,
//            height: scrollView.bounds.height * 2)
        
        //or
        //scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: CGFloat(pages.count) * 125 + imageHeight)
        sv.contentSize = CGSize(
            width: sv.bounds.width, height: CGFloat(pages.count) * 125 + imageHeight - 25)

        
        //включаем режим переключения страниц
        //sv.isPagingEnabled = true
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == -20.0 {
            print("top")
        } else if scrollView.contentOffset.y == 2260.0 {
            print("bottom")
        }
        
//        print("did scroll \(scrollView.contentOffset.x) \(scrollView.contentOffset.y)")
    }
    
    
    func createPages() -> [UIView] {
        var ret : [UIView] = []
        let myFrame = CGRect(x: 0, y: 0, width: sv.bounds.width, height: 100)
        for _ in 0...19 {
            let view = UIView(frame: myFrame)
            view.backgroundColor = UIColor.green
            ret.append(view)
        }
        return ret
    }
    
    
}

