import UIKit


// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 중요, 지금 당장 해야하는것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할것, 사용자가 결과를 기다림
}

DispatchQueue.global(qos: .default).async {
    // 굳이?
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는것, 네트워킹, 큰파일 불러오기
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는 것들, 뉴스데이터 미리 받기, 위치 업데이트, 영상다운
}

// - Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)

// 복합적인 상황

func downloadImageFromServer() -> UIImage {
    // heavy task
    return UIImage()
}

func updateUI(image: UIImage){
    
}

DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // update ui ui는 메인으로
        updateUI(image: image)
    }
}


// Sync, ASync

// Async

DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("async \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("async user \(i)")
    }
}
