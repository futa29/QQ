//
//  StartViewController.swift
//  QQ
//
//  Created by 谷風汰 on 2020/06/09.
//  Copyright © 2020 Futa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    //問題のジャンルを決める変数
    var select = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "Next" {
            //  遷移先のViewControllerを取得
            let next2 = segue.destination as? ViewController
            next2?.choice = select
         

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func stratbutton(_ sender: Any) {
         performSegue(withIdentifier: "Next", sender: nil)
         select = 1
    }
    
    @IBAction func spquiz(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
        select = 10
    }
    
    
    
}
