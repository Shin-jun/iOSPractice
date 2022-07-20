//
//  ViewController.swift
//  UIKitHealthKitHeartRate
//
//  Created by Shin yongjun on 2022/07/18.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    var timerRepeat: Timer?
    let healthStore = HKHealthStore()
    var calender : Calendar!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // authorizeHealthkit()
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calender = Calendar.current;
        fireTimer()
        
    }
    
    @objc func authorizeHealthkit() {
        let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!]) // 걸음 수 등 모든 데이터를 가져올 수 있음
        let share = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])
        //let share = Set([HKObjectType.workoutType()])
        healthStore.requestAuthorization(toShare: share, read: read) {  (check, error) in
            if(check) {
                self.latestHeartRate()
            }
        }
    }
    
    @objc func latestHeartRate() {

        guard let sampleTpye = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        //let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let endDate = Date()
        //let endDate = Date().timeIntervalSinceReferenceDate
        print(endDate)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictEndDate)

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)

        let query = HKSampleQuery(sampleType: sampleTpye, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) { (sample, result, error) in
            guard error == nil else {
                return
            }
            let data = result![0] as! HKQuantitySample
            let unit = HKUnit(from: "count/min")
            let latesHr = data.quantity.doubleValue(for: unit)
            print("Lastest Hr \(latesHr) BPM")

            let dateFormator = DateFormatter()
            dateFormator.dateFormat = "dd/MM/yyyy hh:mm s"
            let StartDate = dateFormator.string(from: data.startDate)
            let EndDate = dateFormator.string(from: data.endDate)
            print("StartDate \(StartDate) : EndDate \(EndDate)")

//            let userInfo = "Timer 2"
//            self.timerRepeat = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerFireRepeat(timer:)), userInfo: userInfo, repeats: true)
        }
        healthStore.execute(query)
//
//        //let userInfo = "Timer 2"
//        //timerRepeat = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: //#selector(timerFireRepeat(timer:)), userInfo: userInfo, repeats: true)
    }
    //@objc func getLatestheartRate()
//    {
//
//        let startDate = Date.distantPast
//        let endDate = Date()
//        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
//
//        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
//        let sortDescriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)]
//
//        let  heartRateQuery =  HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 1, sortDescriptors: sortDescriptors, resultsHandler: { (query, results, error) in
//            guard  let result = results else { return }
//            if(results!.count > 0){
//            guard let currData = result[0] as? HKQuantitySample else { return }
//            let beatsPerMinuteUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
//            DispatchQueue.main.async {
//
////                self.activeBPMLabel.text =   String(Int(currData.quantity.doubleValue(for: beatsPerMinuteUnit)));
//                print(Int(currData.quantity.doubleValue(for: beatsPerMinuteUnit)))
////                self.activeTimeLabel.text = self.dateDifference(from: currData.endDate, to: Date())
//                print(self.dateDifference(from: currData.endDate, to: Date()))
//            }
//            }
//        })
//        healthStore.execute(heartRateQuery)
//
//    }
//    @objc func timerFireRepeat(timer: Timer) {
//            print("timerFireRepeat!")
//            if timer.userInfo != nil {
//                print("\(String(describing: timer.userInfo))")  // Timer 2
//            }
//        }
    
//    func createTimer() {
//        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getLatestheartRate), userInfo: nil, repeats: true)
//    }
    
    @objc func fireTimer() {
        let timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(authorizeHealthkit), userInfo: nil, repeats: true)
    }
    
    
    func dateDifference (from fromDate: Date, to toDate: Date) -> String {
        let day = calender.dateComponents([.day], from: fromDate, to: toDate).day

        let month = calender.dateComponents([.month], from: fromDate, to: toDate).month
        let hour = calender.dateComponents([.hour], from: fromDate, to: toDate).hour
        let minute = calender.dateComponents([.minute], from: fromDate, to: toDate).minute

        if(month! > 0){
            return "\(month!) month ago"
        }else if(day! >  0){
            return "\(day!) days ago"
        }
        else if(hour! > 0){
            return "\(hour!) hours ago"
        }else {
            return "\(minute!) minutes ago"
        }

    }
}

