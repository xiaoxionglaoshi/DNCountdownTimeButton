//
//  DNCountdownTimeButton.swift
//  DNCountdownTimeButton
//
//  Created by mainone on 16/10/25.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class DNCountdownTimeButton: UIButton {

    // 设置初始属性
    open var maxSecond = 60
    open var countdown = false {
        didSet {
            if oldValue != countdown {
                countdown ? startCountdown() : stopCountdown()
            }
        }
    }
    
    fileprivate var second = 0
    fileprivate var timer: Timer?
    fileprivate var timeLabel: UILabel!
    fileprivate var normalText: String!
    fileprivate var normalTextColor: UIColor!
    fileprivate var disabledText: String!
    fileprivate var disabledTextColor: UIColor!
    
    deinit {
        countdown = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }
    
    fileprivate func setupLabel() {
        normalText = title(for: UIControlState())!
        disabledText = title(for: .disabled)!
        normalTextColor = titleColor(for: UIControlState())!
        disabledTextColor = titleColor(for: .disabled)!
        setTitle("", for: UIControlState())
        setTitle("", for: .disabled)
        timeLabel = UILabel(frame: bounds)
        timeLabel.textAlignment = .center
        timeLabel.font = titleLabel?.font
        timeLabel.textColor = normalTextColor
        timeLabel.text = normalText
        addSubview(timeLabel)
        self.backgroundColor = UIColor.orange
    }
    
    fileprivate func startCountdown() {
        second = maxSecond
        updateDisabled()
        
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        self.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    fileprivate func stopCountdown() {
        timer?.invalidate()
        timer = nil
        updateNormal()
    }
    
    fileprivate func updateNormal() {
        isEnabled = true
        timeLabel.textColor = normalTextColor
        timeLabel.text = "重新获取验证码"
        self.backgroundColor = UIColor.orange
    }
    
    fileprivate func updateDisabled() {
        isEnabled = false
        timeLabel.textColor = disabledTextColor
        timeLabel.text = disabledText.replacingOccurrences(of: "second", with: "\(second)", options: .literal, range: nil)
    }
    
    @objc fileprivate func updateCountdown() {
        second -= 1
        if second <= 0 {
            countdown = false
        } else {
            updateDisabled()
        }
    }

}
