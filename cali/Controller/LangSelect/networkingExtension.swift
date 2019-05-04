//
//  networkingExtension.swift
//  cali
//
//  Created by Peteski Shi on 4/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import Foundation
import Alamofire

extension LangSelectViewController {
    func networking(_ language : String) {
        let dataURL = "https://frozen-badlands-62690.herokuapp.com/packages/" + language + ".json"
        Alamofire.request(dataURL, method: .get, encoding: URLEncoding.httpBody,
                          headers: ["Content-Type": "application/x-www-form-urlencoded"]).responseJSON
            { response in
                if response.error == nil {
                    print(response)
                }
                else {
                    // Literally do nothing
                }
        }
    }
}
