//
//  ViewController.swift
//  Alarm-Timer01
//
//  Created by D7703_23 on 2018. 4. 19..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var alramTime: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        // alramTime레이블에 표시
        alramTime.text = formatter.string(from: myDatePicker.date)
        
        // 1초마다 변경하게해주는 코드
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        
        
    }
    
    
    func updateTime() {
        
        // 시간을 만드는 코드
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        // currentTimeLabel 레이블에 표시
        currentTimeLabel.text = formatter.string(from: date)
        
        // 빨갱이 만들어주는거
        if currentTimeLabel.text == alramTime.text {
            view.backgroundColor = UIColor.red
        }
    }
    
    
    @IBAction func DatePicker(_ sender: Any) {
        // 데이터피커에 date속성을 변수에저장
        //let myAlramTime = myDatePicker.date
        //레이블에 텍스트를 보여주는 코드
        //alramTime.text = String(describing: myAlramTime)
        
        
        
        //데이터피커의 정보를 받아 실시간으로 밑에 숫자를 뜨게하는거
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alramTime.text = formatter.string(from: myDatePicker.date)
        
        
    }
    
    
    @IBAction func Reset(_ sender: Any) {
        //리셋버튼
        view.backgroundColor = UIColor.white
    }
    
}

