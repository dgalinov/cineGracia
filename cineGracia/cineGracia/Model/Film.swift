//
//  Film.swift
//  cineGracia
//
//  Created by Alumne on 28/03/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation

class Film{
    var title:String
    var duration:String
    var director:String
    var synopsis:String
    var imageName:String
    
    
    init(title:String, duration:String, director:String, synopsis:String, imageName:String) {
        self.title = title
        self.duration = duration
        self.director = director
        self.synopsis = synopsis
        self.imageName = imageName
    }
    
    /*init(title:String, duration:String, image:String) {
        self.title = title
        self.duration = duration
        self.image = image
    }*/
}
