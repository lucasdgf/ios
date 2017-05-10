//
//  ActionsTableViewController.swift
//  ios
//
//  Created by Lucas Freitas on 4/23/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit

class ActionsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var actions = [ActionPreview]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the actions data.
        loadActions()
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
        return actions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ActionsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ActionsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ActionsTableViewCell.")
        }
        
        // Fetches the appropriate action for the data source layout.
        let action = actions[indexPath.row]
        
        // Title.
        cell.setText(text: action.name)
        
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
        cell.backgroundView = UIImageView(image: action.backgroundImage)
        cell.backgroundView!.contentMode = UIViewContentMode.scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.size.height / CGFloat(actions.count)
    }

    private func loadActions() {
        let backgroundImage0 = UIImage(named: "actiontype0")
        let backgroundImage1 = UIImage(named: "actiontype1")
        let backgroundImage2 = UIImage(named: "actiontype2")
        
        guard let action0 = ActionPreview(name: "Disrupt Market",
                                          backgroundImage: backgroundImage0,
                                          points: 4) else {
                                            fatalError("Unable to instantiate actionType0")
        }
        
        guard let action1 = ActionPreview(name: "Volunteer at Sanctuary",
                                          backgroundImage: backgroundImage1,
                                          points: 3) else {
                                            fatalError("Unable to instantiate actionType1")
        }
        
        guard let action2 = ActionPreview(name: "Large Protest",
                                          backgroundImage: backgroundImage2,
                                          points: 5) else {
                                            fatalError("Unable to instantiate actionType2")
        }
        
        actions += [action0, action1, action2]
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
