//
//  ViewController.swift
//  test2
//
//  Created by Птичка on 26/12/2018.
//  Copyright © 2018 Птичка. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func bclick(_ sender: Any) {
        let url = URL(string: "http://kulsha.ru/php/olp.php?f=gN&p=[2]")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
        
        let data = ["123", "234", "345", "Слава", "ewer", "reer", "werew"]
        (children[0] as? InfoTableViewController)?.modelArray = data
        (children[0] as? InfoTableViewController)?.tableView.reloadData()
        
    }
    
}

class Test: Aaa {
    var b: Int
    
    func getB() -> Int {
        return self.b
    }
    
    init () {
        self.b = 20
    }

    
}

protocol Aaa {
    var b : Int { get }
    func getB() -> Int
}
