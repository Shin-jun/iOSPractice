//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Shin yongjun on 2022/05/15.
//

import SwiftUI
import CoreData

class HabitViewModel: ObservableObject {
    // MARK : New Habit Properties
    @Published var addNewHabit: Bool = false
    
    @Published var title: String = ""
    @Published var habitColor: String = "Card-1"
    @Published var weekDays: [String] = []
    @Published var isRemainderOn: Bool = false
    @Published var remainderText: String = ""
    @Published var remainderDate: Date = Date()
    
    // MARK: Remainder Time Picker
    @Published var showTimePicker: Bool = false
    
    // MARK: Adding habit to DB
    func addHabbit(context: NSManagedObjectContext) -> Bool {
        let habit = Habit(context: context)
        habit.title = title
        habit.color = habitColor
        habit.weekDays = weekDays
        habit.isRemainderOn = isRemainderOn
        habit.remainderText = remainderText
        habit.notificationDate = remainderDate
        habit.notificationIDs = []
        
        if isRemainderOn {
            // MARK: Scheduling Notifications
        } else {
            // MARK: Adding Data
        }
            
        return false
    }
    
    // MARK: Erasing Content
    func resetData() {
        title = ""
        habitColor = "Card-1"
        weekDays = []
        isRemainderOn = false
        remainderDate = Date()
        remainderText = ""
    }
    
    // MARK: Done Button Status
    func doneStatus() -> Bool {
        let reminderStatus = isRemainderOn ? remainderText == "" : false
        
        if title == "" || weekDays.isEmpty || reminderStatus {
            return false
        }
        return true
    }
}
