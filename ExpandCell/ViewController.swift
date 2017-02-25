//
//  ViewController.swift
//  ExpandCell
//
//  Created by Kentarou on 2017/02/26.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionTitleArray = ["Alphabet Num", "Number", "Alphabet", "Expand" ,""]
    
    // Data Array
    var dataArray1 = ["One","Two","Three","Four","Five"]
    var dataArray2 = ["1","2","3"]
    var dataArray3 = ["a","b","c","d"]
    var dataArray4 = [DataModel(),DataModel(),DataModel(),DataModel()]
    var dataArray5 = ["A","B","C","D","E"]
    var dataArrayGroup: [[Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Data
        dataArrayGroup = [dataArray1, dataArray2, dataArray3, dataArray4, dataArray5]
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - TableView Delegate & DataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    // Section Title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    
    // Section Count
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArrayGroup.count
    }
    
    // Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArrayGroup[section].count
    }
    
    // Generate Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell", for: indexPath) as! ExpandCell
            cell.indexPath = indexPath
            cell.dataModel = dataArrayGroup[indexPath.section][indexPath.row] as? DataModel
            cell.delegate = self
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArrayGroup[indexPath.section][indexPath.row] as? String
        return cell
    }
    
    func pushExpandButton(cell: ExpandCell,indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    @IBAction func refresh() {
        dataArrayGroup[3].forEach {
            if let data = $0 as? DataModel {
                data.isExpand = false
            }
        }
        tableView.reloadData()
    }
}

class DataModel {
    var isExpand = false
    var labelText = "今回は、ある製品のレビューを行ないたい。といっても、一般的な製品ではない。開発者向けの「Developer Edition」である。だから、詳細な使い勝手について「製品レビュー」する意味はないし、すべきではない製品だ。日本でもクレジットカード(と33万3,800円/税込)さえあればすぐに購入できるが、普通の人が買って、一般的なデジタルガジェットのように満足できるものではない。購入時にも「消費者にあたらない開発者向けの製品である」旨の警告が出るくらいだ。なにしろ、今は日本語の入力すらできない。そうした事情を理解していない方は購入してはいけないものだ。"
    
    var longText = "だがそれでも、その製品がどんな世界をもたらすのか、きちんと多くの人に知っておいて欲しいと思う。だからこそ、「紹介」という形で記事化したいと思っている。\nその製品とは「Microsoft HoloLens」(以下HoloLens)だ。本連載でも、マイクロソフトがHoloLensや、それに連なる「Windows Holographic」でなにをしようとしているかは、折に触れて取材記事を書いてきた。今回はより詳細に、自分がこのハードウェアに触れた上で、今のHoloLensにできることと、これからHoloLensが生み出すことを解説しようと思う。\n大量のカメラとディスプレイ、本体をひとつにしヘッドセット\nまず、HoloLensがなにか、おさらいするところから始めよう。\nHoloLensは、マイクロソフトが開発した「Mixed Reality」を実現するための機器だ。いわゆるヘッドマウントディスプレイである。\nOculus RiftやPlayStation VRなどと違うのは、PCとしての本体も兼ねており、これだけですべての機能が実現できる、という点である。バッテリで動作させた場合には、ケーブルもない。頭にかぶる形で使うことになるが、座ったままでなく、部屋の中を歩き回って使うこともできる。CPUはIntelのAtom。CherryTrail世代のAtom x5-Z8100(クロック1.04GHz)と言われているものの、公式発表はされていない。だいたいスマホくらいの能力であり、サイズ的にもそのくらいの性能が妥当だ。ちなみにバッテリ動作時間は、実感として3～4時間程度というところだが、これも製品の性質を考えると、現状ではさほど重要なことではない。"
}


