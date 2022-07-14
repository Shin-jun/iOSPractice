//
//  ListVC.swift
//  Chapter07-CoreData
//
//  Created by 신용준 on 2022/03/13.
//

import UIKit
import CoreData
class ListVC: UITableViewController {
    // 데이터 소스 역할을 할 배열 변수
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    // 데이터를 읽어올 메소드
    func fetch() -> [NSManagedObject] { ... }
    
    // 데이터를 저장할 메소드
    func save(title: String, contents: String) -> Bool {...}
    
    // 데이터 저장 버튼에 대한 액션 메소드
    func add(_ sender: Any) { ... }
    
    // 화면 및 로직 초기화 메소드
    override func viewDidLoad() {
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
    // 테이블 뷰 데이터 소스용 프로토콜 메소드
    override func tableView(_ tv: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    override func tableView(_ tv: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 해당하는 데이터 가져오기
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        // 셀을 생성하고, 값을 대입한다.
        let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents
        
        return cell
    }
}

func fetch() -> [NSManagedObject] {
    // 1. 앱 델리게이트 객체 참조
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // 2. 관리 객체 컨텍스트 참조
    let context = appDelegate.persistentContainer.viewContext
    // 3. 요청 객체 생성
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
    // 4. 데이터 가져오기
    let result = try! context.fetch(fetchRequest)
    return result
}

func save(title: String, contents: String) -> Bool {
    // 1. 앱 델리게이트 객체 참조
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    // 2. 관리 객체 컨텍스트 참조
    let context = appDelegate.persistentContainer.viewContext
    
    // 3. 관리 객체 및 값을 설정
    let object = NSEntityDescription.insertNewObject(forEntityName: "Board", into: context)
    object.setValue(title, forKey: "title")
    object.setValue(contents, forKey: "contents")
    object.setValue(Date(), forKey: "regdate")
    
    // 4. 영구 저장소에 커밋되고 나면 list 프로퍼티에 추가한다.
    do {
        try context.save()
        self.list.append(object)
        return true
    } catch {
        context.rollback()
        return false
    }
}

@objc func add(_sender: Any) {
    let alert = UIAlertController(title: "게시글 등록", message: nil, preferredStyle: .alert)
    
    // 입력 필드 추가(이름 & 전화번호)
    alert.addTextField() { $0.placeholder = "제목" }
    alert.addTextField() { $0.placeholder = "내용" }
    
    // 버튼 추가(Cancel & Save)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    alert.addAction(UIAlertAction(title: "Save", style: .default) {(_) in
        guard let title = alert.textFields?.first?.text, let contents = alert.textFields?.last?.text else {
            return
        }
        // 값을 저장하고, 성공이면 테이블 뷰를 리로드한다.
        if self.save(title: title, contents: contents) == true {
            self.tableView.reloadData()
        }
    })
    self.present(alert, animated: false)
}
