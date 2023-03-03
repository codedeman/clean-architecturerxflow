//
//  FirstViewController.swift
//  
//
//  Created by Kevin on 4/7/23.
//

import UIKit

class FirstViewController: UIViewController {
    var pageIndex: Int = 0 {
        didSet {
            switch pageIndex {
            case 0:
                view.backgroundColor = .red
            case 1:
                view.backgroundColor = .yellow
            case 3:
                view.backgroundColor = .black
            default:
                view.backgroundColor = .white
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow

    }

   


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
