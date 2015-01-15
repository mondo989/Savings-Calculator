//
//  ViewController.swift
//  Savings Calculator
//
//  Created by Armando Flores on 1/14/15.
//  Copyright (c) 2015 Armando Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var txtWeeklySavings: UITextField!
    
    @IBOutlet weak var lblHourlyIncome: UILabel!
    @IBOutlet weak var lblWeeklyIncome: UILabel!
    @IBOutlet weak var lblMonthlyIncome: UILabel!
   
    @IBOutlet weak var lblMonthlySavings: UILabel!
    @IBOutlet weak var lblYearlySavings: UILabel!
    @IBOutlet weak var lblMonthlyPercent: UILabel!
    @IBOutlet weak var lblYearlyPercent: UILabel!

    var yearlyIncome = ""
    var weeklySavings = ""
    
    var hourlyIncome : Float = 0
    var weeklyIncome : Float = 0
    var monthlyIncome : Float = 0

    var monthlySavings : Float = 0
    var yearlySavings : Float = 0
    var monthlyPercent : Float = 0
    var yearlyPercent : Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalculate(sender: UIButton) {
        calculateSavings()
    }
    
    
    @IBAction func btnClear(sender: UIButton) {
        txtWeeklySavings.text = ""
        txtYearlyIncome.text = ""
        
        lblHourlyIncome.text = "$0"
        lblWeeklyIncome.text = "$0"
        lblMonthlyIncome.text = "%0"
        
        lblMonthlySavings.text = "$0"
        lblYearlyPercent.text = "$0"
        lblMonthlyPercent.text = "%0"
        lblYearlyPercent.text = "%0"
        
    }
    
    func calculateSavings() -> Bool{
        yearlyIncome = txtYearlyIncome.text
        weeklySavings = txtWeeklySavings.text
    
        var fYearlyIncome = (yearlyIncome as NSString).floatValue
        var fWeeklySavings = (weeklySavings as NSString).floatValue
        
        hourlyIncome = fYearlyIncome / 52 / 40
        weeklyIncome = fYearlyIncome / 52
        monthlyIncome = fYearlyIncome / 12
        
        monthlySavings = fWeeklySavings * 4
        yearlySavings = fWeeklySavings * 52
        
        monthlyPercent = fWeeklySavings / monthlyIncome * 100
        yearlyPercent = (fWeeklySavings * 52) / fYearlyIncome
        
        var strHourlyIncome : NSString = NSString(format: "%0.0f", hourlyIncome)
        var strWeeklyIncome : NSString = NSString(format: "%0.0f", weeklyIncome)
        var strMonthlyIncome : NSString = NSString(format: "%0.0f", monthlyIncome)
        var strMonthlySavings : NSString = NSString(format: "%0.0f", monthlySavings)
        var strYearlySavings : NSString = NSString(format: "%0.0f", yearlySavings)
        var strMonthlyPercent : NSString = NSString(format: "%0.0f", monthlySavings)
        var strYearlyPercent : NSString = NSString(format: "%0.0f", yearlyPercent)

        lblHourlyIncome.text = "$\(strHourlyIncome)"
        lblWeeklyIncome.text = "$\(strWeeklyIncome)"
        lblMonthlyIncome.text = "$\(strMonthlyIncome)"
        
        lblMonthlySavings.text = "$\(strMonthlyPercent)"
        lblYearlySavings.text = "$\(strYearlySavings)"
        
        lblMonthlyPercent.text = "%\(strMonthlyPercent)"
        lblYearlyPercent.text = "%\(strYearlyPercent)"

        
        
        return true
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        txtYearlyIncome.resignFirstResponder()
        txtWeeklySavings.resignFirstResponder()
    }

}

