//
//  ExpandCell.swift
//  ExpandCell
//
//  Created by Kentarou on 2017/02/26.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

protocol ExpandCellDelegate: class {
    func pushExpandButton(cell: ExpandCell, indexPath: IndexPath)
}

class ExpandCell: UITableViewCell {
    
    weak var delegate: ExpandCellDelegate?
    
    @IBOutlet weak var expandLabel: UILabel!
    @IBOutlet weak var fullTextLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var fullTextBottomConstraint: NSLayoutConstraint!
    
    var indexPath: IndexPath!
    
    var dataModel: DataModel! {
        didSet {
            
            if indexPath.row % 2 == 0 {
                
                expandLabel.text = dataModel.labelText
                fullTextLabel.text = dataModel.labelText
            } else {
                
                expandLabel.text = dataModel.longText
                fullTextLabel.text = dataModel.longText
            }
            
            if dataModel.isExpand {
                
                expandLabel.isHidden = true
                expandButton.isHidden = true
                fullTextLabel.isHidden = false
                fullTextBottomConstraint.priority = 999
            } else {
                
                expandLabel.isHidden = false
                expandButton.isHidden = false
                fullTextLabel.isHidden = true
                fullTextBottomConstraint.priority = 1
            }
        }
    }
    
    
    @IBAction func expandButton(_ sender: UIButton) {
        dataModel.isExpand = true 
        delegate?.pushExpandButton(cell: self, indexPath: indexPath)
    }
}
