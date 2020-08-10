//
//  ViewController.swift
//  DemoGCD
//
//  Created by Le Toan on 8/5/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView = UITableView()
    
    var listMusic: [Music] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        tableView.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.className(), for: indexPath) as! MusicCell
        
        return cell
    }
    
}
