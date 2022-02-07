//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by 신용준 on 2022/02/07.
//

import UIKit
class ListViewController: UITableViewController {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var mariried: UISwitch!

    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        alert.addTextField() {
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
          // 사용자 가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장한다.
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.setValue(value, forKey: "name")
            plist.synchronize()
            
            self.name.text = value
        })
        // 알림창을 띄운다.
        self.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0이면 남자 1이면 여자
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져온다
        plist.set(value, forKey: "gender") // gender라는 키로 값을 저장한다
        plist.synchronize() // 동기화 처리
    }
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn // true면 기혼, false면 미혼
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "married")
        plist.synchronize()
    }
    
    override func viewDidLoad() {
        let plist = UserDefaults.standard
        
        // 저장된 값을 꺼내어 각 컴트롤에 설정한다
        self.name.text = plist.string(forKey: "name")
        self.mariried.isOn = plist.bool(forKey: "married")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 { // 첫 번째 셀이 클릭되었을 때만
//            // 입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록 한다.
//            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
//
//            // 입력 필드 추가
//            alert.addTextField() {
//                $0.text = self.name.text
//            }
//            // 버튼 및 액션 추가
//            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
//              // 사용자 가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장한다.
//                let value = alert.textFields?[0].text
//
//                let plist = UserDefaults.standard
//                plist.setValue(value, forKey: "name")
//                plist.synchronize()
//
//                self.name.text = value
//            })
//            // 알림창을 띄운다.
//            self.present(alert, animated: false, completion: nil)
//        }
    }
}
