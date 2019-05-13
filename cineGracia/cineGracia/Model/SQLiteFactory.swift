//
//  SQLiteFactory.swift
//  cineGracia
//
//  Created by alumne on 11/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation

class SQLiteFactory{
    class func createFactory(_ type:Int)->SQLiteDAO{
        
        /*switch(type){
             case 0: return FilmManager()
             case 1: return OtherFilmManager()
             ...
         }*/
        
        return FilmManager()
    }
}
