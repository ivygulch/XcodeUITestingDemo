//
//  RootViewController.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import UIKit

struct TableRow {
    let description:String
    let segueID:String?
    let alertMessage:String?

    init(description:String, segueID:String?=nil, alertMessage:String?=nil) {
        self.description = description
        self.segueID = segueID
        self.alertMessage = alertMessage
    }
}

class RootViewController: UITableViewController {
    let tableRows = [
        TableRow(description:"Item A"),
        TableRow(description:"Generic Item"),
        TableRow(description:"Generic Item"),
        TableRow(description:"Generic Item"),
        TableRow(description:"Demo Label", segueID:"labelVCID"),
        TableRow(description:"Demo TextField", segueID:"textFieldVCID"),
        TableRow(description:"Demo Slider", segueID:"sliderVCID"),
        TableRow(description:"Demo Button", segueID:"buttonVCID"),
        TableRow(description:"Item B"),
        TableRow(description:"Item C"),
        TableRow(description:"Item D"),
        TableRow(description:"Item E"),
        TableRow(description:"Item F"),
        TableRow(description:"Item G"),
        TableRow(description:"Item H"),
        TableRow(description:"Item I"),
        TableRow(description:"Item J"),
        TableRow(description:"Item K"),
        TableRow(description:"Item L"),
        TableRow(description:"Item M"),
        TableRow(description:"Item N"),
        TableRow(description:"Item O"),
        TableRow(description:"Item P"),
        TableRow(description:"Item Q"),
        TableRow(description:"Last Item", alertMessage:"This is the last item")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        cell.textLabel?.text = tableRows[indexPath.row].description
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let segueID = tableRows[indexPath.row].segueID {
            performSegueWithIdentifier(segueID, sender: self)
        } else if let alertMessage = tableRows[indexPath.row].alertMessage {
            showAlert(alertMessage)
        }
    }

    func showAlert(alertMessage:String) {
        let alertController = UIAlertController(title: "Alert Title", message: alertMessage, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Default Action", style: .Default, handler: {
            _ -> Void in
            print("Dismiss Default Action")
        }))
        alertController.addAction(UIAlertAction(title: "Cancel Action", style: .Cancel, handler: {
            _ -> Void in
            print("Dismiss Cancel Action")
        }))
        presentViewController(alertController, animated: true, completion: nil)
    }

}

