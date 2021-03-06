//
//  ResultsViewController.swift
//  ScreenTapCaputure
//
//  Created by Yung Dai on 2017-06-01.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    
    var resultImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let displayImage = resultImage as UIImage? else { return }
        
        resultImageView.image = displayImage
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
