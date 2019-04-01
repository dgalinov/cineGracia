//
//  SeatsViewController.swift
//  cineGracia
//
//  Created by alumne on 01/04/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class SeatsViewController: UIViewController {
    @IBOutlet weak var butaca1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //butaca1.setImage(UIImage(named: "logo"), for: UIControl.State.normal)

    }
    
    @IBAction func action(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            butaca1.setImage(UIImage(named: "butacaRoja.png"), for: .normal)
            //cambiar el color del backgroud en vez de la imagen
        default:
            print("hola")
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
