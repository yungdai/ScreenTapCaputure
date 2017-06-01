//
//  MainViewController.swift
//  ScreenTapCaputure
//
//  Created by Yung Dai on 2017-06-01.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, TapCaptureDelegate {

    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var tappingView: UIView!
    @IBOutlet weak var startTapCaptureButton: UIButton!
    
    var isCapturing: Bool = false
    var capturedImage: UIImage?
    var capturingView: UIView?
    
    let tapCapture: TapCapture = TapCapture()
    
    // MARK: - View Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapCapture.delegate = self
    }

    // MARK: - Tap Gestures
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {

        if isCapturing {
            
            let point: CGPoint = sender.location(in: self.tappingView)
            tapCapture.drawTapCircleToImageAt(point)
        }
    }
   
    @IBAction func startCaptureButtonPressed(_ sender: UIButton) {
    
        if !isCapturing {
            
            self.capturingView = self.tappingView
            tapCapture.startCapture()
            startTapCaptureButton.setTitle("Stop Capture", for: .normal)
        } else {
            
            tapCapture.endCapture()
            startTapCaptureButton.setTitle("Start Capture", for: .normal)
        }
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showResults" {
            
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.resultImage = capturedImage
        }
    }
}
