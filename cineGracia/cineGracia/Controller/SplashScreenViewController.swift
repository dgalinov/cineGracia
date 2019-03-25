//
//  SplashScreenViewController.swift
//  cineGracia
//
//  Created by alumne on 25/03/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showNavigation), with: nil, afterDelay: 3)
        // Do any additional setup after loading the view.
    }
    

    @objc func showNavigation() {
        performSegue(withIdentifier: "showNavigation", sender: self)
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
