//
//  ViewController.swift
//  VisionML
//
//  Created by PoGo on 10/14/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {
    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    @IBOutlet weak var roundedLabelView: RoundedShadowView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var confidenceLabel: UILabel!
    @IBOutlet weak var identificationLabel: UILabel!
    @IBOutlet weak var captureImageView: RoundedShadowImageView!
    
    @IBOutlet weak var flashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
        
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        do{
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true{
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            if captureSession.canAddOutput(cameraOutput) == true{
                
                captureSession.addOutput(cameraOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
                cameraView.layer.addSublayer(previewLayer!)
                captureSession.startRunning()
            }
        } catch{
            debugPrint(error)
        }
        
        
        
    }
}

