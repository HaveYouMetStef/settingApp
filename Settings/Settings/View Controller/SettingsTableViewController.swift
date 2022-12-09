//
//  SettingsTableViewController.swift
//  Settings
//
//  Created by Stef Castillo on 12/8/22.
//

import UIKit

/// tableViewController to display our Setting objects
class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// we want the number of cells to match the number of `Setting` objects in our  *Source Of Truth*
        return SettingController.settings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Type casting our tableView cell to be a `SettingTableViewCell` and guarding against that failing. If it fails, we return an empty UITableViewCell initialized
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
        /// Declaring a constant named `Setting` using the `indexPath` that was passed into the `cellForRow(at:)` we assign it to the value of the `Setting` object that matches the row property of the `indexPath`
        let setting = SettingController.settings[indexPath.row]
        /// Setting the cells delegate to the `TableViewController` I.E. "hiring the intern" for the relationship
        cell.delegate = self
        ///Accessing the `updateViews` method on our cell and passing in the `setting` object we declared above
        cell.updateView(with: setting)
        return cell
    }
} //End of class

///Adopting the `SettingCellDelegate` Protocol
extension SettingsTableViewController: SettingCellDelegate {
    ///Conforming to the Protocol
    func settingSwitchToggled(for cell: SettingTableViewCell) {
        ///We asked our TBVC to be our delegate because it can tell us what the  indexPath is for the cell that triggered this protocol method
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        /// Find the `setting` in the settings array that matches the `indexPath`
        let setting = SettingController.settings[indexPath.row]
        ///Tell the Model controller to toggle the `isOn` change on the `Setting`
        SettingController.toggleIsOn(for: setting)
        ///Inform the cell it is now time to update
        cell.updateView(with: setting)
    }
    
    
}
