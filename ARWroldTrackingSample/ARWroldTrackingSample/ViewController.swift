//
//  ViewController.swift
//  ARWroldTrackingSample
//
//  Created by Shin yongjun on 2022/08/30.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var sceneView: ARSCNView!
    private var arConfiguartion = ARWorldTrackingConfiguration()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,
                                  ARSCNDebugOptions.showWorldOrigin]
        sceneView.session.run(arConfiguartion)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let earthParent = SCNNode()
        earthParent.position = SCNVector3(0, 0, -1)
        
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        sun.position = SCNVector3(x: 0, y: 0, z: -1)
        sun.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "sun-diffuse")
        sceneView.scene.rootNode.addChildNode(sun)
        
        let earth = SCNNode(geometry: SCNSphere(radius: 0.1))
        earth.position = SCNVector3(1, 0, 0)
        //earth.position = SCNVector3(x: 1, y: 0, z: -1)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth-diffuse")
        earth.geometry?.firstMaterial?.emission.contents = UIImage(named: "earth-emission")
        earth.geometry?.firstMaterial?.normal.contents = UIImage(named: "earth-normal")
        earth.geometry?.firstMaterial?.specular.contents = UIImage(named: "earth-specular")
        
        //sceneView.scene.rootNode.addChildNode(earth)
        sceneView.scene.rootNode.addChildNode(earthParent)
        earthParent.addChildNode(earth)
        
        let moon = SCNNode(geometry: SCNSphere(radius: 0.05))
        moon.position = SCNVector3(x: 1.2, y: 0, z: 0)
        moon.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "moon-diffuse")
        earthParent.addChildNode(moon)
        
        let sunAction = SCNAction.rotateBy(x: 0, y: 360.degreeToRadians, z: 0, duration: 10)
        let sunRepeatAction = SCNAction.repeatForever(sunAction)
        sun.runAction(sunRepeatAction)
        
        let earthAction = SCNAction.rotateBy(x: 0, y: 360.degreeToRadians, z: 0, duration: 7)
        let earthRepeatAction = SCNAction.repeatForever(earthAction)
        sun.runAction(earthRepeatAction)
        
        let earthParentAction = SCNAction.rotateBy(x: 0, y: 360.degreeToRadians, z: 0, duration: 7)
        let earthParentRepeatAction = SCNAction.repeatForever(earthParentAction)
        sun.runAction(earthParentRepeatAction)
        
        let moonAction = SCNAction.rotateBy(x: 0, y: 360.degreeToRadians, z: 0, duration: 7)
        let moonRepeatAction = SCNAction.repeatForever(moonAction)
        sun.runAction(moonRepeatAction)
    }

}


extension Int {
    var degreeToRadians: Double {
        return Double(self) * .pi / 180
    }
}
