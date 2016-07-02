//
//  ViewController.swift
//  Knocking Buddy
//
//  Created by Tom Busath on 6/11/16.
//  Copyright © 2016 TomBusath. All rights reserved.
//

import UIKit
import CoreLocation



var timer = NSTimer()
var sales = 0
var salesGoal = 4
var timeWorkedInHoursDouble = 0.00
var timeWorkedGoal = 0.25
var doughnutWidth = 150
var doorsKnockedGoal = 200
var doorsKnocked = 0
var distanceWalked = 0.00
var distanceWalkedGoal = 2.25
var accumulatedTimeInSeconds = 0
var second = 0.0





class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!

    
    var salesInfo: [String: Array<String>] = [:]
    var daysInfo: [String: Array<Int>] = [:] // [Distance, Hours, Sales, Doors]
    
    
    @IBOutlet weak var doorsKnockedBox: UILabel!
    @IBOutlet weak var distanceWalkedBox: UILabel!
    @IBOutlet weak var timeWorkedBox: UILabel!
    @IBOutlet weak var salesBox: UILabel!
    @IBOutlet weak var numberOfSalesLabel: UILabel!
    @IBOutlet weak var salesGoalNumber: UILabel!
    @IBOutlet weak var minusOneSale: UIButton!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var updatingSymbol: UIImageView!
    
    @IBOutlet weak var timeWorkedLabel: UILabel!
    @IBOutlet weak var timeWorkedGoalNumber: UILabel!
    
    @IBOutlet weak var doorsKnockedLabel: UILabel!
    @IBOutlet weak var doorsKnockedGoalNumber: UILabel!
    
    @IBOutlet weak var distanceWalkedLabel: UILabel!
    @IBOutlet weak var distanceWalkedGoalNumber: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    
    
    
    //--------------Location stuff---------------------
    
    
    func locationManager(manager: CLLocationManager!,
                         didUpdateLocations locations: [CLLocation]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        var latitude = String(format: "%.4f",
                              latestLocation.coordinate.latitude)
        var longitude = String(format: "%.4f",
                               latestLocation.coordinate.longitude)
        var horizontalAccuracy = String(format: "%.4f",
                                        latestLocation.horizontalAccuracy)
        var altitude = String(format: "%.4f",
                              latestLocation.altitude)
        var verticalAccuracy = String(format: "%.4f",
                                      latestLocation.verticalAccuracy)
        
        
        if startLocation == nil {
            startLocation = latestLocation as! CLLocation
        }
        
        var distanceBetween: CLLocationDistance =
            latestLocation.distanceFromLocation(startLocation)
        
        var distance = String(format: "%.2f", distanceBetween)
        
        milesLabel.text = distance
        
        
        print(latestLocation)
        print(latitude)
        print(longitude)
        
    }
    
    func locationManager(manager: CLLocationManager!,
                         didFailWithError error: NSError!) {
        
    }
    
    
    
    
    //---------------------Circle graphs------------------------
    
    
    
    
    
    
    
    
    
    //----Doors Knocked--------
    
    class DoorsKnockedCircleViewBackground: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
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
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!

            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = CGFloat(doorsKnocked/doorsKnockedGoal)
            
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
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
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
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 0/255, green: 157/255, blue: 167/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially
            circleLayer.strokeEnd = CGFloat(sales/salesGoal)
            
            
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

    
    

    //----Time Worked--------
    
    class TimeWorkedCircleViewBackground: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
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
    
    
    func addTimeWorkedCircleViewBackground() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = TimeWorkedCircleViewBackground(frame: CGRectMake((timeWorkedBox.frame.origin.x + 5), (timeWorkedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    
    
    
    
    class TimeWorkedCircleView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially - I need to figure out where to put things
            circleLayer.strokeEnd = CGFloat(timeWorkedInHoursDouble/timeWorkedGoal)
            
            
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }
        
    }
    
    
    func addTimeWorkedCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = TimeWorkedCircleView(frame: CGRectMake((timeWorkedBox.frame.origin.x + 5), (timeWorkedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    

    

    
    
    //----DistanceWalked--------
    
    class DistanceWalkedCircleViewBackground: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
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
    
    
    func addDistanceWalkedCircleViewBackground() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = DistanceWalkedCircleViewBackground(frame: CGRectMake((distanceWalkedBox.frame.origin.x + 5), (distanceWalkedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }
    
    
    
    
    
    
    class DistanceWalkedCircleView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
            
            // Use UIBezierPath as an easy way to create the CGPath for the layer.
            // The path should be the entire circle.
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat((M_PI * 2.0) - M_PI_2), clockwise: true)
            
            // Setup the CAShapeLayer with the path, colors, and line width
            
            let circleLayer: CAShapeLayer!
            
            
            circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.strokeColor = UIColor(red: 28/255, green: 117/255, blue: 188/255, alpha: 1.0).CGColor
            circleLayer.lineWidth = 5.0;
            
            // Don't draw the circle initially - I need to figure out where to put things
            circleLayer.strokeEnd = CGFloat(distanceWalked/distanceWalkedGoal)
            
            // Add the circleLayer to the view's layer's sublayers
            layer.addSublayer(circleLayer)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
            
            
        }
        
    }
    
    
    func addDistanceWalkedCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(200)
        let circleHeight = circleWidth
        // Create a new CircleView
        //var circleView = CircleView(frame: CGRectMake(diceRoll, 0, circleWidth, circleHeight))
        let circleView = DistanceWalkedCircleView(frame: CGRectMake((distanceWalkedBox.frame.origin.x + 5), (distanceWalkedBox.frame.origin.y + 30), CGFloat(doughnutWidth), CGFloat(doughnutWidth)))
        
        view.addSubview(circleView)
    }

    
    
    
    
    
    
    
    
    
    
    //--------------------------------------------------
    

    
    @IBAction func plusOneSale(sender: AnyObject) {
        sales += 1
        numberOfSalesLabel.text = "\(sales)"
        
        if sales >= 1 {
            minusOneSale.hidden = false
            
        }
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Month, .Year, .Day, .Hour, .Minute, .Second], fromDate: date)
        let day = components.day
        let year = components.year
        let month = components.month
        let hour = components.hour
        let minutes = components.minute
        let seconds = components.second
        let dateString = "\(month)\\\(day)\\\(year)"
        let timeString = "\(hour):\(minutes):\(seconds)"
        
        if salesInfo[dateString] == nil {
            var salesList: [String] = []
            salesList.append(timeString)
            salesInfo[dateString] = salesList
        }else{
            var salesList: [String] = salesInfo[dateString]!
            salesList.append(timeString)
            salesInfo[dateString] = salesList
        }
        
        printSales()
        printDaysInfo()
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
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        
        
        distanceWalkedGoalNumber.text = "\(distanceWalkedGoal)"
        doorsKnockedGoalNumber.text = "\(doorsKnockedGoal)"
        timeWorkedGoalNumber.text = "\(timeWorkedGoal)"
        salesGoalNumber.text = "\(salesGoal)"
        
        
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
        
        
        
       /* doughnutWidth = Int(doorsKnockedBox.frame.width) - 10
        addDoorsKnockedCircleViewBackground()
        addSalesCircleViewBackground()
        addTimeWorkedCircleViewBackground()
        addDistanceWalkedCircleViewBackground()  */

    
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //----------Nates Testing Stuff---------
    
    func printSales(){
        for (key, value) in salesInfo {
            print("\(key): \(value)")
        }
    }
    func printDaysInfo(){
        for (key, value) in daysInfo {
            print("\(key): \(value)")
        }
    }
    
    
    
    //----------Timer Stuff--------------------
    
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    
    
    func timerResults(timer: NSTimer) {
        let timerStartDate = timer.userInfo as! NSDate
        second = Double(NSDate().timeIntervalSinceDate(timerStartDate)) + Double(accumulatedTimeInSeconds)
        print(second)
        
        startLocation = nil
        
        
        
        
        doughnutWidth = Int(doorsKnockedBox.frame.width) - 10
        addDoorsKnockedCircleViewBackground()
        addDoorsKnockedCircleView()
        addSalesCircleViewBackground()
        addSalesCircleView()
        addTimeWorkedCircleViewBackground()
        addTimeWorkedCircleView()
        addDistanceWalkedCircleViewBackground()
        addDistanceWalkedCircleView()

        
        //second += 1
        
        let secondInIntForm = Int(second)
        
        let (h,m,s) = secondsToHoursMinutesSeconds(secondInIntForm)
        
        let timeWorked = second/3600.0
        
        var timeWorkedInHours = (String(format:"%.02f", timeWorked))
        timeWorkedInHoursDouble = Double(timeWorkedInHours)!
        
        doorsKnockedLabel.text = "\(doorsKnocked)"
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
        
        if doorsKnocked >= doorsKnockedGoal {
            //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            doorsKnockedBox.backgroundColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 0.2)
        }
        
        
        if doorsKnocked < doorsKnockedGoal {
            //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            doorsKnockedBox.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
        
        if distanceWalked >= distanceWalkedGoal {
            //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            distanceWalkedBox.backgroundColor = UIColor(red: 57/255, green: 181/255, blue: 74/255, alpha: 0.2)
        }
        
        
        if distanceWalked < distanceWalkedGoal {
            //salesBox.layer.borderColor = UIColor.greenColor().CGColor
            
            distanceWalkedBox.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }



    }
    
    
    //-------------------Resetting the goals----------------
    
    
    //-----Distance Walked-------
    
    @IBAction func resetDistanceWalkedGoalButton(sender: AnyObject) {
        var distanceWalkedAlert = UIAlertController(title: "Distance Walked", message: "Current Goal: \(distanceWalkedGoal) miles – Enter a new goal. (e.g. '1.75')", preferredStyle: UIAlertControllerStyle.Alert)
        
        distanceWalkedAlert.addTextFieldWithConfigurationHandler {
            (textField) in
        }
        
        distanceWalkedAlert.addAction(UIAlertAction(title: "Submit", style: .Default, handler: {
            (action) in
            
            let textW = distanceWalkedAlert.textFields![0] as UITextField
            print(textW)
            
            textW.keyboardType = UIKeyboardType.NumberPad
            
            let distanceWalkedGoalFromAlert = Double(textW.text!)
            
            
            distanceWalkedGoal = distanceWalkedGoalFromAlert!
            
            print(distanceWalkedGoal)
            self.distanceWalkedGoalNumber.text = "\(distanceWalkedGoal)"
            
        }))
        
        distanceWalkedAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
        self.presentViewController(distanceWalkedAlert, animated: true, completion: nil)
        
        

    }
    
    
    
    
    
    
    //-----Doors Knocked----
    
    
    @IBAction func resetDoorsKnockedGoalButton(sender: AnyObject) {
        var doorsKnockedAlert = UIAlertController(title: "Doors Knocked", message: "Current Goal: \(doorsKnockedGoal) doors – Enter a new goal. (e.g. '140')", preferredStyle: UIAlertControllerStyle.Alert)
        
        doorsKnockedAlert.addTextFieldWithConfigurationHandler {
            (textField) in
        }
        
        doorsKnockedAlert.addAction(UIAlertAction(title: "Submit", style: .Default, handler: {
            (action) in
            
            let textD = doorsKnockedAlert.textFields![0] as UITextField
            print(textD)
            
            textD.keyboardType = UIKeyboardType.NumberPad
            
            let doorsKnockedGoalFromAlert = Double(textD.text!)
            
            
            doorsKnockedGoal = Int(doorsKnockedGoalFromAlert!)
            
            print(doorsKnockedGoal)
            self.doorsKnockedGoalNumber.text = "\(doorsKnockedGoal)"
            
        }))
        
        doorsKnockedAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
        self.presentViewController(doorsKnockedAlert, animated: true, completion: nil)

        
        
    }
    
    
    
    
    //-----Time Worked----
    
    
    
    
    @IBAction func resetTimeWorkedGoalButton(sender: AnyObject) {
        var timeWorkedAlert = UIAlertController(title: "Time Worked", message: "Current Goal: \(timeWorkedGoal) hours – Enter a new goal. (e.g. '3.25')", preferredStyle: UIAlertControllerStyle.Alert)
        
        timeWorkedAlert.addTextFieldWithConfigurationHandler {
            (textField) in
        }
        
        timeWorkedAlert.addAction(UIAlertAction(title: "Submit", style: .Default, handler: {
            (action) in
            
            let textF = timeWorkedAlert.textFields![0] as UITextField
            print(textF)
            
            textF.keyboardType = UIKeyboardType.NumberPad
            
            let timeWorkedGoalFromAlert = Double(textF.text!)
            
            
            timeWorkedGoal = timeWorkedGoalFromAlert!
            
            print(timeWorkedGoal)
            self.timeWorkedGoalNumber.text = "\(timeWorkedGoal)"
            
        }))
        
        timeWorkedAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
        self.presentViewController(timeWorkedAlert, animated: true, completion: nil)
        
    }
    
    
    
    //----Sales------
 
    
    @IBAction func resetSalesGoalButton(sender: AnyObject) {
        
        var salesAlert = UIAlertController(title: "Sales", message: "Current Goal: \(salesGoal) sales – Enter a new goal. (e.g. '2')", preferredStyle: UIAlertControllerStyle.Alert)
        
        salesAlert.addTextFieldWithConfigurationHandler {
            (textField) in
        }
        
        salesAlert.addAction(UIAlertAction(title: "Submit", style: .Default, handler: {
            (action) in
            
            let textS = salesAlert.textFields![0] as UITextField
            print(textS)
            
            textS.keyboardType = UIKeyboardType.NumberPad
            
            let salesGoalFromAlert = Int(textS.text!)
            
            
            salesGoal = salesGoalFromAlert!
            
            print(salesGoal)
            self.salesGoalNumber.text = "\(salesGoal)"
            
            self.addSalesCircleViewBackground()
            self.addSalesCircleView()
            
        }))
        
        salesAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
        self.presentViewController(salesAlert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func startStopButton(sender: AnyObject) {

        
        var date = NSDate()
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Month, .Year, .Day, .Hour, .Minute, .Second], fromDate: date)
        let day = components.day
        let year = components.year
        let month = components.month
        let dateString = "\(month)\\\(day)\\\(year)"
        
        if updatingSymbol.hidden == true { //Start the timer
            sender.setTitle("PAUSE", forState: UIControlState.Normal)
            updatingSymbol.hidden = false
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timerResults(_:)) , userInfo: NSDate(), repeats: true)
            
            if daysInfo[dateString] == nil {
                //reset everything to 0
                // [Distance, Hours, Sales, Doors]
                let daysList: [Int] = [0,0,0,0]
                daysInfo[dateString] = daysList
            }
            
        } else { //Stop the timer
            sender.setTitle("START", forState: UIControlState.Normal)
            updatingSymbol.hidden = true
            //***stop the timer
            timer.invalidate()
            accumulatedTimeInSeconds = Int(second)
        }
    }
    
    
    
    
    
    
}