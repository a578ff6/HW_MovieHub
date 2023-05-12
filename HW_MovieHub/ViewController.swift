//
//  ViewController.swift
//  HW_MovieHub
//
//  Created by 曹家瑋 on 2023/5/12.
//

/*
 textField：配對文字
 segmented control 來選擇電影類型，
 switch 來切換年齡限制。
 slider 來選擇評分範圍。
 資料：名稱、類型、分數、地區、年齡限制。
 */

import UIKit

class ViewController: UIViewController {

    // 封面、名稱、分數
    @IBOutlet weak var moviesImageView: UIImageView!
    @IBOutlet weak var moviesNameLabel: UILabel!
    @IBOutlet weak var moviesRatingLabel: UILabel!
    @IBOutlet weak var moviesDateLabel: UILabel!
    
    // TextField
    @IBOutlet weak var searchTextField: UITextField!
    
    // 電影類型、區域分類
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var areaSegmentedControl: UISegmentedControl!

    // 年紀限制
    @IBOutlet weak var ageLimitSwitch: UISwitch!

    // 評分
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var ratingScoreLabel: UILabel!

    // 電影資訊 Arrays、檔名即是電影名
    let movies = ["The Shawshank Redemption", "Turning Red", "Let The Bullets Fly", "The First Slam Dunk", "Les choristes", "Going Overboard", "Onna no ko yo shitai to odore", "Shao nian ye, an la!", "Die Hard", "Blade Runner", "Ghost in the Shell", "Gintama", "No Results"]

    // 分數
    let ratings: [Float] = [9.7, 7.0, 7.3, 8.4, 7.8, 1.8, 2.2, 7.5, 8.2, 8.1, 9.1, 6.9, 0.0]

    // 年份
    let releaseDates = ["1994", "2022", "2010", "2022", "2004", "1989", "2015", "1992", "1988", "1982", "1995", "2017", "No Results"]

    var moviesIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ratingScoreLabel.text = "0.0"
        moviesNameLabel.text = " "
        moviesRatingLabel.text = " "
        moviesDateLabel.text = " "
    }
    
    // 比對文字相等
    @IBAction func searchButton(_ sender: Any) {
        
        if searchTextField.text?.localizedCaseInsensitiveContains("Shawshank") == true {
            moviesIndex = 0
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Turning") == true {
            moviesIndex = 1
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Bullets") == true {
            moviesIndex = 2
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Slam") == true {
            moviesIndex = 3
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Les") == true {
            moviesIndex = 4
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Going") == true {
            moviesIndex = 5
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Onna") == true {
            moviesIndex = 6
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Shao") == true {
            moviesIndex = 7
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Die") == true {
            moviesIndex = 8
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Blade") == true {
            moviesIndex = 9
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Ghost") == true {
            moviesIndex = 10
            movieInformation()
        } else if searchTextField.text?.localizedCaseInsensitiveContains("Gin") == true {
            moviesIndex = 11
            movieInformation()
        } else {
            
            moviesIndex = movies.count - 1
            movieInformation()
        }
        // 點擊button 收起鍵盤
        view.endEditing(true)
    }
    

    // RatingSlider 當前 slider 數值字串化，
    @IBAction func ratingSliderValueChanged(_ sender: UISlider) {

        let roundedRating = Float(round(sender.value * 10) / 10)
        ratingScoreLabel.text = String(format: "%.1f", roundedRating)
        sender.setValue(roundedRating, animated: true)

    }

    // 結果產生
    @IBAction func resultsButtonPressed(_ sender: Any) {

        // slider為浮點數，故將sldier值給小數點後一位，用於電影評分準確性
        let roundedRating = Float(round(10 * ratingSlider.value) / 10)

        if categorySegmentedControl.selectedSegmentIndex == 1, areaSegmentedControl.selectedSegmentIndex == 0, ageLimitSwitch.isOn == true, roundedRating == ratings[0] {

            moviesIndex = 0
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 3, areaSegmentedControl.selectedSegmentIndex == 0, ageLimitSwitch.isOn == false, roundedRating == ratings[1] {

            moviesIndex = 1
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 2, areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == true, roundedRating == ratings[2] {

            moviesIndex = 2
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 3, areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == false, roundedRating == ratings[3] {

            moviesIndex = 3
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 1, areaSegmentedControl.selectedSegmentIndex == 2, ageLimitSwitch.isOn == false, roundedRating == ratings[4] {

            moviesIndex = 4
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 2, areaSegmentedControl.selectedSegmentIndex == 0, ageLimitSwitch.isOn == true, roundedRating == ratings[5] {

            moviesIndex = 5
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 2, areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == false, roundedRating == ratings[6] {

            moviesIndex = 6
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 1, areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == true, roundedRating == ratings[7] {

            moviesIndex = 7
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 0, areaSegmentedControl.selectedSegmentIndex == 0, ageLimitSwitch.isOn == true, roundedRating == ratings[8] {

            moviesIndex = 8
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 1, areaSegmentedControl.selectedSegmentIndex == 0, ageLimitSwitch.isOn == true, roundedRating == ratings[9] {

            moviesIndex = 9
            movieInformation()

        } else if categorySegmentedControl.selectedSegmentIndex == 0, areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == true, roundedRating == ratings[10] {

            moviesIndex = 10
            movieInformation()

        }  else if categorySegmentedControl.selectedSegmentIndex == 2 , areaSegmentedControl.selectedSegmentIndex == 1, ageLimitSwitch.isOn == false, roundedRating == ratings[11] {

            moviesIndex = 11
            movieInformation()

        } else {

            moviesIndex = movies.count - 1
            movieInformation()
        }

    }

    // 重置
    @IBAction func resetButtonPressed(_ sender: Any) {

        searchTextField.text = " "
        
        moviesImageView.image = UIImage(named: "nil")
        moviesNameLabel.text = " "
        moviesRatingLabel.text = " "
        moviesDateLabel.text = " "

        categorySegmentedControl.selectedSegmentIndex = 0
        areaSegmentedControl.selectedSegmentIndex = 0

        ageLimitSwitch.isOn = false

        ratingSlider.value = 0
        ratingScoreLabel.text = "0.0"

    }

    // 電影資訊
    func movieInformation() {
        moviesImageView.image = UIImage(named: movies[moviesIndex])
        moviesNameLabel.text = movies[moviesIndex]

        moviesRatingLabel.text = String(ratings[moviesIndex])
        moviesDateLabel.text = releaseDates[moviesIndex]
    }
}

