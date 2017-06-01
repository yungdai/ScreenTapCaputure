//
//  MainViewController.swift
//  ScreenTapCaputure
//
//  Created by Yung Dai on 2017-06-01.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var startCaptureButton: UIButton!
    
    var isCapturing = false
    var capturedImage: UIImage?
    
    
    // MARK: - View Delegates
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Tap Gestures
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        
        if isCapturing {
            
            // enter in the capture code
        }
        
    }
   
    @IBAction func startCaptureButtonPressed(_ sender: UIButton) {
    
        if !isCapturing {
            
            startCapture()
        } else {
            
            stopCapture()
        }
    
    }
    
    func startCapture() {
        
        
    }
    
    
    func stopCapture() {
        
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showResults" {
            
            let resultsVC = segue.destination as! ResultsViewController
            
            resultsVC.resultImage = capturedImage
            
        }
    }


}
