//
//  SQLiteSingleton.swift
//  cineGracia
//
//  Created by alumne on 11/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation


private var databasePath:String=String()
//private let databaseURL = Bundle.main.url(forResource: "cineGraciaBBDD", withExtension: "db")

private var database:FMDatabase?

class SQLiteSingleton{
    
    static let dataBaseFileName:String = "cineGracia.db"
    
    class func getInstance()->FMDatabase{
        
        if (database==nil){
            
            let fileManager=FileManager()
            
            if let docsDir=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
                let databaseURL = docsDir.appendingPathComponent(dataBaseFileName)
                databasePath = databaseURL.absoluteString
                database = FMDatabase(path: databasePath)
            }
        
        }
        return database!
    }
}
