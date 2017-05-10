//
//  ActionsTableViewCell.swift
//  ios
//
//  Created by Lucas Freitas on 4/24/17.
//  Copyright © 2017 Everyday Activism. All rights reserved.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Don't allow cells to be selected.
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        // Don't allow UITextView to be touched.
        self.nameTextView.isUserInteractionEnabled = false
    }
    
    func setText(text: String) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4.0
        let attributes = [NSParagraphStyleAttributeName : style]
        self.nameTextView.attributedText = NSAttributedString(string: text, attributes:attributes)
        
        // Customize label font.
        self.nameTextView.font = UIFont(name: "GillSans-Bold", size: 28)
        self.nameTextView.textColor = UIColor.white
        self.nameTextView.isEditable = false
        self.nameTextView.isSelectable = false
    }

}
