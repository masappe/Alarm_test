//
//  SleepingViewController.swift
//  Alarm_test
//
//  Created by Masato Hayakawa on 2019/05/10.
//  Copyright © 2019 masappe. All rights reserved.
//

import UIKit

class SleepingViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var currentTime = CurrentTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToSetView(_ sender: Any) {
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    //Labelの更新
    func updateTime(_ time: String) {
        timeLabel.text = time
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
