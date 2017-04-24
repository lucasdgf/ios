//
//  ActionTypeTableViewController.swift
//  ios
//
//  Created by Lucas Freitas on 4/23/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit

class ActionTypeTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var actionTypes = [ActionType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove header.
        self.tableView.tableHeaderView = nil

        // Load the action type data.
        loadActionTypes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ActionTypeTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ActionTypeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ActionTypeTableViewCell.")
        }
        
        // Fetches the appropriate action type for the data source layout.
        let actionType = actionTypes[indexPath.row]
        
        // Title.
        cell.setText(text: actionType.name)
        centerTextViewVertically(textView: cell.nameTextView)
        
        // Set title margins.
        let margins = self.view.layoutMarginsGuide
        if indexPath.row % 2 == 0 {
            cell.nameTextView.textAlignment = NSTextAlignment.left
            cell.nameTextView.leadingAnchor.constraint(
                equalTo: margins.leadingAnchor, constant: 4.0).isActive = true
            cell.nameTextView.trailingAnchor.constraint(
                equalTo: margins.centerXAnchor, constant: 40).isActive = true
        } else {
            cell.nameTextView.textAlignment = NSTextAlignment.right
            cell.nameTextView.leadingAnchor.constraint(
                equalTo: margins.centerXAnchor, constant: -40).isActive = true
            cell.nameTextView.trailingAnchor.constraint(
                equalTo: margins.trailingAnchor, constant: -4.0).isActive = true
        }
        
        // Background image.
        cell.backgroundView = UIImageView(image: actionType.backgroundImage)
        cell.backgroundView!.contentMode = UIViewContentMode.scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.size.height / CGFloat(actionTypes.count)
    }
    

    //MARK: Private Methods
    
    private func loadActionTypes() {
        let backgroundImage0 = UIImage(named: "actiontype0")
        let backgroundImage1 = UIImage(named: "actiontype1")
        let backgroundImage2 = UIImage(named: "actiontype2")
        
        guard let actionType0 = ActionType(name: "Solo Action",
                                           backgroundImage: backgroundImage0) else {
            fatalError("Unable to instantiate actionType0")
        }
        
        guard let actionType1 = ActionType(name: "One-on-one Chat",
                                           backgroundImage: backgroundImage1) else {
            fatalError("Unable to instantiate actionType1")
        }
        
        guard let actionType2 = ActionType(name: "Organize action",
                                           backgroundImage: backgroundImage2) else {
            fatalError("Unable to instantiate actionType2")
        }
        
        actionTypes += [actionType0, actionType1, actionType2]
    }
    
    private func centerTextViewVertically(textView: UITextView) {
        var top = (textView.bounds.size.height - textView.contentSize.height) / 2.0
        top = top < 0.0 ? 0.0 : top
        textView.setContentOffset(CGPoint(x: 0, y: -top), animated: false)
    }

}
