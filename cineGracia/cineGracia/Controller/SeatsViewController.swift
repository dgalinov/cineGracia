//
//  SeatsViewController.swift
//  cineGracia
//
//  Created by alumne on 01/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class SeatsViewController: UIViewController {
    @IBOutlet weak var butaca4: UIButton!
    @IBOutlet weak var butaca3: UIButton!
    @IBOutlet weak var butaca2: UIButton!
    @IBOutlet weak var butaca1: UIButton!
    
    var filmSelected:Film?
    var dateFilmSelected:DateFilm?
    
    let filmManager:FilmManager=(SQLiteFactory.createFactory(0) as! FilmManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let film = filmSelected, let dateFilm = dateFilmSelected{
            let tickets = filmManager.selectAvailableSeats(SQLiteSingleton.getInstance(), film, dateFilm)
            for index in 0 ..< tickets.count {
                switch (tickets[index].seatNumber) {
                case butaca1.tag:
                    butaca1.backgroundColor = UIColor.red
                    butaca1.isEnabled = false
                    break
                case butaca2.tag:
                    butaca2.backgroundColor = UIColor.red
                    butaca2.isEnabled = false
                    break
                case butaca3.tag:
                    butaca3.backgroundColor = UIColor.red
                    butaca3.isEnabled = false
                    break
                case butaca4.tag:
                    butaca4.backgroundColor = UIColor.red
                    butaca4.isEnabled = false
                    break
                default:
                    break
                }
            }
        }
        
        
        
        
    }
    
    @IBAction func action(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca1.backgroundColor == UIColor.green {
                butaca1.backgroundColor = UIColor.black
            } else
            {
                butaca1.backgroundColor = UIColor.green
            }
        case 2:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca2.backgroundColor == UIColor.green {
                butaca2.backgroundColor = UIColor.black
            } else
            {
                butaca2.backgroundColor = UIColor.green
            }
        case 3:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca3.backgroundColor == UIColor.green {
                butaca3.backgroundColor = UIColor.black
            } else
            {
                butaca3.backgroundColor = UIColor.green
            }
        case 4:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca4.backgroundColor == UIColor.green {
                butaca4.backgroundColor = UIColor.black
            } else
            {
                butaca4.backgroundColor = UIColor.green
            }
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSeatsView" {
            if let navigationController = segue.destination as? UINavigationController {
                if let ticketViewController = navigationController.visibleViewController as? TicketViewController {
                    ticketViewController.filmSelected = self.filmSelected
                }
            }
        }
    }
    
    
    @IBAction func goBack(segue: UIStoryboardSegue){
        
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
