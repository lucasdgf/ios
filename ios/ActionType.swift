//
//  ActionType.swift
//  ios
//
//  Created by Lucas Freitas on 4/23/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit

class ActionType {
    
    //MARK: Properties
    
    var name: String
    var backgroundImage: UIImage

    
    //MARK: Initialization
    init?(name: String, backgroundImage: UIImage?) {
        
        // Initialization should fail if there is no name or background image.
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name.uppercased()
        self.backgroundImage = backgroundImage!
        
    }
}
