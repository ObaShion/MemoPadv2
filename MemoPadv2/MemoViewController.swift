//
//  MemoViewController.swift
//  MemoPadv2
//
//  Created by 大場史温 on 2024/08/25.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleTextField.delegate = self
    }

    @IBAction func saveMemo() {
        
        //現在のタイトル配列取得 tittleArray:[String]
        var tittleArray:[String] = saveData.array(forKey: "titles") as? [String] ?? []
        //新しいタイトルを配列に追加
        tittleArray.append(titleTextField.text!)
        //配列を保存
        saveData.set(tittleArray, forKey: "titles")
        
        //現在のコンテンツ配列取得 tittleArray:[String]
        var contentArray: [String] = saveData.array(forKey: "contents") as? [String] ?? []
        //新しいコンテンツを配列に追加
        contentArray.append(contentTextView.text)
        //配列を保存
        saveData.set(contentArray, forKey: "contents")
        
        
        //アラート作成
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。", preferredStyle: UIAlertController.Style.alert)
        
        //アラートアクション追加
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            print("OK")
            self.titleTextField.text = ""
            self.contentTextView.text = ""
            self.navigationController?.popViewController(animated: true)
        }))
        
        //アラート表示
        present(alert, animated: true)
    }

}

extension MemoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
