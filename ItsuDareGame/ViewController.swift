//
//  ViewController.swift
//  ItsuDareGame
//
//  Created by AoiKobayashi on 2025/05/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itsuLabel: UILabel!
    @IBOutlet var dokodeLabel: UILabel!
    @IBOutlet var daregaLabel: UILabel!
    @IBOutlet var doshitaLabel: UILabel!
    
    let itsuArray: [String] = ["さっき", "江戸時代に", "3秒前", "未来で","放課後", "昨日の夜", "バレンタインの日", "文化祭の日"]
    
    let dokodeArray: [String] = ["宇宙の端で", "冷蔵庫の中で", "お風呂の中で", "教室の天井で","教室の隅で", "屋上で", "図書室で", "下駄箱の前で"]
    
    let daregaArray: [String] = ["ゴリラが", "校長先生が", "AIが", "赤ちゃんが","幼なじみが", "クラスのアイドルが", "転校生が", "後輩が"]
    
    let doshitaArray: [String] = ["ラーメンを召喚した", "急に歌い出した", "空を飛んだ", "哲学を語った","告白してきた", "突然手を握ってきた", "間違えてチョコを渡してきた", "壁ドンしてきた"]
    
    var index: Int = 0
    
    //履歴用
    var itsuHistory: [Int] = []
    var dokodeHistory: [Int] = []
    var daregaHistory: [Int] = []
    var doshitaHistory: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //丸くする
        itsuLabel.layer.cornerRadius = 12
        dokodeLabel.layer.cornerRadius = 12
        daregaLabel.layer.cornerRadius = 12
        doshitaLabel.layer.cornerRadius = 12
        
        itsuLabel.clipsToBounds = true
        dokodeLabel.clipsToBounds = true
        daregaLabel.clipsToBounds = true
        doshitaLabel.clipsToBounds = true
    }

    //入れ替えボタン用
    @IBAction func change () {
        //それぞれのラベルに配列の要素を表示する
        itsuLabel.text = itsuArray[index]
        dokodeLabel.text = dokodeArray[index]
        daregaLabel.text = daregaArray[index]
        doshitaLabel.text = doshitaArray[index]
        
        if index == 7 {
            index = 0
        }else {
            index += 1
        }
    }
    
    @IBAction func reset () {
        //それぞれのラベルの表示を元に戻す
        itsuLabel.text = "----"
        dokodeLabel.text = "----"
        daregaLabel.text = "----"
        doshitaLabel.text = "----"
        
        //index 初期値
        index = 0
    }
    
    @IBAction func random () {
        let itsuIndex = Int.random(in:0...7)
        let dokodeIndex = Int.random(in:0...7)
        let daregaIndex = Int.random(in:0...7)
        let doshitaIndex = Int.random(in:0...7)
        
        //コンソールに表示
        print("いつ: \(itsuIndex)")
        print("どこで: \(dokodeIndex)")
        print("だれが: \(daregaIndex)")
        print("どうした: \(doshitaIndex)")
        
        //それぞれのラベルに配列の要素を表示する
        itsuLabel.text = itsuArray[itsuIndex]
        dokodeLabel.text = dokodeArray[dokodeIndex]
        daregaLabel.text = daregaArray[daregaIndex]
        doshitaLabel.text = doshitaArray[doshitaIndex]
        
        //履歴用
        itsuHistory.insert(itsuIndex, at:0)
        dokodeHistory.insert(dokodeIndex, at:0)
        daregaHistory.insert(daregaIndex, at:0)
        doshitaHistory.insert(doshitaIndex, at:0)
    }
    
    
    @IBAction func rollBack () {
        
        //もし配列に値が入っていなかった場合
        if itsuHistory.count <= 1 {
            print("break")
            return
        }
        
        itsuLabel.text = itsuArray[itsuHistory[1]]
        dokodeLabel.text = dokodeArray[dokodeHistory[1]]
        daregaLabel.text = daregaArray[daregaHistory[1]]
        doshitaLabel.text = doshitaArray[doshitaHistory[1]]
        
        //コンソールに表示
        print("mいつ: \(itsuHistory[1])")
        print("mどこで: \(dokodeHistory[1])")
        print("mだれが: \(daregaHistory[1])")
        print("mどうした: \(doshitaHistory[1])")
    }
}

