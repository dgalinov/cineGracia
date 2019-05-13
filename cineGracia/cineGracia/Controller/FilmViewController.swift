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
    var dates = [String]()
    var hours = [String]()
    
    var dateFilmSelected:DateFilm?
    
    let filmManager:FilmManager=(SQLiteFactory.createFactory(0) as! FilmManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if database.open() {
            let arrayResult = filmManager.selectFilms(database)
            if arrayResult.isEmpty {
                print("No hay datos")
            } else {
                for item in arrayResult {
                    if let film2 = item as? Film {
                        self.Duration.text = film2.title
                        self.Director.text = film2.director
                        self.Synopsis.text = film2.synopsis
                        self.Image.image = UIImage(named: film2.image)
                    }
                }
            }
        }*/
        
        self.Picker.delegate = self
        self.Picker.dataSource = self

        // Do any additional setup after loading the view.
        
        
        
        if let film = filmSelected{
            self.navigationItem.title = film.title
            self.Duration.text = film.duration
            self.Director.text = film.director
            self.Synopsis.text = film.synopsis
            self.Image.image = UIImage(named: film.imageName)
            let datesFilm = filmManager.selectDatesFromFilm(SQLiteSingleton.getInstance(), film: film)
            //var dates = [String]()
            //var hours = [String]()
            
            for index in 0 ..< datesFilm.count {
                if !dates.contains(datesFilm[index].day) {
                    dates.append(datesFilm[index].day)
                }
                if !hours.contains(datesFilm[index].hour) {
                    hours.append(datesFilm[index].hour)
                }
              
            }
            /*for (index,element) in datesFilm.enumerated(){
                dates[index] = element.day
                hours[index] = element.hour
            }*/
            
            pickerData = [dates, hours]
            
            
        }
        
        
        //pickerData = [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], ["11:00", "14:00", "17:00", "20:00", "23:00"]]
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dateFilmSelected = DateFilm(day: dates[row], hour: hours[component])
        print("day \(dates[row]) hour \(hours[component])")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveFilmView" {
            if let navigationController = segue.destination as? UINavigationController {
                if let seatsViewController = navigationController.visibleViewController as? SeatsViewController {
                    seatsViewController.filmSelected = self.filmSelected
                    if self.dateFilmSelected==nil {
                        self.dateFilmSelected = DateFilm(day: dates[0], hour: hours[0])
                    }
                    seatsViewController.dateFilmSelected = self.dateFilmSelected
                }
            }
        }
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue){
        
    }
}
