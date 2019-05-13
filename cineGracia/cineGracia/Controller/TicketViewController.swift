//
//  TicketViewController.swift
//  cineGracia
//
//  Created by alumne on 04/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var Dia: UILabel!
    @IBOutlet weak var Hora: UILabel!
    @IBOutlet weak var Butaca: UILabel!
    
    var database:FMDatabase = SQLiteSingleton.getInstance()
    let filmManager:FilmManager=(SQLiteFactory.createFactory(0) as! FilmManager)
    
    var filmSelected:Film?
    var dateFilmSelected:DateFilm?
    var seatsTaken:Ticket?
    
    @IBAction func insertReserve(_ sender: UIButton) {
        /*if let film = filmSelected{
            let newTicketFilm:Film = Film(title: film.title, duration: film.duration, director: film.director, synopsis: film.synopsis, image: film.image, day: film.day, schedule: film.schedule, seat: film.seat)
            if database.open() {
                let result = filmManager.insert(database, newRecord: newTicketFilm)
                if result {
                    print("Ticket Created")
                } else {
                    print("Failed to add film")
                }
                database.close()
            } else {
                print("Error")
            }
        }*/
    }
    
    //var filmSelected:Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filmVista = filmSelected{
            self.Titulo.text = filmVista.title
            //self.Dia.text =
            //self.Hora.text =
            //self.Butaca =
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
