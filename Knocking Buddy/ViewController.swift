//
//  ViewController.swift
//  Knocking Buddy
//
//  Created by Tom Busath on 6/11/16.
//  Copyright © 2016 TomBusath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var sales = 0
    var salesGoal = 2
    var timeWorkedGoal = 0.01
    var doughnutWidth = 150
    var salesComparedToGoal = 0.33
    var doorsComparedToGoal = 0.06
    
    
    
    
    
    @IBOutlet weak var doorsKnockedBox: UILabel!
    @IBOutlet weak var distanceWalkedBox: UILabel!
    @IBOutlet weak var timeWorkedBox: UILabel!
    @IBOutlet weak var salesBox: UILabel!
    @IBOutlet weak var numberOfSalesLabel: UILabel!
    @IBOutlet weak var minusOneSale: UIButton!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var updatingSymbol: UIImageView!
    
    @IBOutlet weak var timeWorkedLabel: UILabel!
    @IBOutlet weak var timeWorkedGoalNumber: UILabel!
    
    
    
    
    
    
    
    
    
    //---------------------Circle graphs------------------------
    
    
    
    
    
    
    
    
    
    //----Doors Knocked--------
    
    class DoorsKnockedCircleViewBackground: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -1.5, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = 1.0
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }
        
    }
    
    
    func addDoorsKnockedCircleViewBackground() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = DoorsKnockedCircleViewBackground(frame: CGRectMake((doorsKnockedBox.frame.origin.x + 5), (doorsKnockedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    
    
    
    
    class DoorsKnockedCircleView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -1.5, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!

            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = 0.3
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }

    }
    
    
    func addDoorsKnockedCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = DoorsKnockedCircleView(frame: CGRectMake((doorsKnockedBox.frame.origin.x + 5), (doorsKnockedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    
    
    //-----Sales--------
    
    
    class salesCircleViewBackground: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -1.5, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = 1.0
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }
        
    }
    
    
    func addSalesCircleViewBackground() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = salesCircleViewBackground(frame: CGRectMake((salesBox.frame.origin.x + 5), (salesBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    
    
    
    
    class salesCircleView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -1.5, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 0/255, green: 157/255, blue: 167/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = 0.2
            
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }
        
    }
    
    
    func addSalesCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = salesCircleView(frame: CGRectMake((salesBox.frame.origin.x + 5), (salesBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }

    
    


    
    
    
    
    
    
    
    
    
    
    
    
    
    //--------------------------------------------------
    

    
    @IBAction func plusOneSale(sender: AnyObject) {
        sales += 1
        numberOfSalesLabel.text = "\(sales)"
        
        if sales >= 1 {
            minusOneSale.hidden = false
        }
        
    
    }
    
    @IBAction func minusOneSale(sender: AnyObject) {
        sales = sales - 1
        numberOfSalesLabel.text = "\(sales)"
        
        if sales == 0 {
            minusOneSale.hidden = true
        }
        
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        doorsKnockedBox.layer.borderWidth = 0.5
        doorsKnockedBox.layer.borderColor = UIColor.lightGrayColor().CGColor
        doorsKnockedBox.layer.cornerRadius = 2
        
        salesBox.layer.borderWidth = 0.5
        salesBox.layer.borderColor = UIColor.lightGrayColor().CGColor
        salesBox.layer.cornerRadius = 2
        
        timeWorkedBox.layer.borderWidth = 0.5
        timeWorkedBox.layer.borderColor = UIColor.lightGrayColor().CGColor
        timeWorkedBox.layer.cornerRadius = 2
        
        distanceWalkedBox.layer.borderWidth = 0.5
        distanceWalkedBox.layer.borderColor = UIColor.lightGrayColor().CGColor
        distanceWalkedBox.layer.cornerRadius = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //----------Timer Stuff--------------------
    
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    
    
    func timerResults(timer: NSTimer) {
        let timerStartDate = timer.userInfo as! NSDate
        let second = Double(NSDate().timeIntervalSinceDate(timerStartDate))
        print(second)
        
        
        doughnutWidth = Int(doorsKnockedBox.frame.width) - 10
        addDoorsKnockedCircleViewBackground()
        addDoorsKnockedCircleView()
        addSalesCircleViewBackground()
        addSalesCircleView()

        
        //second += 1
        
        let secondInIntForm = Int(second)
        
        let (h,m,s) = secondsToHoursMinutesSeconds(secondInIntForm)
        
        let timeWorked = second/3600.0
        
        let timeWorkedInHours = (String(format:"%.02f", timeWorked))
        
        timeWorkedLabel.text = "\(timeWorkedInHours)"
        
        if m == 0 || m == 1 || m == 2 {
            // do something
            var m = (String(format: "%02d", m))
        }
        
        //getting the second hand to always show two numbers
        if s == 0 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 1 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 2 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 3 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 4 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 5 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 6 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 7 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 8 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else if s == 9 {
            timerLabel.text = "\(h)h \(m)m 0\(s)s"
        } else {
            timerLabel.text = "\(h)h \(m)m \(s)s"
        }
        
        
        
        //-------------When you've hit your goal!---------------
        
        if timeWorked >= timeWorkedGoal {
            //timeWorkedBox.layer.borderColor = UIColor.greenColor().CGColor
            
            timeWorkedBox.backgroundColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 0.2)
        }
        
        if sales >= salesGoal {
        //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            salesBox.backgroundColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 0.2)
        }
        
        
        if sales < salesGoal {
            //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            salesBox.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }


    }
    
    
    @IBAction func startStopButton(sender: AnyObject) {

        
        var date = NSDate()
        
        
        if updatingSymbol.hidden == true { //Start the timer
            sender.setTitle("STOP", forState: UIControlState.Normal)
            updatingSymbol.hidden = false
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timerResults(_:)) , userInfo: NSDate(), repeats: true)
            
        } else { //Stop the timer
            sender.setTitle("START", forState: UIControlState.Normal)
            updatingSymbol.hidden = true
            //***stop the timer
            timer.invalidate()
        }
    }
    
    

    
    
    
    

}