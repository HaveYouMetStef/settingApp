//
//  settingController.swift
//  Settings
//
//  Created by Stef Castillo on 12/8/22.
//

import UIKit
/// Our Models Controller Class

/**
 Source of truth
 
 We created a computed property named `settings` and declared the type to be an array of `Setting` objects.
 -  Returns: The mock Setting Objects we created in an array
 */

class SettingController {
    //SOT - Source of truth
  static let settings: [Setting] = {
      //Marked as static so we can access this array on a seperate file.
        let music = Setting(name: "Music", icon: UIImage(imageLiteralResourceName: "music") , isOn: false)
        let appStore = Setting(name: "App Store", icon: UIImage(imageLiteralResourceName: "app-store-in-ios"), isOn: false)
        let iBooks = Setting(name: "iBooks", icon: UIImage(imageLiteralResourceName: "ios-books-application"), isOn: true)
        return [music, appStore, iBooks]
    }()
    /**
     Toggles the `isOn` property on a `Setting` object to the opposite state
     - Parameter:
        - setting: the Setting object we wish to change the `isOn` of
     */
    static func toggleIsOn(for setting: Setting) {
        setting.isOn = !setting.isOn
    }
}
