//
//  ViewController.swift
//  TryPanframe
//
//  Created by Nobuo Danjou on 2016/02/05.
//  Copyright © 2016年 Nobuo Danjou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PanframeAssetObserver {
    
    var pfView: PanframeView?
    var asset: PanframeAsset?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pfView = PanframeView(frame: self.view.frame)
        pfView?.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        pfView?.navigationMode = .Motion

        let path = NSBundle.mainBundle().pathForResource("videos_s_4", ofType: "mp4")
        
        let url = NSURL(fileURLWithPath: path!)
        asset = PanframeAsset(url: url, observer: self)
        pfView?.setAsset(asset)
        
        self.view.addSubview(pfView!)
        self.view.sendSubviewToBack(pfView!)
        pfView?.setViewMode(.Spherical, andAspectRatio: 16.0/9.0)
        pfView?.setFieldOfView(75.0)
//        pfView?.setInterfaceOrientation(self.interfaceOrientation)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        pfView?.run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func panframeAsset(asset: PanframeAsset, onPlayerTime time: CMTime) {
        
    }
    
    func panframeAsset(asset: PanframeAsset, onStatusMessage message: PanframeAssetMessage) {
        
    }

}

