//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Nisha Gohil on 2020-12-08.
//

import UIKit
var Track: track?
class ViewController: UIViewController {

    @IBOutlet weak var resultLbl: UITextView!
    @IBOutlet weak var heightLbl: UITextField!
    @IBOutlet weak var weightLbl: UITextField!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var ageLbl: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var heightSeg: UISegmentedControl!
    @IBOutlet weak var weightSeg: UISegmentedControl!
    
    //create variable of perameters
    var heightmeter: Float = 0.0
    var weightkgs : Float = 0.0
    var heightInches: Float = 0.0
    var weightPound : Float = 0.0
    var BMI : Float = 0.0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //segment controller placeholder
    @IBAction func chooseHeight(_ sender: Any) {
        if(heightSeg.selectedSegmentIndex == 0){
            heightLbl.placeholder = "Meters"
    }
        if(heightSeg.selectedSegmentIndex == 1){
            heightLbl.placeholder = "Inches"
        }
    }
    
    @IBAction func chooseWeight(_ sender: Any) {
        if(weightSeg.selectedSegmentIndex == 0){
            weightLbl.placeholder = "Kgs"
        }
            
            if(heightSeg.selectedSegmentIndex == 0){
                weightLbl.placeholder = "Pounds"
    }
    }
    
    
    
    @IBAction  func calculate(_ sender: AnyObject) {
        
        //do calculation if Metric unit selected
        if weightSeg.selectedSegmentIndex == 0 && heightSeg.selectedSegmentIndex == 0 {
                weightkgs = (weightLbl.text! as NSString).floatValue
                heightmeter = (heightLbl.text! as NSString).floatValue
            
        //methemetical expretion for Calculation BMI in Metric unit
        BMI = weightkgs / (heightmeter * heightmeter)
        resultLbl.text = String(BMI)
        }
        
        //do calculation if Imperial unit selected
        if weightSeg.selectedSegmentIndex == 1 && heightSeg.selectedSegmentIndex == 1 {
                weightPound = (weightLbl.text! as NSString).floatValue
                heightInches = (heightLbl.text! as NSString).floatValue
            
            //methemetical expretion for Calculation BMI in Imperial unit
            BMI = (weightPound * 703) / (heightInches * heightInches)
            resultLbl.text = String(BMI)
        }
      
        //display message as per the BMI calculation
        if BMI < 18.5 {
                resultLbl.text = NSString(format: "Your BMI is %2f, You are Underweight", BMI) as String
                resultLbl.backgroundColor = UIColor.systemOrange
        }
        if BMI >= 18.5 && BMI < 25 {
                resultLbl.text = NSString(format: "Your BMI is %2f, Youre Weight is Normal", BMI) as String
                resultLbl.backgroundColor = UIColor.systemBlue
        }
        if BMI >= 25 && BMI < 30 {
                resultLbl.text = NSString(format: "Your BMI is %2f, You are Overweight", BMI) as String
                resultLbl.backgroundColor = UIColor.systemRed
        }
         
        //update the table to store calculation
        Track = track(name: nameLbl.text!, weight: weightLbl.text! , BMI: resultLbl.text!)
        array.append(Track!)
            
    }
      //reset the screen
      @IBAction func resetBtn(_ sender: Any) {
          nameLbl.text! = ""
          gender.selectedSegmentIndex = 0
          ageLbl.text! = ""
          heightSeg.selectedSegmentIndex = 0
          weightSeg.selectedSegmentIndex = 0
          heightLbl.text! = ""
          weightLbl.text! = ""
          resultLbl.text! = ""
          resultLbl?.backgroundColor = .none
        
        }
    
    

    
}

