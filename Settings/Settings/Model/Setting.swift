//
//  Setting.swift
//  Settings
//
//  Created by Stef Castillo on 12/8/22.
//

import UIKit

/**
 Creates our setting object - `Model`
 - Properties:
    - name: the `String` identifier for the setting
    - icon: The `UIImage` that matches the setting
    - isOn: the `Bool` the designate whether the setting is on or not
 
 **/

class Setting {
    let name: String
    let icon:UIImage
    var isOn: Bool
    
    init(name: String, icon: UIImage, isOn: Bool) {
        self.name = name
        self.icon = icon
        self.isOn = isOn
    }
    
}
