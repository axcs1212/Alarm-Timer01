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
        currentTimeLabel.text = formatter.string(from: date)

        if currentTimeLabel.text == alramTime.text {
            view.backgroundColor = UIColor.red
            let myAlertController = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다.", preferredStyle: .actionSheet)
            
            //AlertAction 만들기
            let okAction = UIAlertAction(title: "확인", style: .default){(myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red}
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white})
            let testAction = UIAlertAction(title: "삭제", style: .destructive, handler:{ (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white})
            self.alramTime.text = "00:00:00"
            
            //AlertAction을 AlertController에 넣기
            myAlertController.addAction(okAction)
            myAlertController.addAction(cancelAction)
            myAlertController.addAction(testAction)
            
            //화면에 출력
            present(myAlertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func DatePicker(_ sender: Any) {
        // 데이터피커에 date속성을 변수에저장
        //let myAlramTime = myDatePicker.date
        //레이블에 텍스트를 보여주는 코드
        //alramTime.text = String(describing: myAlramTime)
        print("change Date Picker")
        print(myDatePicker.date)
        
        
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

