//
//  ActionPreview.swift
//  ios
//
//  Created by Lucas Freitas on 4/24/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit

class ActionPreview {
    
    //MARK: Properties
    
    var name: String
    var backgroundImage: UIImage
    var points: Int
    
    //MARK: Initialization
    init?(name: String, backgroundImage: UIImage?, points: Int) {
        
        // Initialization should fail if there is no name or rating isn't between 0 and 5.
        guard !name.isEmpty && points > 0 else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name.uppercased()
        self.backgroundImage = backgroundImage!
        self.points = points
    }
}

