//
//  unionStruct.swift
//  ShouJiHaoMa
//
//  Created by LuJianJun on 15/4/29.
//  Copyright (c) 2015年 CHT. All rights reserved.
//

import Foundation
import JSONJoy

struct UnionNumbers : JSONJoy {
    var moreNumArray: Array<Int>?
    var numMemoList: Array<String>?
    
    init() {
    }
    init(_ decoder: JSONDecoder) {
        if let numbers = decoder["moreNumArray"].array {
            moreNumArray = Array<Int>()
            for num in numbers {
                let n = Int(num.integer!)
                if n > 10000000000 {
                moreNumArray?.append(n)
                }
            }
        }
        if let memos = decoder["numMemoList"].array {
            numMemoList = Array<String>()
            for memo in memos {
                numMemoList?.append(String(memo.string!))
            }
        }
    }
}