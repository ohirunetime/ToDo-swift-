//
//  SampleCustomCell.swift
//  ToDo
//
//  Created by 慎之助 on 2020/03/11.
//  Copyright © 2020 ohirune. All rights reserved.
//

import Foundation
import UIKit

class SampleCustomCell: UITableViewCell {
    
  var sampleLabel:UILabel!
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // 引数のないコンストラクタみたいなもの。
  // インスタンスが生成されたときに動く関数
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    // とりあえず、labelを作成してcontentViewにadd
    self.sampleLabel = UILabel()
    self.sampleLabel.frame = CGRect(
      x: 20,
      y: 0,
      width: self.contentView.frame.width,
      height: self.contentView.frame.height
    )
    self.contentView.addSubview(self.sampleLabel)
  }
}
