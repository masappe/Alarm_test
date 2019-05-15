//
//  Alarm.swift
//  Alarm_test
//
//  Created by Masato Hayakawa on 2019/05/10.
//  Copyright © 2019 masappe. All rights reserved.
//

import UIKit
import AVFoundation

class Alarm {
    var selectedWakeUpTime: Date?
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer!
    var seconds = 0
    
    func runTimer() {
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        if sleepTimer == nil {
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTimer() {
        if seconds != 0 {
            seconds -= 1
        }else {
            //音を鳴らす
            sleepTimer.invalidate()
            sleepTimer = nil
            let soundFilePath = Bundle.main.path(forResource: "test", ofType: "wav")
            let sound = URL(fileURLWithPath: soundFilePath!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound)
                //info.plistのApplication does not run in backgroundをyesにすると画面が暗くなっても実行してくれる
                //capabilitiesのbackgroundnの設定を変えることでforegroundからbackgroundに移行した時は音楽が流れ続ける
                //バックグランドでも音を流す
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true, options: [])
            } catch {
                print("error")
            }
            audioPlayer.play()
        }
    }
    
    func stopTimer() {
        if sleepTimer != nil {
            sleepTimer.invalidate()
            sleepTimer = nil
        } else {
          audioPlayer.stop()
        }
    }
    
    private func calculateInterval(userAwakeTime: Date) -> Int {
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0 {
            interval = 86400 - (0 - interval)
        }
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
}
