//
//  SecondCell.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class SecondCell: UITableViewCell {
    
    @IBOutlet weak var titleRowLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let reusedIdentifier = String(describing: SecondCell.self)
    
    var values = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(with title: String, details: [Detail]) {
        titleRowLabel.text = title
        
        details.forEach { detail in
            switch title {
            case "Jenis Reksa Dana":
                values.append(detail.details.type)
            case "Imbal Hasil":
                values.append("\(detail.details.nav)")
            case "Dana Kelolaan":
                values.append(detail.details.type)
            case "Min. Pembelian":
                values.append("\(detail.details.min_subscription)")
            case "Jangka Waktu":
                values.append(detail.details.type)
            case "Tingkat Resiko":
                values.append(detail.details.type)
            default:
                values.append(detail.details.inception_date)
            }
        }
        collectionView.reloadData()
        
    }
    
}

extension SecondCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let value = values[indexPath.item]
        myCell.valueLabel.text = value
        if indexPath.item == 0 {
            myCell.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.5294117647, blue: 0.9607843137, alpha: 1)
        } else if indexPath.item == 1 {
            myCell.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8588235294, blue: 0.9215686275, alpha: 1)
        } else {
            myCell.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8588235294, blue: 0.9333333333, alpha: 1)
        }
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 3
        return CGSize(width: width, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
