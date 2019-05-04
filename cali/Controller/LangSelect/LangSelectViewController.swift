//
//  ViewController.swift
//  cali
//
//  Created by Peteski Shi on 4/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import UIKit

class LangSelectViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides = [Slide]()
    let language = ["Chinese", "Bangla", "Arabic"]
    
    func createSlides(){
        for index in 0..<3 {
            let slide : Slide = createSingleSlide(language[index])
            /* Setting up delegate to trigger segue */
            slides.append(slide)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        createSlides()
        setUpScrollView()
        
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        scrollView.showsHorizontalScrollIndicator = true
    }
    
    func setUpScrollView() {
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.frame.width,
                                  height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height)
        
        // Setting up individual slides
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    
    func createSingleSlide(_ language: String) -> Slide {
        let slide : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.countryImage.image = UIImage(named: language)
        slide.countryText.text = language
        return slide
    }

    
}

