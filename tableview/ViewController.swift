//
//  ViewController.swift
//  tableview
//
//  Created by 板谷 衡 on 2015/03/20.
//  Copyright (c) 2015年 板谷衡. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    //tableview宣言
    @IBOutlet var tableview: UITableView!
    var nameArray = [String]() //空の文字配列作成
    
    var imageArray = [UIImage]() //空の画像配列作成

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableviewクラスに書かれているdatasourceメソッドの処理をこのクラスに任せる。(データ提供元をviewcontrollerにする)
        tableview.dataSource = self
        //Tableviewクラスに書いてある処理をself(viewcontroller)に任せてもらう
        tableview.delegate = self
        
        
        nameArray = ["いち","に","さん","よん","ご"]
        
                imageArray.append(UIImage(named: "Life is Tech!背景.png")!)
                imageArray.append(UIImage(named: "IMG_1704.jpg")!)
                imageArray.append(UIImage(named: "IMG_1705.jpg")!)
                imageArray.append(UIImage(named: "IMG_1706.jpg")!)
                imageArray.append(UIImage(named: "IMG_1707.jpg")!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



//コントロール押しながらで持ってきたコピペ
//最低限必要なメソッド 数と内容
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    //1セクションあたりのセル(列)の数
    return nameArray.count
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    //再利用できるIDつきのセルを取得する
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    // Cell上のラベルにnameArrayに入っている文字列を表示する
    //"indexPath.row"は何列目かを表す indexPath...セクション row...何個目か
    cell.textLabel!.text = nameArray[indexPath.row]
    cell.imageView!.image = imageArray[indexPath.row]
    return cell
}
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //何番目のセルが押されたかをチェックする
        NSLog("%d",indexPath.row)
    }


}