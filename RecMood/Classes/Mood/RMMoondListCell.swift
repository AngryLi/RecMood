//
//  RMMoondListCell.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/5.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit


fileprivate func calculateImageHeight( width:Float?, height:Float?, outputWidth:CGFloat? ) -> CGFloat
{
    guard width != nil && height != nil && outputWidth != nil else {
        return 0
    }
    guard width! > 0 && height! > 0 else {
        return 0
    }
    
    let ratio  = CGFloat(height! / width!)
    return outputWidth! * ratio
}

class RMMoondListCell: UITableViewCell {

    private var moodItem : RMMoodModel?
    
    // 控件
    @IBOutlet weak var lbTitle : UILabel!
    @IBOutlet weak var lbContent : UILabel!
    @IBOutlet weak var imgContent : UIImageView!
    
    // 约束
    @IBOutlet weak var lbTitleTopMargin : NSLayoutConstraint!
    @IBOutlet weak var lbContentTopMargin : NSLayoutConstraint!
    @IBOutlet weak var imgContentTopMargin : NSLayoutConstraint!
    @IBOutlet weak var imgContentHeight : NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindModel(moodItem : RMMoodModel?)
    {
        self.moodItem = moodItem
        self.lbTitle.text = moodItem?.title
        self.lbContent.text = moodItem?.content
        
        if let imageURL = moodItem?.imageURL {
            self.imgContent.sd_setImage(with: URL.init(string: imageURL), placeholderImage: nil)
        } else {
            self.imgContent.image = nil;
        }
        self.imgContentHeight.constant = calculateImageHeight(width: moodItem?.imageInfo.width, height: moodItem?.imageInfo.height, outputWidth: self.imageView?.bounds.size.width)
    }
}
