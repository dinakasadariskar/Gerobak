
import Foundation
import UIKit
import PlaygroundSupport

public class Intro: UIView {
    var playButton = UIButton()
    
    var introTitle = UILabel()
    var introDesc = UILabel()
    
    var gerobakIntro = UIView()
    
    var backgroundImg = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    func setup() {
        backgroundImg.image = UIImage(named: "44771.jpg")
        backgroundImg.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.clipsToBounds = true
        backgroundImg.alpha = 0.5
        self.addSubview(backgroundImg)
        
        gerobakIntro.frame = CGRect(x: 240, y: 225, width: 28, height: 28)
        gerobakIntro.backgroundColor = UIColor.white
        addSubview(gerobakIntro)
        
        playButton.setTitle("Play", for: .normal)
        playButton.backgroundColor = UIColor.white
        playButton.setTitleColor(UIColor.black, for: .normal)
        playButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 400, y: UIScreen.main.bounds.height/2 + 300, width: 300, height: 100)
        playButton.titleLabel?.font = UIFont(name: "Arial", size: 50)
        playButton.layer.cornerRadius = 10
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        self.addSubview(playButton)
    }
    
    @objc func playButtonPressed(sender: UIButton) {
        self.removeFromSuperview()
        playButton()
//        shoppingList()
        gameScene()
    }
}

public func introPage() {
    PlaygroundPage.current.liveView = Intro(scene: UIView())
}
