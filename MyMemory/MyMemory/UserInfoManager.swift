//
//  UserInfoManager.swift
//  MyMemory
//
//  Created by 신용준 on 2022/02/21.
//

import UIKit

struct UserInfoKey {
    // 저장에 사용할 키
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
}

// 계정 및 사용자 정보를 저장 관리하는 클래스
class UserInfoManager {
    // 연산 프로퍼티 loginId 정의
    var loginId: Int {
        get { // 읽기
            // 프로퍼티 리스트에 저장된 로그인 아이디를 제공
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set(v) { // 쓰기
            // 할당된 값을 프로퍼티 리스트에 값 저장
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.loginId)
            ud.synchronize()
        }
    }
    
    var account: String? { // 비로그인 상태일때 이값을 nil로 설정하기위한 옵셔널 타입 -> 로그인 상태 식별
        get { // 읽기
            // 프로퍼티 리스트에 저장된 로그인 아이디를 제공
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set(v) { // 쓰기
            // 할당된 값을 프로퍼티 리스트에 값 저장
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    
    var name: String? { // 비로그인 상태일때 이값을 nil로 설정하기위한 옵셔널 타입 -> 로그인 상태 식별
        get { // 읽기
            // 프로퍼티 리스트에 저장된 로그인 아이디를 제공
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v) { // 쓰기
            // 할당된 값을 프로퍼티 리스트에 값 저장
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    var profile: UIImage? { // 비로그인 상태일때 이값을 nil로 설정하기위한 옵셔널 타입 -> 로그인 상태 식별
        get { // 읽기
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile) {
                return UIImage(data: _profile)
            } else {
                return UIImage(named: "account.jpg") // 이미지가 없다면 기본 이미지로
            }
        }
        set(v) { // 쓰기
            if v != nil {
                let ud = UserDefaults.standard
                // UIImage타입은 프로퍼티 리스트에 직접 저장 불가, pngData()메소드 사용, Data타입으로 변환
                ud.set(v!.pngData(), forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
    
    // 로그인 상태를 판별해주는 연산 프로퍼티
    var isLogin: Bool {
        // 로그인 아이디가 0이거나 계정이 비어있으면
        if self.loginId == 0 || self.account == nil {
            return false
        } else {
            return true
        }
    }
    
    func login(account: String, passwd: String) -> Bool {
        // TODO : 이 부분은 나중에 서버 연동 코드로 대체
        if account.isEqual("sqlpro@naver.com") && passwd.isEqual("1234") {
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("용준 씨", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func logout() -> Bool {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        return true
    }
    
}
