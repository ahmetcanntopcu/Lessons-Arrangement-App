//
//  NoteCellTableViewCell.swift
//  Term Average App
//
//  Created by Ahmet Can Topcu on 21.07.2022.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelLessonName: UILabel!
    @IBOutlet weak var labelNote1: UILabel!
    @IBOutlet weak var labelNote2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
