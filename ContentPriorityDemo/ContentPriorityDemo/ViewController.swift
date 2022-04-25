//
//  ViewController.swift
//  ContentPriorityDemo
//
//  Created by harman on 2022/4/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let contentLabe: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var textField: UITextField = {
        var textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Placeholder"
        textField.delegate = self
        textField.borderStyle = UITextField.BorderStyle.none
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.backgroundColor = .red
        return textField
    }()
    
    lazy var measureLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .yellow
        label.textColor = .black
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(contentLabe)
        contentLabe.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(150)
            make.centerY.equalToSuperview()
        }
        
        contentLabe.addSubview(measureLabel)
        measureLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        contentLabe.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalTo(self.measureLabel.snp.left).offset(-10.0)
            make.centerY.equalToSuperview()
        }
        
        
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        measureLabel.text = textField.text
    }
    
}

