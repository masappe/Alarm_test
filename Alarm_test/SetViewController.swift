//
//  SetViewController.swift
//  Alarm_test
//
//  Created by Masato Hayakawa on 2019/05/10.
//  Copyright © 2019 masappe. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    var alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //時間のみの表示
        sleepTimePicker.datePickerMode = .time
        //現在の時刻をセット
        sleepTimePicker.setDate(Date(), animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if alarm.sleepTimer != nil {
            alarm.stopTimer()
        }
    }
    
    @IBAction func alarmButtonWasPressed(_ sender: Any) {
        //ユーザが入力した日付をalarmクラスのselectedWakeUpTimeに格納
        alarm.selectedWakeUpTime = sleepTimePicker.date
        //runTimerメソッドの呼び出し
        alarm.runTimer()
        let alert = UIAlertController(title: "アラームの設定", message: "アラームが設定されました", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            //SleepingViewControllerへ画面遷移
            self.performSegue(withIdentifier: "setToSleeping", sender: nil)
        })
        alert.addAction(ok)
        present(alert, animated: true ,completion: nil)

    }
    
}
