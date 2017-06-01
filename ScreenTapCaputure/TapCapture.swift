//
//  TapCapture.swift
//  ScreenTapCaputure
//
//  Created by Yung Dai on 2017-06-01.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

protocol TapCaptureDelegate: class {
    
    var isCapturing: Bool { get set }
    var capturedImage: UIImage? { get set }
    var capturingView: UIView? { get set }
    
}

class TapCapture: NSObject {
    
    weak var delegate: TapCaptureDelegate?

    func startCapture() {
        
        guard let captureView = delegate?.capturingView as UIView? else { return }
        
        delegate?.capturedImage = UIImage.takeScreenshot(view: captureView)
        
        delegate?.isCapturing = true
    }
    
    
    func endCapture() {
        
        delegate?.isCapturing = false
        
        
    }
    
    func drawLineFromGesture(fromPoint: CGPoint, toPoint: CGPoint) {
        
        guard let image = delegate?.capturedImage as UIImage? else { return }
        
        // take an image and use it as the context
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        
        // draw the image into the context
        image.draw(at: CGPoint.zero)
        
        let context = UIGraphicsGetCurrentContext()
        
        // create the line
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setLineWidth(2.0)
        context?.setLineCap(.round)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.strokePath()
        
        delegate?.capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // stop the context capture
        UIGraphicsEndImageContext()
        
    }
    
    
    func drawTapCircleToImageAt(_ atPoint: CGPoint) {
        
        guard let image = delegate?.capturedImage as UIImage? else { return }

        // take an image and use it as the context
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        
        // draw the image into the context
        image.draw(at: CGPoint.zero)

        // create a new context from the image
        let context = UIGraphicsGetCurrentContext()

        // create the rectangle for the circle
        let rect = CGRect(x: atPoint.x, y: atPoint.y, width: 5.0, height: 5.0)
        
        // draw circle inside the rectangle
        context?.strokeEllipse(in: rect)
        
        // set the red colour as the fill then fill the ellipse inside the rectangle
        UIColor.red.setFill()
        context?.fillEllipse(in: rect)

        delegate?.capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // stop the context capture
        UIGraphicsEndImageContext()
        
    }
}
