//
//  RMMoodListViewControllerViewModel.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/5.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import ReactiveSwift
import Result

struct RMMoodModel
{
    var title = ""
    var content = ""
    var imageURL : String? = nil
    var imageInfo = RMImageInfo()
}

class RMMoodListViewControllerViewModel: RMTableViewModel
{
    private var moodList : Array<RMMoodModel>?;
    
    func itemFor(index:IndexPath) -> RMMoodModel?
    {
        return self.moodList?[index.row]
    }
    
}
