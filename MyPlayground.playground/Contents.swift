import UIKit
//
//var greeting = "Hello, playground"
//
//
//let value = arc4random_uniform(100)
//print("--> \(value)")
//
//
//// Tuple
//
//let coordinates = (4, 6)
//
//let x = coordinates.0
//let y = coordinates.1
//
//let coorinatesNamed = (x: 2, y: 3)
//
//let x2 = coorinatesNamed.x
//let y2 = coorinatesNamed.y
//
//let (x3, y3) = coorinatesNamed
//x3
//y3
//
//// boolean
//let yes = true
//let no = false
//
//let isFourGreaterThranFive = 4 > 5
//
//if isFourGreaterThranFive {
//    print("참")
//}else {
//    print("거짓")
//}
//
//
//// scope
//
//var hours = 50
//let payPerHour = 10000
//var salary = 0
//
//if hours > 40 {
//    let extraHours = hours - 40
//    salary += extraHours * payPerHour * 2
//    hours -= extraHours
//}
//salary += hours * payPerHour
//
//var i = 0
//
//
//// for loop
//
//let closedRange = 0...10
//
//var sum=0
//for i in closedRange {
//    print("---> \(i)")
//    sum += i
//}
//print("--->total sum: \(sum)")
//
//import Foundation
//
//var sinValue: CGFloat = 0
//for i in closedRange {
//    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
//}
//
//let name = "Jason"
//for _ in closedRange {
//    print("-->name: \(name)")
//}
//
//for i in closedRange {
//    if i % 2 == 0 {
//        print("짝수 \(i)")
//    }
//}
//
//for i in closedRange where i % 2 == 0 {
//    print("짝수 \(i)")
//}
//
//for i in closedRange {
//    if i == 3 {
//        continue
//    }
//    print("---> \(i)")
//}
//let num = 20
//switch num {
//case _ where num % 2 == 0:
//    print("짝수")
//default:
//    print("홀수")
//}

//let coordinates = (x: 10, y: 10)
//
//switch coordinates {
//case (0 ,0):
//    print("---> 원점이네요")
//case (let x ,0):
//    print("---> x축이네요 \(x)")
//case (0 ,let y):
//    print("---> y축이네요 \(y)")
//case (let x, let y) where x == y:
//    print("---> 좌료 어딘가0")
//case (_, _):
//    print("---> 좌료 어딘가")
//}
//
//
//func printName() {
//    print("---> My name is Shin")
//}
//
//printName()
//
//func printMultipleOfTen(value: Int){
//    print("\(value) * 10 = \(value * 10)")
//}
//
//printMultipleOfTen(value: 200)
//
//func printTotalPrice(price : Int, count: Int){
//    print("Total Price: \(price * count)")
//}
//
//printTotalPrice(price: 1500, count: 5)
//
//func totalPrice(price: Int, count: Int) -> Int{
//    let totalPrice = price * count
//    return totalPrice
//}
//
//let calculatePrice = totalPrice(price: 10000, count: 77)
//calculatePrice
//
//func printFullName(_ firstName: String, _ lastName: String) -> String{
//    return "\(firstName) \(lastName)"
//
//}
//
//var value = 3
//func increamentAndPrint(_ value: inout Int){
//    value += 1
//    print(value)
//}
//increamentAndPrint(&value)
//
//// Function as a param
//
//func add(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func substract(_ a: Int, _ b: Int) -> Int {
//    return a - b
//}
//var function = add
//function(4, 2)
//
//func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int){
//    let result = function(a, b)
//    print(result)
//
//}
//
//printResult(add, 10, 5)
//
//var carName: String?
//carName = nil
//
//var favoriteMovieStar: String? = "이병헌"
//var carName = "Tesla"
//if let unwrappedCarName = carName {
//    print(unwrappedCarName)
//}else {
//    print("Car Name nil")
//}


//func printParsedInt(from: String){
//    if let parsedInt = Int(from) {
//        print(parsedInt)
//        if parsedInt > 0 {
//            print(parsedInt)
//        }else {
//
//        }
//    }else{
//        print("Int로 컨버팅 안됌")
//    }
//}
//printParsedInt(from: "100")
//printParsedInt(from: "Hello")


