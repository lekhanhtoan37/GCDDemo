//
//  MusicCell.swift
//  DemoGCD
//
//  Created by Le Toan on 8/10/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import UIKit
import SnapKit

class MusicCell: UITableViewCell {
    lazy var nameLabel = UILabel()
    lazy var authorLabel = UILabel()
    lazy var durationLabel = UILabel()
    lazy var songImageView = UIImageView()
    lazy var downloadButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bind(music: Music) {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MusicCell.className())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        songImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configUI()
    }
    
    private func configUI() {
        
        songImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalTo(songImageView.snp.width)
            $0.width.equalTo(self.snp.height).multipliedBy(2/3)
            
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.leading.equalTo(songImageView.snp.trailing)
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        durationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
        layoutIfNeeded()
    }
    
}

extension NSObject {
    static func className() -> String {
        return String(describing: Self.self)
    }
}
