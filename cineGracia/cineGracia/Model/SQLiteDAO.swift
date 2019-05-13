//
//  SQLiteDAO.swift
//  cineGracia
//
//  Created by alumne on 11/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation

protocol SQLiteDAO{
    func insert(_ database:FMDatabase, ticket: Ticket)->Bool
    func delete(_ database:FMDatabase, recordToDelete: AnyObject)->Bool
    func selectAll(_ database:FMDatabase)->[Any]
}
