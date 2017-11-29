//
//  DetailedColorViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/17/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.

/* A UILabel to show the name of the selected Crayon
A background color that starts as the same color as the selected Crayon.
A UISlider and UILabel that represents the current red value
A UISlider and UILabel that represents the current green value
A UISlider and UILabel that represents the current blue value
A UIStepper and UILabel that represents the current alpha
A reset UIButton that sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.*/


import UIKit

class DetailedColorViewController: UIViewController {
    
    //MARK: -  Configuration
    
    var crayon: Crayon?
    var color: (red: Double, green: Double, blue: Double, alpha: Double) = (red: 1, green: 1, blue: 1, alpha: 1)
    
    // MARK: - Outlets
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var colorStepper: UIStepper!
    @IBAction func resetButton(_ sender: UIButton) {
        //reload()
        viewDidLoad()
    }

    @IBAction func redSlider(_ sender: UISlider) {
        color.red = Double(sender.value)
        redLabel.text = "Red: \(color.red)"
        setBackgroundColor()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        color.blue = Double(sender.value)
        blueLabel.text = "Blue: \(color.blue)"
        setBackgroundColor()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        color.green = Double(sender.value)
        greenLabel.text = "Green: \(color.green)"
        setBackgroundColor()
    }
    
   @IBAction func colorStepper(_ sender: UIStepper) {
    color.alpha = sender.value
    alphaLabel.text = "Alpha: \(color.alpha)"
    setBackgroundColor()

  }

//
    //MARK: - Instance Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("What is going on?????")
        guard let crayon = crayon else {
            return
        }
        self.color = (red: crayon.red/255, green: crayon.green/255, blue: crayon.blue/255, alpha: 1)
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat((crayon.blue/255)), alpha: 1)
        self.colorNameLabel.text = crayon.name
        self.redLabel.text = "Red: \(crayon.red/255)"
        self.greenLabel.text = "Green: \(crayon.green/255)"
        self.blueLabel.text = "Blue: \(crayon.blue/255)"
        self.redSlider.value = Float(crayon.red/255)
        self.blueSlider.value = Float(crayon.blue/255)
        self.greenSlider.value = Float(crayon.green/255)
        self.alphaLabel.text = "Alpha: 1"
        self.colorStepper.value = 1
    }
    //MARK: - Set Background color 
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha))
        
    }
        
}

