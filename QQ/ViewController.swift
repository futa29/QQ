//
//  ViewController.swift
//  QQ
//
//  Created by 谷風汰 on 2020/06/07.
//  Copyright © 2020 Futa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //どのジャンルの問題なのかを判定する変数
    var hantei = 0
    
    var counter = 0
    var choice = 0
//    var answer = 0
    //ユーザが選んだ選択肢を入れる変数
    var  your = 0
    //問題の答えを識別する変数　QuizResultViewControllerに値を渡す
    var kotae = 0
    //
    var randomNumber = Int.random(in: 1 ... 4)
    //
    //ユーザが選んだ選択肢を識別する定数
    let select1 =  1
    let select2 = 2
    let select3 = 3
    let select4 = 4
    
    

    
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    
    
    
    @IBAction func backbutton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    //var selectAnswer = String()
    //問題の内容を入れておくメンバ変数
    var problemArray: NSMutableArray = []
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toNext" {
            //  遷移先のViewControllerを取得
            let next = segue.destination as? QuizResultViewController
         
         
             if your == select1{
                 next?.result = self.your
                 next?.anskotae = self.kotae
             }else if your == select2{
                 next?.result = self.your
                 next?.anskotae = self.kotae
             }else if your == select3{
                 next?.result = self.your
                 next?.anskotae = self.kotae
             }else if your == select4{
                 next?.result = self.your
                 next?.anskotae = self.kotae
             }else{
                print("ダメだこりゃ")
            }

        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //画面出現中のタイミングに読み込まれる処理
    override func viewWillAppear(_ animated: Bool) {
        
        //計算配列のセット
        csvToArray()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        //問題を取得する
        createNextProblem()
        
    }
    
    

    func csvToArray () {
    
    
    let csvBundle = Bundle.main.path(forResource: "problem", ofType: "csv")

        //CSVデータの解析処理
        do {

            //CSVデータを読み込む
            var csvData: String = try String(contentsOfFile: csvBundle!, encoding: String.Encoding.utf8)

            csvData = csvData.replacingOccurrences(of: "\r", with: "")

            //改行を基準にしてデータを分割する読み込む
            let csvArray = csvData.components(separatedBy: "\n")

            //CSVデータの行数分ループさせる
            for line in csvArray {
                
                //カンマ区切りの1行を["aaa", "bbb", ... , "zzz"]形式に変換して代入する
                let parts = line.components(separatedBy: ",")
                problemArray.add(parts)
                
            }

            //配列を引数分の要素をランダムにシャッフルする(※Extension.swift参照)
            //problemArray.shuffle(self.problemArray.count)

        } catch let error as NSError {
            print(error.localizedDescription)
        }

    }
    
    func createNextProblem() {
        
        
        //ジャンル分けをして問題を取得する
//        let hanteiProblem: NSArray = self.problemArray[self.counter] as! NSArray
//        hantei = Int(hanteiProblem[6] as! String)!
//        print(hantei)
//        print(choice)
//
//        if (hantei == choice){
//            counter += 1
//        }
        
        
        //csvから取得した問題をtargetProblemに取得する
        let targetProblem: NSArray = self.problemArray[self.counter] as! NSArray
        
        
        //ラベルに表示されている値を変更する
        //配列 → 0番目：問題文, 1番目：1番目の選択肢, 2番目：2番目の選択肢, 3番目：3番目の選択肢, 4番目：4番目の選択肢, 5番目：正解の選択肢
       //questionLabel.text = "第" + String(self.counter + 1) + "問"
        question.text = targetProblem[0] as? String
//            question.text = problemArray[0] as? String
        //ボタンに選択肢を表示する
        kotae = Int(targetProblem[5] as! String)!
        buttonOne.setTitle("1." + String(describing: targetProblem[1]), for: UIControl.State())
        buttonTwo.setTitle("2." + String(describing: targetProblem[2]), for: UIControl.State())
        buttonThree.setTitle("3." + String(describing: targetProblem[3]), for: UIControl.State())
        buttonFour.setTitle("4." + String(describing: targetProblem[4]), for: UIControl.State())
        
        counter += 1
    }
    
    
    
    
    
    

    
    
    @IBAction func button1Action(_ sender: Any) {
        your = 1
       performSegue(withIdentifier: "toNext", sender: nil)
    }
    @IBAction func button2Action(_ sender: Any) {
        your = 2
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    @IBAction func button3Action(_ sender: Any) {
        your = 3
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    @IBAction func button4Action(_ sender: Any) {
        your = 4
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
    
    
}

