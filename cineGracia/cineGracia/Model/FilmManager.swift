//
//  FilmManager.swift
//  cineGracia
//
//  Created by alumne on 11/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import Foundation

class FilmManager: SQLiteDAO{
    func selectAll(_ database:FMDatabase)->[Any] {
        let querySQL = "SELECT * FROM FILMS"
        var data:[Any]=[Any]()
        if database.open() {
            if let results:FMResultSet = database.executeQuery(querySQL, withArgumentsIn: data) {
                while (results.next()) {
                
                let film  = Film(title: results.string(forColumnIndex: 0)!, duration: results.string(forColumnIndex: 1)!, director: results.string(forColumnIndex: 2)!, synopsis: results.string(forColumnIndex: 3)!, imageName: "logo")
                data.append(film)
                }
            results.close()
            }
        }
        database.close()
        return data
    }
    
    func delete(_ database: FMDatabase, recordToDelete: AnyObject) -> Bool {
        return true
    }
    func insert(_ database:FMDatabase, ticket: Ticket)->Bool{
        var result = false
        if database.open() {
            let insertSQL = "INSERT INTO RESERVE VALUES (?,?,?,?)"
            var data:[Any]=[Any]()
            data.append(ticket.seatNumber)
            data.append(ticket.title)
            data.append(ticket.day)
            data.append(ticket.hour)
            result = database.executeUpdate(insertSQL, withArgumentsIn: data)
        }
        database.close()
        return result
    }
    
    func selectDatesFromFilm(_ database:FMDatabase, film: Film)->[DateFilm]{
        let querySQL = "SELECT * FROM FILMS_DATES WHERE TITLE=?"
        var dates = [DateFilm]()
        var data:[Any]=[Any]()
        data.append(film.title)
        //var data = ["Avengers: Endgame"]
        if database.open() {
            if let results:FMResultSet = database.executeQuery(querySQL, withArgumentsIn: data) {
                while (results.next()) {
                    let dateFilm  = DateFilm(day: results.string(forColumnIndex: 1)!, hour: results.string(forColumnIndex: 2)!)
                    dates.append(dateFilm)
                }
                results.close()
            }
        }
        database.close()
        return dates
        
    }
    
    func selectAvailableSeats(_ database: FMDatabase,_ film: Film,_ dateFilm: DateFilm) -> Array<Ticket> {
        let querySQL = "SELECT SEATNUMBER FROM RESERVE WHERE TITLE = ? AND DAY = ? AND SCHEDULE = ?"
        var tickets = [Ticket]()
        var data:[Any]=[Any]()
        data.append(film.title)
        data.append(dateFilm.day)
        data.append(dateFilm.hour)
        if database.open() {
            if let results:FMResultSet = database.executeQuery(querySQL, withArgumentsIn: data) {
                while (results.next()) {
                    let ticket  = Ticket(seatNumber: Int(results.string(forColumnIndex: 0)!)!, title: results.string(forColumnIndex: 1)!, day: results.string(forColumnIndex: 2)!, hour: results.string(forColumnIndex: 3)!)
                    tickets.append(ticket)
                }
                results.close()
            }
        }
        database.close()
        return tickets
    }
}
