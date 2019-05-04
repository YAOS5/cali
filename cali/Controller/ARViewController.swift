//
//  ARViewController.swift
//  cali
//
//  Created by Peteski Shi on 4/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import SwiftGifOrigin

class ARViewController: UIViewController, ARSKViewDelegate {
    
    
    @IBOutlet var sceneView: ARSKView!
    @IBOutlet weak var gifCellCollection: UICollectionView!
    
    let imageArray : [String] = ["是", "不"]
    let scene = SKScene(fileNamed: "Scene") as! Scene
    var cellSelectedAt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        sceneView.presentScene(scene)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        let node = SKSpriteNode(imageNamed: imageArray[cellSelectedAt] + ".png")
        // Making the node transparent
        node.alpha = 0.5
        node.size.width = 50
        node.size.height = 50
        return node;
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

}

extension ARViewController {
    // handles deletion and other functionalities
}


extension ARViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // handles the usage of the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifCell", for: indexPath) as! GifCell
        cell.gifImageView!.loadGif(asset: ("不" + "gif"))
        cell.charName = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GifCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        cellSelectedAt = indexPath.row
        scene.displayImage()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GifCell
        cell.layer.borderWidth = 0
        scene.removeAllChildren()
    }
}
