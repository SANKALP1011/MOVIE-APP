//
//  MainViewController.swift
//  MOVIE APP
//
//  Created by Sankalp Pandey on 18/07/21.
//

import Foundation
import UIKit
import Lottie
class MainViewController: UIViewController{
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        updtaeUI()
    }
    
// MARK:- UI UPDATE.
    
    func updtaeUI(){
        
        animationView.layer.cornerRadius = 30
        animationView.layer.shadowOpacity = 0.5
        animationView.layer.shadowColor = UIColor.white.cgColor
        animationView.layer.shadowRadius = 20
        animationView.layer.shadowOffset = .zero
        
        startView.layer.cornerRadius = 30
        startView.layer.shadowOpacity = 0.5
        startView.layer.shadowColor = UIColor.white.cgColor
        startView.layer.shadowRadius = 20
        startView.layer.shadowOffset = .zero
        
        buttonView.layer.cornerRadius = 30
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowColor = UIColor.white.cgColor
        buttonView.layer.shadowRadius = 10
        buttonView.layer.shadowOffset = .zero
        
        
        lottieAnimation()

    }
    
    // MARK:- LOTTIE ANIMATION
    
    func lottieAnimation(){
        let animationView = Lottie.AnimationView(name: "Movie")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(animationView)
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        animationView.center = self.view.center
        animationView.contentMode = .scaleToFill
        
        animationView.play()
        animationView.loopMode = .loop
    }
    
    // MARK:- BUTTON
    
    @IBAction func movieButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMovie", sender: self)
    }
    
}
