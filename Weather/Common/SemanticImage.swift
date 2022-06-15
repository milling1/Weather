//
//  SemanticImage.swift
//  Weather
//
//  Created by user on 11.06.2022.
//

import UIKit

enum SemanticImage: String, CaseIterable {
    case snow = "snow"
    case clear = "clear"
    case clouds = "clouds"
    case rain = "rain"
}

extension SemanticImage {
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
