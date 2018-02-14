//
//  Reminder.swift
//  Reminders
//
//  Created by Kaihan Roman on 2/13/18.
//  Copyright © 2018 GT iOS Club. All rights reserved.
//

struct Reminder {
    let title: String // data type let - static
    var completed: Bool
    
    //mutates struct, so must mark as such
    mutating func toggleCompleted() {
        completed = !completed
    }
}
