//
//  FirstVC.swift
//  Высотка
//
//  Created by Ivan Pushkov on 12.01.2024.
//

import UIKit
import SnapKit
class FirstVC: UIViewController {
    
    
    let hcButton = UIButton()
    let ov2Button  = UIButton()
    let drButton = UIButton()
    
    let headerLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Размещение текста
        headerLabel.text = "Тип системы"
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.topMargin).offset(30)
        }
        
        
        // MARK: - Создание и размещение кнопок (вызов функций)
        // ХС
        hcButton(hcButton)
        hcButton.addTarget(self, action: #selector(hcStruct), for: .touchDown)
        // OV2
        ov2(ov2Button)
        ov2Button.addTarget(self, action: #selector(ov2Struct), for: .touchDown)
        // Dreenage
        drenage(drButton)
        drButton.addTarget(self, action: #selector(drenageStruct), for: .touchDown)
        // Вызов функции по выбору объекта класса
        
        
    }
    // MARK: - Объявление функции для создания кнопок и назначения им экшена
    // ХС
    func hcButton(_: UIButton){
        
        hcButton.snp.makeConstraints{make in
            make.top.equalTo(view.snp_topMargin).offset(170)
            buttonSittings(button: hcButton, name: "XC")
          
        }
    }
    // OV2
    func ov2(_: UIButton){
        ov2Button.snp.makeConstraints{ make in
            make.top.equalTo(hcButton.snp_topMargin).offset(170)
            buttonSittings(button: ov2Button, name: "ОВ2")
           
        }
        
    }
    
    // Dreenage
    func drenage(_: UIButton){
        drButton.snp.makeConstraints{make in
            make.top.equalTo(ov2Button.snp_bottomMargin).offset(170)
            buttonSittings(button: drButton, name: "Д")
          
        }
    }
    
    // Функция для создания кнопки по центру оси Х без констрейнта по Y
    func buttonSittings(button: UIButton, name: String){
        button.layer.cornerRadius = 23
        button.setTitle(name, for: .normal)
        self.view.addSubview(button)
        button.backgroundColor = UIColor.blue
        button.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
       
        
    }
    //MARK: - создаем объект который примет систему и диаметры
    var valu = DataDuct(diameters: [1], sistem: "", pickerVisual: false)
    //MARK: выбираем по имени нашей кнопки
    func chooseBotton(buttonName: String) {
        switch buttonName{
            case "Д":    valu = drainage
            case "ОВ2":   valu = hv2
            case "XC":   valu = cs
            default: break
        }
        print("Имя кнопки \(buttonName), выбранная структура \(valu) ")

    }
    
    @objc func changeVС(){
        // передаем значение объекта класса на второй контроллер
        let storyBoardD = UIStoryboard(name: "Main", bundle: nil)
        if let vc2 = storyBoardD.instantiateViewController(identifier: "VC2") as? ViewController{
            vc2.clObj = valu
            show(vc2, sender: nil)
            // переходим на второй контроллер
            let vc  = storyboard?.instantiateViewController(withIdentifier: "VC2")
            self.present(vc!, animated: true, completion: nil)
            
        }
    }
   
    
    @objc func drenageStruct() {
        chooseBotton(buttonName: (drButton.titleLabel?.text)!)
        //valu = drainage
        drButton.addTarget(self, action: #selector(changeVС ), for: .touchUpInside)
    }
    @objc func hcStruct() {
        chooseBotton(buttonName: (hcButton.titleLabel?.text)!)
       // valu = cs
        hcButton.addTarget(self, action: #selector(changeVС ), for: .touchUpInside)
    }
    @objc func ov2Struct() {
        chooseBotton(buttonName: (ov2Button.titleLabel?.text)!)
       // valu = hv2
        ov2Button.addTarget(self, action: #selector(changeVС ), for: .touchUpInside)
    }

}

