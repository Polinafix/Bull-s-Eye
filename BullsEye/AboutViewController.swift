//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Polina Fiksson on 01/07/2017.
//  Copyright © 2017 PolinaFiksson. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye",
                                     withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html",
                             textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }

    }
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
