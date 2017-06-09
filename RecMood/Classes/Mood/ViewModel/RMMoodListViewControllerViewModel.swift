//
//  RMMoodListViewControllerViewModel.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/5.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import Foundation


struct RMMoodModel
{
    var title = ""
    var content = ""
    var imageInfo = RMImageInfo.init()
}

class RMMoodListViewControllerViewModel: RMTableViewModel
{
    var title: String? = "历史jlu"
    
    private var moodList : Array<RMMoodModel>?;
    
    func itemFor(index:IndexPath) -> RMMoodModel?
    {
        return self.moodList?[index.row]
    }
    
}
