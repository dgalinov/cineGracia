//
//  FilmViewController.swift
//  cineGracia
//
//  Created by alumne on 28/03/2019.
//  Copyright © 2019 XaviDrago. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var filmSelected:Film?
    
    @IBOutlet weak var Picker: UIPickerView!
    
    var pickerData: [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Picker.delegate = self
        self.Picker.dataSource = self

        // Do any additional setup after loading the view.
        
        pickerData = [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], ["11:00", "14:00", "17:00", "20:00", "23:00"]]
        
        if let film = filmSelected{
            self.navigationItem.title = film.title
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
}
