//
//  ViewController.swift
//  Высотка
//
//  Created by Ivan Pushkov on 13.10.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
  
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clObj.diameters.count
    }
    
    
      // Объявляю компоненты
   @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var airDuctLable: UILabel!
    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var buttonAnswer: UIButton!
    @IBOutlet weak var realHigh: UITextField!
    @IBOutlet weak var reperTextFild: UITextField!
    @IBOutlet weak var shapeSwicher: UISwitch!
    @IBOutlet weak var diametrChanger: UIPickerView!
    @IBOutlet weak var buttom: UIButton!
    var clObj = DataDuct(diameters: [2], sistem: "", pickerVisual: true)
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        diametrChanger.isHidden = true
        buttom.layer.cornerRadius = 12
  
    
     
        
        buttonAnswer.titleLabel?.text = "Расчитать"
        answerLable.text = ""
        nameLable.text = "Расчет высотной отметки"
        realHigh.text = "0"
        reperTextFild.text = "0"
        
 
        
        diametrChanger.selectRow(clObj.diameters.count, inComponent: clObj.diameters.startIndex, animated: true)
        // Назначаю пикеру протоколы
        diametrChanger.dataSource = self
        diametrChanger.delegate = self
        
        // назначаю делегаты текстфилдам
        reperTextFild.delegate = self
        realHigh.delegate = self
     
    }
    

    @IBAction func shapeSwicherFunc(_ sender: Any) {
        
        if shapeSwicher.isOn {
            airDuctLable.text = "Прямоугольный"
            diametrChanger.isHidden = true
        } else {
            airDuctLable.text = "Круглый"
            diametrChanger.isHidden = false
        }
    }
    
let  ductShape = ["Круглый", "Прямоугольный"]

 

    @IBAction func actionButtonAnswer() {
        // отключаю клавиатуру
        reperTextFild.resignFirstResponder()
        realHigh.resignFirstResponder()
        // перевожу в инт значения
        let number1 = Int(realHigh.text!) ?? 0
        let number2 = Int(reperTextFild.text!) ?? 0
        let floor = number2 / 4200
        let diamet = Int(diametrChanger.selectedRow(inComponent: 0))
        let diameter = Int(clObj.diameters[diamet])
        if floor > 86 || number2 <= 0 {
            let alert = UIAlertController(title: "Ошибка этажа!", message: "Пожалуйста выберите существующий этаж!", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(alertButton)
            self.present(alert, animated: true, completion: nil)
        }
             if diametrChanger.isHidden  == true  {
            let rectValue = Double((number2 + number1 + 1000))
            
            answerLable.text = "\(round(rectValue * 10) / 10000)"
        }
        
        else {
            let sircleValue = Double((number2 + number1 + 1000 + (diameter / 2)) )
            answerLable.text = "\(round(sircleValue * 10) / 10000)"
            
            print(diameter)
            
        }
    }

    
    
}


extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let diameter = clObj.diameters[row]
        return "\(diameter)"
    }
    }

    
    

