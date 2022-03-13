//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by 신용준 on 2022/03/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        let dbPath = self.getDBPath()
        self.dbExecute(dbPath: dbPath)

        
        
    }
    
    func dbExecute(dbPath: String) {
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else { // 데이터베이스가 연결되었다면
            print("Database Connect Fail")
            return
        }
        
        // 데이터베이스 연결 종료
        defer {
            print("Close Database Connection")
            sqlite3_close(db)
        }
        
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else { // SQL컴파일이 잘 끝났다면
            print("Prepare Statement Fail")
            return
        }
        
        defer {
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
                 
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Create Table Success!")
        }
            
    }
    
    func getDBPath() -> String {
        // 앱 내 문서 디렉터리 경로에서 SQLite DB파일을 찾는다
        let fileMgr = FileManager() // 파일 매니저 객체를 생성
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first! // 생성된 매니저 객체를 사용하여 앱 내의 문서 디렉터리 경로를 찾고, 이를 URL객체로 생성
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path // URL객체에 db.sqlite 파일 경로를 추가한 SQlite3 데이터베이스 경로를 만들어 낸다.
        
        // dbPath 경로에 파일이 없다면 앱 번들에 만들어 둔 db.sqlite를 가져와 복사한다.
        if fileMgr.fileExists(atPath: dbPath) == false { // dbpath 경로에 파일이 있는지 체크
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite") // 없다면 앱 번들에 포함된 db.sqlite파일의 경로를 읽어옴
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath) // 번들 파일경로에 있는 db.sqlite파일을 dbPath경로에 복사한다.
        }
        return dbPath
    }
}