//func printParsedInt(from: String){
//    guard let parseInt = Int(from) else {
//        print("Int로 컨버팅 안됌")
//        return
//    }
//    print(parseInt)
//}
//
//var favoriteFood: String? = "치킨"
//print(favoriteFood!)
//
//if let foodName = favoriteFood {
//    print(foodName)
//} else {
//    print("없음")
//}
//
//func printNickName(name: String?){
//    guard let nickName = name else {
//        print("make a nick")
//        return
//    }
//    print(nickName)
//}
//
//printNickName(name: "gdgd")
//
//var evenNumbers: [Int] = [2, 4, 6, 8]
//let evenNumbers2: Array<Int> = [2, 4, 6, 8]
//
//evenNumbers.append(10)
//evenNumbers += [12, 14, 16]
//evenNumbers.append(contentsOf: [18, 20])
//
//evenNumbers.isEmpty
//
//evenNumbers.count
//
////let firstItem = evenNumbers.first
//
//if let firstElement = evenNumbers.first {
//    print(firstElement)
//}
//evenNumbers.min()
//
//var firstItem = evenNumbers[0]
//var tenthItem = evenNumbers[9]
//
//
//let firstThree = evenNumbers[0...2]
//evenNumbers
//
//evenNumbers.contains(3)
//evenNumbers.contains(4)
//
//evenNumbers.insert(0, at: 0)

// evenNumbers.removeAll() == evenNumbers =[]
//evenNumbers.remove(at: 0)
//
//evenNumbers[0...2] = [-2, 0, 2]
//evenNumbers
//
//evenNumbers.swapAt(0, 1)
//
//for num in evenNumbers {
//    print(num)
//}
//for (index, num) in evenNumbers.enumerated() {
//    print("idx: \(index), value: \(num)")
//}

//evenNumbers.dropFirst(3) // evenNumbers에 영향을 주지않음

var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]

scoreDic["Jason"]

if let score = scoreDic["Jason"] {
    score
} else {
    //... score 없음
}

// scoreDic = [:] 깡통 만들기
scoreDic.isEmpty
scoreDic.count

scoreDic["Jason"] = 99

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic.count

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic

//// For loop
//for (name, score) in scoreDic {
//    print("\(name), \(score)")
//}
//
//for key in scoreDic.keys {
//    print(key)
//}
//
//var MyDic: [String: String] = ["name": "Shin", "job": "Student", "city": "ilsan"]
//
//MyDic["city"] = "boosan"
//
//func printNameAndCity(dic: [String: String]) {
//    if let name = dic["name"], let city = dic["city"] {
//        print(name, city)
//    }else {
//        print("--> Cannot find")
//    }
//}
//
//printNameAndCity(dic: MyDic)

//
//var someSet: Set<Int> = [1,2,3,1]
//
//someSet.isEmpty
//someSet.count
//
//someSet.contains(2)
//
//someSet.insert(5)
//
//someSet.remove(1)
//someSet

//
//var multiplyClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a * b
//}

//var multiplyClosure: (Int, Int) ->Int = { $0 * $1 }
//let result = multiplyClosure(4,2)
//
//func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
//    let result = operation(a, b)
//    return result
//}
//
//operateTwoNum(a: 4, b: 2, operation: multiplyClosure)
//
//var addClosure: (Int, Int) -> Int = { a, b in
//    return a + b
//}
//
//operateTwoNum(a: 4, b: 2, operation: addClosure)
//
//operateTwoNum(a: 4, b: 2) { a, b in
//    return a / b
//}
//
//let voidClosure: () -> Void = {
//    print("IOS 개발자 짱")
//}
//
//voidClosure()
//
//
//// Capturing Values
//var count = 0
//
//let incrementer = {
//    count += 1
//}
//
//incrementer()
//incrementer()

// Closure

// 1. simple Closure
//let choSimpleClosure = {
//
//}
//choSimpleClosure()

