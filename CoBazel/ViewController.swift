//
//  ViewController.swift
//  CoBazel
//
//  Created by Bondan Eko Prasetyo on 15/08/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import UIKit
import DepsObjC
import DepsMix

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "Hello World"
        
        self.view.addSubview(label)
        
        let test = LibAClass()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else {
                return
            }
            
            let bomb = Bomb()
            let text = bomb.explode()
            
            let person = Person(name: text!, age: 26)
            
            test.method { [weak self] (status) in
                if !status {
                    label.text = "Hello, \(person.name)"
                    self?.view.backgroundColor = .red
                }
            }
        }
    }


}

