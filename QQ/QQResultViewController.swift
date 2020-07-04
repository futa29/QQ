//
//  QQResultViewController.swift
//  QQ
//
//  Created by 谷風汰 on 2020/06/25.
//  Copyright © 2020 Futa. All rights reserved.
//

import UIKit

class QQResultViewController: UIViewController {

    @IBOutlet weak var resultview: UILabel!
    
    
    
    //正解数カウント　表示
    var count = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resultview.text="あなたは\(count)問正解しました"
        // Do any additional setup after loading the view.
    }
    


}