// 2. 코드 블록을 구현한 Closure
//let choSimpleClosure = {
//    print("Hello, 클로저")
//}
//choSimpleClosure()

// 3. 인풋 파라미터를 받는
//let choSimpleClosure: (String) -> Void = { name in
//    print("Hello, 클로저 나의 이름은 \(name) 입니다.")
//}
//choSimpleClosure("Shin")

// 4. 값을 리턴하는 Closure
//let choSimpleClosure: (String) -> String = { name in
//
//    let message = "IOS 개발 만만세 \(name)님 경제적 자유를 얻으실 거에요"
//    return message
//}
//let result = choSimpleClosure("Shin")
//print(result)

// 5. Closure를 파라미터로 받는 함수 구현
//func someSimpleFunction(choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요")
//}
//
//someSimpleFunction(choSimpleClosure: {
//    print("헬로 코로나 from closure")
//})

//func someSimpleFunction(choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요")
//    choSimpleClosure()
//}
//
//someSimpleFunction(choSimpleClosure: {
//    print("헬로 코로나 from closure")
//})

// 6. trailing closure
//func someSimpleFunction(message: String, choSimpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요, \(message)")
//    choSimpleClosure()
//}
//someSimpleFunction(message: "코로나 극혐", choSimpleClosure: {
//    print("헬로 from closure")
//})
//
//someSimpleFunction(message: "코로나 극혐") {
//    print("헬로 from closure")
//}
//
//func distance(current: Location, target: (Location)) -> Double {
//    let distanceX = Double(target.x - current.x)
//    let distanceY = Double(target.y - current.y)
//    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
//    return distance
//}
//
//
//struct Location {
//    let x: Int
//    let y: Int
//}
//
//struct Store {
//    let loc: Location
//    let name: String
//    let deliveryRange = 2.0
//
//    func isDeliverable(userLoc: Location) -> Bool {
//        let distanceToStore = distance(current: userLoc, target: loc)
//        return distanceToStore < deliveryRange
//    }
//}
//
//let store1 = Store(loc: Location(x:3, y: 5), name: "gs")
//let store2 = Store(loc: Location(x:4, y: 6), name: "seven")
//let store3 = Store(loc: Location(x:1, y: 7), name: "cu")
//
//
//
//func printClosestStore(currentLocation: Location, stores:[Store]) {
//    var closestStoreName = ""
//    var closestStoreDistance = Double.infinity
//    var isDeliverable = false
//
//    for store in stores {
//        let distanceToStore = distance(current: currentLocation, target: store.loc)
//        closestStoreDistance = min(distanceToStore, closestStoreDistance)
//        if closestStoreDistance == distanceToStore {
//            closestStoreName = store.name
//            isDeliverable = store.isDeliverable(userLoc: currentLocation)
//        }
//    }
//    print("Closest store : \(closestStoreName), isDeliverable: \(isDeliverable)")
//}
//
//let myLocation = Location(x: 2, y: 5)
//let stores = [store1, store2, store3]
//
//printClosestStore(currentLocation: myLocation, stores: stores)

//struct Lecture: CustomStringConvertible {
//    var description: String {
//        return "Title: \(name), Instructor: \(instructor)"
//    }
//
//    let name : String
//    let instructor: String
//    let numOfStudent: Int
//}
//
//func printLectureName(from instructor: String, lectures: [Lecture]){
//    var lectureName = ""
//
//    for lecture in lectures {
//        if instructor == lecture.instructor {
//            lectureName = lecture.name
//
//        }
//    }
//  //  let lectureName = lectures.first { $0.instructor == instructor}?.name ?? ""
//    print("아 그 강사님 강의는요: \(lectureName)")
//}
//
//let lec1 = Lecture(name: "IOS Basic", instructor: "Shin", numOfStudent: 5)
//let lec2 = Lecture(name: "IOS Advenced", instructor: "Jack", numOfStudent: 5)
//let lec3 = Lecture(name: "IOS Pro", instructor: "Jim", numOfStudent: 5)
//let lectures = [lec1, lec2, lec3]
//
//printLectureName(from: "Jack", lectures: lectures)


