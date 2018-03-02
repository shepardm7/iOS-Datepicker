//
//  ViewController.swift
//  Datepicker Practice
//
//  Created by Sateek Roy on 2017-07-20.
//  Copyright © 2017 SateekLambton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var missionText: UITextField!
    @IBOutlet weak var countryText: UITextField!
    
    var datePickerView: UIDatePicker = UIDatePicker()
    var missionPicker: UIPickerView = UIPickerView()
    var countryPicker: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateText.delegate = self
        missionText.delegate = self
        countryText.delegate = self
        
        missionPicker.delegate = self
        countryPicker.delegate = self
        
        missionPicker.tag = 1
        countryPicker.tag = 2
        
        missionPicker.backgroundColor = UIColor.white
        countryPicker.backgroundColor = UIColor.white
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.tintColor = UIColor.darkText
        
        toolBar.backgroundColor = UIColor.darkGray
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        
        toolBar.setItems([flexSpace,flexSpace,doneButton], animated: true)
        
        dateText.inputAccessoryView = toolBar
        missionText.inputAccessoryView = toolBar
        countryText.inputAccessoryView = toolBar
        
        dateText.inputView = datePickerView
        missionText.inputView = missionPicker
        countryText.inputView = countryPicker

    }
    
    func pickUpDate()
    {
        self.datePickerView.datePickerMode = UIDatePickerMode.date
        self.datePickerView.backgroundColor = UIColor.white
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMY"
        dateText.text = dateFormatter.string(from: sender.date)
    }
    
    
    //Picker setter
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return PickerData.missionData.count
        }
        
        return PickerData.countryData.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return PickerData.missionData[row]
        }
        return PickerData.countryData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            missionText.text = PickerData.missionData[row]
        }
        else {
            countryText.text = PickerData.countryData[row]
        }
    }
    
    
    func donePressed(sender:UIButton)
    {
        self.view.endEditing(true)
    }

    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField === dateText {
            self.pickUpDate()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

