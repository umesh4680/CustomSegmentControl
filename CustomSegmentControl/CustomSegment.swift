//
//  CustomSegment.swift
//  CustomSegmentControl
//
//  Created by Umesh on 27/07/17.
//  Copyright © 2017 Umesh. All rights reserved.
//

import UIKit

@IBDesignable

class CustomSegment: UIView {

    
    var view : UIView?
    
    var segControl : UISegmentedControl?
        
    {
        didSet{
            
            segControl?.backgroundColor = UIColor.clear
           // segControl?.tintColor = UIColor.white
            segControl?.layer.cornerRadius = 10
            

            (segControl?.subviews[0])?.tintColor = UIColor.green
            (segControl?.subviews[1])?.tintColor = UIColor.orange
            (segControl?.subviews[2])?.tintColor = UIColor.red

        }
    }
    
    
    var clearButton : UIButton?
    
    
    //MARK:- Initialization / UI Design 
    
    // 2
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    // 3
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // fatalError("init(coder:) has not been implemented")
        setUpViews()
    }
  
    // 4
    func setUpViews(){
        
        view = loadViewFromNib()
        
        if let view = view
        {
            addSubview(view)

            view.frame = bounds
    
            instantiateAllViewsWithTags()
        }
    }

    
    // 5
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    // 6
    func instantiateAllViewsWithTags() {
        
        segControl = (view?.viewWithTag(1))! as? UISegmentedControl
        clearButton = (view?.viewWithTag(2))! as? UIButton
        
        //=== Adding Action to Button
        
        segControl?.addTarget(self, action: #selector(segControlValueChanged(sender:)), for: .valueChanged)
        
        clearButton?.addTarget(self, action: #selector(clearButtonClicked(sender:)), for: .touchUpInside)
    }
    
    // MARK:-  Action Methods
    
    
    //=== Clear Segment Button Action Method
    func clearButtonClicked(sender:UIButton)  {
        segControl?.selectedSegmentIndex = -1
    }
    
    //=== Segment Selection Action Method
    func segControlValueChanged(sender:UISegmentedControl)  {
        print("\(sender.selectedSegmentIndex)")
    }
    
    
    

}