//struct Person {
//    var firstName: String{
////        willSet {
////            print("willSet: \(firstName) --> \(newValue)")
////        }
//        didSet {
//            print("didSet: \(oldValue) --> \(firstName)")
//        }
//    }
//    var lastName: String
//
//    lazy var isPopular: Bool = {
//        if fullName == "Jay Park" {
//            return true
//        } else {
//            return false
//        }
//    }()
//    var fullName: String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//
//        set {
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//
//        }
//    }
//    static let isAlien: Bool = false
//}
//
//var person = Person(firstName: "Young", lastName: "Shin")
//
//person.firstName
//person.lastName
//
//person.firstName = "Jin"
//person.lastName = "Lee"
//
//person.fullName
//
//person.fullName = "Jay Park"
//person.firstName
//person.lastName
//
//Person.isAlien
//
//person.isPopular
//
//struct Lecture {
//    var title: String
//    var maxStudents: Int = 10
//    var numOfRegistered: Int = 0
//
//    func remainSeats() -> Int {
//        let remainSeats = maxStudents - numOfRegistered
//        return remainSeats
//    }
//
//    mutating func register() {
//        numOfRegistered += 1
//    }
//
//    static let target: String = "Anybody want to learn something"
//
//    static func 소속학원이름() -> String {
//        return "패캠"
//    }
//}
//
//var lec = Lecture(title: "IOS Basic")
//
//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudents - lec.numOfRegistered
//    return remainSeats
//}
//
//lec.remainSeats()
//
//lec.register()
//lec.remainSeats()
//
//Lecture.target
//
//
//struct Math {
//    static func abs(value: Int) -> Int {
//        if value > 0{
//            return value
//        }else {
//            return -value
//        }
//    }
//}
//Math.abs(value: -20)
//
//extension Math {
//    static func aqaure(value: Int) -> Int {
//        return value * value
//        }
//    static func half(value: Int) -> Int {
//        return value/2
//    }
//}
//
//let value: Int = 3
//


// class
//struct PersonStruct {
//    var firstName: String
//    var lastName: String
//
//    init(fisrtName: String, lastName: String) {
//        self.firstName = fisrtName
//        self.lastName = lastName
//    }
//
//    var fullName: String {
//        return "\(firstName) \(lastName)"
//    }
//
//    mutating func uppercaseName() {
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//class PersonClass {
//    var firstName: String
//    var lastName: String
//
//    init(fisrtName: String, lastName: String) {
//        self.firstName = fisrtName
//        self.lastName = lastName
//    }
//
//    var fullName: String {
//        return "\(firstName) \(lastName)"
//    }
//    func uppercaseName() {
//        firstName = firstName.uppercased()
//        lastName = lastName.uppercased()
//    }
//}
//
//var personStruct1 = PersonStruct(fisrtName: "Jason", lastName: "Lee")
//var personStruct2 = personStruct1
//
//var personClass1 = PersonClass(fisrtName: "Jason", lastName: "Lee")
//var personClass2 = personClass1
//
//personStruct2.firstName = "Jay"
//personStruct1.fullName
//personStruct2.fullName
//
//personClass2.firstName = "Jay"
//personClass1.fullName
//personClass2.fullName
//
//
//personClass2 = PersonClass(fisrtName: "Bob", lastName: "Lee")
//personClass1.fullName
//personClass2.fullName
//
//personClass1 = personClass2
//personClass1.firstName

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    convenience init(student: Student){
        self.init(firstName: student.firstName, lastName: student.lastName)
    }

}
let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jasson", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 4.7, credits: 4)
jason.grades.append(math)



// 학생인데 운동선수
class StudentAthelete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        // Phase1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        // Phase 2
        self.train()
    }
    
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    func train() {
        trainedTime += 1
        
    }
}

// 운동선수 인데 축구선수
class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student1_1 = Student(student: student1)
let student2 = StudentAthelete(firstName: "Jay", lastName: "Lee", sports: ["football"])
let student3 = StudentAthelete(name: "Mike")
