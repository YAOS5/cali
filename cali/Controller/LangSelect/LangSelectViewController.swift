//
//  ViewController.swift
//  cali
//
//  Created by Peteski Shi on 4/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import UIKit

class LangSelectViewController: UIViewController, UIScrollViewDelegate, didPressButton{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides = [Slide]()
    let languageArray = ["Chinese", "Bangla", "Arabic"]
    var languageSelected = ""
    
    func createSlides(){
        for index in 0..<3 {
            let slide : Slide = createSingleSlide(languageArray[index])
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
        scrollView.showsHorizontalScrollIndicator = false
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
        slide.countryButton!.setImage(UIImage(named: language), for: .normal)
        slide.countryText.text = language
        slide.delegate = self
        return slide
    }
    
    func buttonPressed(_ country: String) {
        languageSelected = country
        performSegue(withIdentifier: "toAR", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if languageSelected == "Chinese" {
            let ARVC = segue.destination as! ARViewController
            ARVC.languageSelected = "Chinese"
        }
        
        else if languageSelected == "Bangla" {
            let ARVC = segue.destination as! ARViewController
            ARVC.languageSelected = "Bangla"
        }
        
        else {
            // if it is arabic
            let ARVC = segue.destination as! ARViewController
            ARVC.languageSelected = "Arabic"
        }
    }
    
}

