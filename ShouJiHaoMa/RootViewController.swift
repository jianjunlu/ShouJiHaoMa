//
//  RootViewController.swift
//  ShouJiHao
//
//  Created by LuJianJun on 15/4/26.
//  Copyright (c) 2015年 CHT. All rights reserved.
//

import UIKit
import SnapKit
import CHTTools
import SwiftHTTP
import JSONJoy

class RootViewController: UIViewController {
    
    lazy var btnCheck = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.btnCheck.backgroundColor = UIColor.grayColor()
        self.btnCheck.setTitle("Check", forState: UIControlState.Normal)
        self.btnCheck.addTarget(self, action: "OnCheck", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(self.btnCheck)
        self.btnCheck.snp_makeConstraints { [unowned self] (make) -> Void in
            make.center.equalTo(self.view.snp_center)
            make.height.equalTo(44);
            make.width.equalTo(self.btnCheck.snp_height).multipliedBy(1.5);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func OnCheck() {
        DLog("");
        let numUrl = "http://num.10010.com/NumApp/GoodsDetail/queryMoreNums?callback=jsonp_queryMoreNums&province=51&cityCode=540&rankMoney=&groupKey=73044235&mid=&q_p=51&net=01&roleValue=&preFeeSel=0&keyValue=&Show4GNum=TRUE&q_p=61&_=1430065446606"
        
        var req = HTTPTask()
        req.GET(numUrl,
            parameters: nil,
            success: { (response: HTTPResponse) -> Void in
//                DLog("repsonse code:\(response.statusCode!), result:" + response.text!)
                let responseStr = response.text!
                var keyRange = responseStr.rangeOfString("jsonp_queryMoreNums", options: NSStringCompareOptions.CaseInsensitiveSearch)
//                DLog("key range: \(keyRange)")
//                var jsonLength = responseStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) - (keyRange?.endIndex-keyRange?.startIndex)
//                var jsonRange = NSRangeMake(keyRange?.endIndex+1,)
//                jsonRange.sta
                var jsonStr = responseStr.substringWithRange(Range<String.Index>(start: advance(keyRange!.endIndex, 1), end: advance(responseStr.endIndex, -2)))
                DLog("json str: \(jsonStr)")
//                var jsonResult = JSONDecoder(jsonStr)
//                DLog("json result:\(jsonResult)")
            },
            failure: { (error: NSError, response: HTTPResponse?) -> Void in
                DLog("repsonse code:\(response?.statusCode!), result:" + error.description)
            }
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
