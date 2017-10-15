//
//  RoundedButton.swift
//  VisionML
//
//  Created by PoGo on 10/14/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = self.frame.height / 2
    }
}
