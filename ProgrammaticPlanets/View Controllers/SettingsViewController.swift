//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        setUpSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }

    func setUpSubviews(){
        //MARK: Create Button
        
        let doneButton = UIButton(type: .system)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        //target: class where button is run
        //action: pass method to be run when action is triggered
        //for: type of event that will trigger the action
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        //MARK: Add Button to Subview
        
        self.view.addSubview(doneButton)
        
        //MARK: Add Constraints
        
        let doneButtonTopConstraint = NSLayoutConstraint(item: doneButton,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        let doneButtonTrailingConstraint = NSLayoutConstraint(item: doneButton,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: view.safeAreaLayoutGuide,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: -20)
        
        //MARK: Activate Constraints
        
        NSLayoutConstraint.activate([doneButtonTopConstraint, doneButtonTrailingConstraint])
        
        //MARK: Create Switch
            
        let shouldShowPlutoSwitch = UISwitch()
        
        //MARK: Turn Autoresizing Off
        
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Add Target
        
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto(_:)), for: .valueChanged)
        
        //MARK: Add Switch to Subview
        
        self.view.addSubview(shouldShowPlutoSwitch)
        
        //MARK: Add Constraints
        
        let switchTopConstraint = shouldShowPlutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 60)
        let switchTrailingConstraint = shouldShowPlutoSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        //MARK: Activate Constraints
        
        switchTopConstraint.isActive = true
        switchTrailingConstraint.isActive = true
        
        
        //MARK: Assign Switch Value to Switch Property
        
        self.shouldShowPlutoSwitch = shouldShowPlutoSwitch
        
        //Label
        
        //MARK: Create Label
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Is Pluto a planet?"
        
        view.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: shouldShowPlutoSwitch.leadingAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor).isActive = true
        
        
    }
    // MARK: - Action Handlers
    
    @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
//        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
