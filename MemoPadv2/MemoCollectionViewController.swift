//
//  MemoCollectionViewController.swift
//  MemoPadv2
//
//  Created by 大場史温 on 2024/08/25.
//

import UIKit

class MemoCollectionViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //タイトル配列を取得
        titles = saveData.object(forKey: "titles") as? [String] ?? []
        //コンテンツ配列を取得
        contents = saveData.object(forKey: "contents") as? [String] ?? []
        
        collectionView.dataSource = self
        
        //CollectionViewテーマ変更
        let configuragion = UICollectionLayoutListConfiguration(appearance: UICollectionLayoutListConfiguration.Appearance.plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuragion)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //タイトル配列を取得
        titles = saveData.object(forKey: "titles") as? [String] ?? []
        //コンテンツ配列を取得
        contents = saveData.object(forKey: "contents") as? [String] ?? []
    }
    
    
}

extension MemoCollectionViewController: UICollectionViewDataSource {
    
    //個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    //コレクション内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        var contentConfiguragion = UIListContentConfiguration.cell()
        
        contentConfiguragion.text = titles[indexPath.row]
        
        contentConfiguragion.secondaryText = contents[indexPath.row]
        
        cell.contentConfiguration = contentConfiguragion
        
        return cell
    }
    
}
