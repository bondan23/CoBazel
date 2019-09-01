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
import AsyncDisplayKit
import IGListKit

class TestDong: ListDiffable {
   let test: String

   init(test: String) {
       self.test = test
   }

   func diffIdentifier() -> NSObjectProtocol {
       return "TEST" as NSObjectProtocol
   }

   func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
       return true
   }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        label.text = "Hello World"
        
        self.view.addSubview(label)

        let node = ASDisplayNode()
        node.backgroundColor = .blue
        self.view.addSubview(node.view)
        node.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            node.view.heightAnchor.constraint(equalToConstant: 100),
            node.view.widthAnchor.constraint(equalToConstant: 100),
            node.view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8)
        ])
        
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

