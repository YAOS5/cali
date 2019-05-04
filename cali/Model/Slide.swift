//
//  Slide.swift
//  cali
//
//  Created by Peteski Shi on 5/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import UIKit

protocol didPressButton {
    func buttonPressed(_ country: String)
}

class Slide: UIView {
    
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var countryText: UILabel!
    
    var delegate : didPressButton?
    @IBAction func countryButtonPressed(_ sender: UIButton) {
        delegate?.buttonPressed(countryText.text!)
    }
    
}
