//
//  QuestionViewController.swift
//  WordList
//
//  Created by 中井日向子 on 2022/05/14.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false  // 回答したか、次の質問へ行くかの判定
    var wordArray: [Dictionary<String, String>] = []  // UserDefaultからとる配列
    var nowNumber: Int = 0  // 現在の回答回数
    let saveData = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        // 問題をシャッフルする
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped() {
       // 回答したか
        if isAnswered {
            // 次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            // 次の問題を表示 するか
            if nowNumber < wordArray.count {
                // 次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                // isAnsweredをfalseにする
                isAnswered = false
                // ボタンのタイトルを変更 する。
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            // 答えを表示 する
            answerLabel.text = wordArray[nowNumber]["japanese"]
            // isAnswered truelt
            isAnswered = true
            // ボタンのタイトルを変更
            nextButton.setTitle("次へ", for: .normal)
        }
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
