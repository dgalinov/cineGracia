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
    @IBOutlet weak var Duration: UILabel!
    @IBOutlet weak var Director: UILabel!
    @IBOutlet weak var Synopsis: UILabel!
    @IBOutlet weak var Image: UIImageView!
    
    var pickerData: [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Picker.delegate = self
        self.Picker.dataSource = self

        // Do any additional setup after loading the view.
        
        pickerData = [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], ["11:00", "14:00", "17:00", "20:00", "23:00"]]
        
        if let film = filmSelected{
            self.navigationItem.title = film.title
            self.Duration.text = film.duration
            self.Director.text = film.director
            self.Synopsis.text = film.synopsis
            self.Image.image = UIImage(named: film.image)
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
    
    @IBAction func goBack(segue: UIStoryboardSegue){
        
    }
}
