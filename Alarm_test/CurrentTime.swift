//
//  CurrentTime.swift
//  Alarm_test
//
//  Created by Masato Hayakawa on 2019/05/10.
//  Copyright © 2019 masappe. All rights reserved.
//

import UIKit

class CurrentTime {
    
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: SleepingViewController?
    
    init() {
        if timer == nil {
            //1秒ごとにupdateCurrentTimeメソッドを呼び出す
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateCurrentTime() {
        //日付のフォーマット
        df.dateFormat = "HH:mm:ss"
        //デバイスのタイムゾーンにする
        df.timeZone = TimeZone.current
        //日付をstringに変換
        let timezoneDate = df.string(from: Date())
        //現在の日付の取得
        currentTime = timezoneDate
        //SleepViewControllerのupdateTimeメソッドを呼び出す
        delegate?.updateTime(currentTime!)
        
    }
}
