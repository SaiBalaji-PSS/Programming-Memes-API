//
//  Custombtn.swift
//  MemeThrower
//
//  Created by Sai Balaji on 28/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import UIKit
@IBDesignable
class Custombtn: UIButton {

    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        layer.borderColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        layer.borderWidth = 2
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.75
        layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
    }
    
    override  func prepareForInterfaceBuilder() {
        
        layer.cornerRadius = 5
               layer.borderColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
               layer.borderWidth = 2
               layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               layer.shadowOpacity = 0.75
               layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        
    }
    
   

}
