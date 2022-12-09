//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Stef Castillo on 12/8/22.
//

import UIKit

/**
 The protocol we will use to handle the update of the cell when the `settingSwitch` has been toggled
    - class: This protocol needs to interact with class level objects
 */

protocol SettingCellDelegate: AnyObject {
    
    //Step one: Declare protocol
    ///Protocol method
    func settingSwitchToggled(for cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    //Step two: create the delegate
    
    /**
     The delegate or *intern* for the protocol `SettingCellDelegate`
     
     - weak: We mark this meod as weak to not create a retain cycle
     - optional: we do not want to set the value of the delegate here
     */
   weak var delegate: SettingCellDelegate?

    
    func updateView(with setting: Setting) {
        settingNameLabel.text = setting.name
        settingImageView.image = setting.icon
        settingSwitch.isOn = setting.isOn
        
        //Ternary Operator
        backgroundColor = setting.isOn ? .cyan : .white
    }
    
    
    
    
    
    
    
    //MARK: - Action
    
    @IBAction func settingSwitchToggled(_ sender: Any) {
        delegate?.settingSwitchToggled(for: self)
    }
}
