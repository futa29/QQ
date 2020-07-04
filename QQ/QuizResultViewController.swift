//
//  QuizResultViewController.swift
//  QQ
//
//  Created by 谷風汰 on 2020/06/08.
//  Copyright © 2020 Futa. All rights reserved.
//

import UIKit
// 問題数カウント
var cnt = 0
//　正解数カウント
var ans_cnt = 0
class QuizResultViewController: UIViewController {
    
    var result = 0
    var anskotae = 0
    var anscnt = 0
    

    
    @IBOutlet weak var ansView: UIImageView!
    var maru: UIImage = UIImage(named: "quiz_maru")!
    var batsu: UIImage = UIImage(named: "quiz_batsu")!
    
   
    
    
    @IBAction func backbutton(_ sender: Any) {
    
        //５問出題すると、結果表示　5門未満なら、次の問題に
        if cnt<5{
            anscnt = ans_cnt
            self.dismiss(animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: "fin", sender: nil)
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "fin" {
            //  遷移先のViewControllerを取得
            let next = segue.destination as? QQResultViewController
            
            anscnt = ans_cnt
            //正解数を次の画面に受け渡し
            next?.count = self.anscnt
             
    }
    }
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            if result == anskotae {
            ansView.image = maru
            cnt += 1
            ans_cnt += 1
            }else{
            cnt  += 1
            ansView.image = batsu
            }
        
        }
    

    
    
}
