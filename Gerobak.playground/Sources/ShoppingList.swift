

import Foundation
import UIKit
import PlaygroundSupport

public class ShoppingList: UIView {
    var goButton = UIButton()
    
    var shoppingListView = UIView()
    
    var backgroundImg = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundImg.image = UIImage(named: "44771.jpg")
        backgroundImg.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.clipsToBounds = true
        backgroundImg.alpha = 0.5
        self.addSubview(backgroundImg)
        
        shoppingListView.frame = CGRect(x: 150, y: 100, width: UIScreen.main.bounds.width - 650, height: UIScreen.main.bounds.height - 250)
        shoppingListView.backgroundColor = UIColor.white
        shoppingListView.layer.cornerRadius = 10
        addSubview(shoppingListView)
        
        goButton.setTitle("Go", for: .normal)
        goButton.backgroundColor = UIColor.white
        goButton.setTitleColor(UIColor.black, for: .normal)
        goButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 600, y: UIScreen.main.bounds.height/2 + 300, width: 100, height: 100)
        goButton.titleLabel?.font = UIFont(name: "Arial", size: 50)
        goButton.layer.cornerRadius = 10
        goButton.addTarget(self, action: #selector(goButtonPressed), for: .touchUpInside)
        self.addSubview(goButton)
    }
    
    @objc func goButtonPressed(sender: UIButton) {
        self.removeFromSuperview()
        playButton()
        gameScene()
    }
}

public func shoppingList() {
    PlaygroundPage.current.liveView = ShoppingList(scene: UIView())
}
