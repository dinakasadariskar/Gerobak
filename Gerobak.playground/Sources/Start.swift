
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import PlaygroundSupport

public class Start: UIView {
    
    var startButton = UIButton()
    var startTitle = UILabel()
    
    var titleContainer = UIView()
    var backgroundImg = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        playFullBgm()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setup(){
        backgroundImg.image = UIImage(named: "44771.jpg")
        backgroundImg.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.clipsToBounds = true
        backgroundImg.alpha = 1
        self.addSubview(backgroundImg)
        
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.white
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: UIScreen.main.bounds.height/2 - 200, width: 300, height: 100)
        startButton.titleLabel?.font = UIFont(name: "Arial", size: 50)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        self.addSubview(startButton)
        
        startTitle.text = "Gerobak"
        startTitle.frame = CGRect(x: UIScreen.main.bounds.width/2 - 145, y: UIScreen.main.bounds.height/2 - 400, width: 500, height: 100)
        startTitle.textColor = UIColor.black
        startTitle.font = UIFont(name: "Arial", size: 100)
        self.addSubview(startTitle)
    }
    
    @objc func startButtonPressed(sender: UIButton) {
        self.removeFromSuperview()
        playButton()
        introPage()
    }

}

public func startPage() {
    PlaygroundPage.current.liveView = Start(scene: UIView())
}
