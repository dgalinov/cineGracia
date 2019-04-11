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
    
    var filmSelected:Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let film = filmSelected{
            self.Titulo.text = film.title
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
