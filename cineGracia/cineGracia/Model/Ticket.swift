//
//  File.swift
//  cineGracia
//
//  Created by Dragomir Galinov on 7/5/19.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation

class Ticket{
    var seatNumber:Int
    var title:String
    var day:String //MONDAY, TUESDAY, ....
    var hour:String // 11:00h
    
    init(seatNumber:Int, title:String, day:String, hour:String) {
        self.seatNumber = seatNumber
        self.title = title
        self.day = day
        self.hour = hour
    }
    
}
