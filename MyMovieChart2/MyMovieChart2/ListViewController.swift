//
//  ListViewController.swift
//  MyMovieChart2
//
//  Created by 신용준 on 2021/12/21.
//

import UIKit
class ListViewController: UITableViewController {
    // 현재까지 읽어온 페이지 정보
    var page = 1
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()

    @IBOutlet var moreBtn: UIButton!
    
    @IBAction func more(_ sender: Any) {
        // 0 현재 페이지 값에 1을 추가한다.
        self.page += 1
        // 영화 차트 API 호출
        self.callMovieAPI()
        // 데이터를 다시 읽어오도록 테이블 뷰 갱신
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        // 영화 차트 API 호출
        self.callMovieAPI()
    }
    
    func callMovieAPI() {
        // 1 호핀 API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=30&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2 REST API 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3 데이터 전송 결과를 로그로 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        // 4 Json 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 5 데이터 구조에 따라 차례대로 캐스팅하여 읽어온다
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // 6 Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장한다
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // 웹에 있는 이미지를 읽어와 UIImage 객체로 생성
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                // list 배열에 추가
                self.list.append(mvo)
                
                // 7 전체 데이터 카운트를 얻는다
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                // 8 totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다
                if (self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
            }
        } catch {
            NSLog("Parse Error!")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        // 로그 출력
        NSLog("제목:\(row.title!),호출된번호\(indexPath.row)")
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 비동기 방식으로 섬네일 이미지를 읽어옴
        DispatchQueue.main.async(execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        
        return cell
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        // 인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        
        // 메모이제이션 : 저장된 이미지가 있으면 그것을 반환하고, 없을 경우 내려받아 저장한 후 반환
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
}

// 화면 전환 시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 실행된 세그웨이의 식별자가 segue_detail 이라면
        if segue.identifier == "segue_detail" {
            // sender 인자를 캐스팅하여 테이블 셀 객체로 변환한다
            let cell = sender as! MovieCell
            
            // 사용자가 클릭한 행을 찾아낸다
            let path = self.tableView.indexPath(for: cell)
            
            // API 영화 데이터 배열 중에서 선택된 행에 대한 데이터를 추출한다
            let movieinfo = self.list[path!.row]
            
            // 행 정보를 통해 선택된 영화 데이터를 찾은 다음, 목적지 뷰 컨트롤러의 mvo 변수에 대입한다
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieinfo
        }
    }
}
