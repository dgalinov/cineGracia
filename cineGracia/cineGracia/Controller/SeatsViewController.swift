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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //butaca1.setImage(UIImage(named: "logo"), for: UIControl.State.normal)

    }
    
    @IBAction func action(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca1.backgroundColor == UIColor.red {
                butaca1.backgroundColor = UIColor.gray
            }else {
                butaca1.backgroundColor = UIColor.red
            }
        case 2:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca2.backgroundColor == UIColor.red {
                butaca2.backgroundColor = UIColor.gray
            }else {
                butaca2.backgroundColor = UIColor.red
            }
        case 3:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca3.backgroundColor == UIColor.red {
                butaca3.backgroundColor = UIColor.gray
            }else {
                butaca3.backgroundColor = UIColor.red
            }
        case 4:
            //butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
            
            if butaca4.backgroundColor == UIColor.red {
                butaca4.backgroundColor = UIColor.gray
            }else {
                butaca4.backgroundColor = UIColor.red
            }
        default:
            print("hola")
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
