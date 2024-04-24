
import Foundation
struct DataDuct {

    var diameters: [Int]
    var sistem: String
    var pickerVisual: Bool
    init(diameters: [Int], sistem: String, pickerVisual: Bool){
        self.diameters = diameters
        self.sistem = sistem
        self.pickerVisual = pickerVisual
    }
    
}
let drainage = DataDuct(diameters: [22, 35, 42], sistem: "Дренаж", pickerVisual: false)
let cs = DataDuct(diameters: [18,22 ,28 ,35, 42, 54, 76, 86], sistem: "XC", pickerVisual: false)
let hv2 = DataDuct(diameters: [125, 250, 315, 400, 500], sistem: "ОВ2", pickerVisual:  true)



