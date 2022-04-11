import SpriteKit
import UIKit
import PlaygroundSupport

public class GameScene: SKScene {
    var gerobak: SKSpriteNode!
    
    var background: SKSpriteNode!
    
    var instruction: SKLabelNode!
    
    var buyView: SKSpriteNode!
    var buyCurrentLabel: SKLabelNode!
    var currentDesc: SKLabelNode!
    var currentPic: SKSpriteNode!
    var findMoreButton: SKShapeNode!
    var findMoreLabel: SKLabelNode!
    
    var completionDesc: SKLabelNode!
    
    var bakso: SKSpriteNode!
    var sate: SKSpriteNode!
    var nasgor: SKSpriteNode!
    var cimol: SKSpriteNode!
    var mie: SKSpriteNode!
    
    var timeSinceLastSpawn = 0.0 as Double
    var spawnRate = 0 as Double
    
    var currentFoodName = "buyBakso"
    
    var gameOver = false
    
    public override func didMove(to view: SKView) {
        background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "background.png")))
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.zPosition = -15
        self.addChild(background)
        
        instruction = SKLabelNode()
        instruction.text = "Find all the food by clicking on the gerobak!"
        instruction.fontName = "Arial"
        instruction.fontSize = 30
        instruction.fontColor = UIColor.black
        instruction.position = CGPoint(x: frame.midX, y: frame.midY+325)
        self.addChild(instruction)
        
        bakso = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "buyBakso.png")), color: .clear, size: CGSize(width: 100, height: 100))
        bakso.position = CGPoint(x: frame.midX-220, y: frame.midY+200)
        bakso.alpha = 0.5
        self.addChild(bakso)
        
        sate = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "buySate.png")), color: .clear, size: CGSize(width: 100, height: 100))
        sate.position = CGPoint(x: frame.midX-110, y: frame.midY+200)
        sate.alpha = 0.5
        self.addChild(sate)
        
        nasgor = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "buyNasgor.png")), color: .clear, size: CGSize(width: 100, height: 100))
        nasgor.position = CGPoint(x: frame.midX, y: frame.midY+200)
        nasgor.alpha = 0.5
        self.addChild(nasgor)
        
        cimol = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "buyCimol.png")), color: .clear, size: CGSize(width: 100, height: 100))
        cimol.position = CGPoint(x: frame.midX+110, y: frame.midY+200)
        cimol.alpha = 0.5
        self.addChild(cimol)
        
        mie = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "buyMie.png")), color: .clear, size: CGSize(width: 100, height: 100))
        mie.position = CGPoint(x: frame.midX+220, y: frame.midY+200)
        mie.alpha = 0.5
        self.addChild(mie)
        
        //buy overlay
        buyView = SKSpriteNode(color: .black, size: CGSize(width: frame.width - 200, height: frame.height - 400))
        buyView.position = CGPoint(x: frame.midX, y: frame.midY+100)
        
        buyCurrentLabel = SKLabelNode()
        buyCurrentLabel.position = CGPoint(x: frame.midX, y: frame.midY+(frame.midY/2))
        buyCurrentLabel.fontName = "Arial"
        buyCurrentLabel.fontSize = 50
        buyCurrentLabel.fontColor = UIColor.white
        buyCurrentLabel.zPosition = 100
        
        findMoreButton = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 500, height: 100), cornerRadius: 10.0)
        findMoreButton.fillColor = UIColor.white
        findMoreButton.position = CGPoint(x: frame.midX-250, y: frame.midY-450)
        findMoreButton.isUserInteractionEnabled = true
        
        findMoreLabel = SKLabelNode()
        findMoreLabel.text = "Find More Food"
        findMoreLabel.fontColor = UIColor.black
        findMoreLabel.fontName = "ka1"
        findMoreLabel.fontSize = 50
        findMoreLabel.position = CGPoint(x: frame.midX, y: frame.midY-420)
        findMoreLabel.isUserInteractionEnabled = false

        completionDesc = SKLabelNode()
        completionDesc.text = "You have found all the food! Enjoy!"
        completionDesc.position = CGPoint(x: frame.midX, y: frame.midY)
        completionDesc.fontName = "Arial"
        completionDesc.fontSize = 50
        completionDesc.fontColor = UIColor.green
        completionDesc.zPosition = 50
                             
        physicsWorld.gravity = .zero
    }
    
    func createGerobak() {
        let gerobakTextures = ["mie", "bakso", "nasgor","cimol","sate"]
        var randGerobakTexture = gerobakTextures.randomElement()!
        let gerobakTexture = SKTexture(imageNamed: randGerobakTexture)
        
        if randGerobakTexture == "mie" {
            buyCurrentLabel.text = "You have found: Mie"
            
            currentFoodName = "buyMie"
            currentPic = SKSpriteNode(texture: SKTexture(imageNamed: currentFoodName), color: .clear, size: CGSize(width: 400, height: 400))
            currentPic.position = CGPoint(x: frame.midX-400, y: frame.midY+50)
            
            currentDesc = SKLabelNode()
            currentDesc.text = "There's a lot of Mie (noodles) dishes in Indonesia. Some of the most well-known dishes are Mie Ayam (noodles with spiced chicken) and Mie Goreng (fried noodles with eggs, spices, and meat). Gerobak that sells Mie usually open during lunch and can be found walking around neighborhoods or stopping by sidewalks."
            currentDesc.fontName = "Arial"
            currentDesc.fontSize = 30
            currentDesc.fontColor = UIColor.white
            currentDesc.numberOfLines = 6
            currentDesc.preferredMaxLayoutWidth = 700
            currentDesc.position = CGPoint(x: frame.midX+300, y: frame.midY-75)
            
        } else if randGerobakTexture == "bakso" {
            buyCurrentLabel.text = "You have found: Bakso"
            
            currentFoodName = "buyBakso"
            currentPic = SKSpriteNode(texture: SKTexture(imageNamed: currentFoodName), color: .clear, size: CGSize(width: 400, height: 400))
            currentPic.position = CGPoint(x: frame.midX-400, y: frame.midY+50)
            
            currentDesc = SKLabelNode()
            currentDesc.text = "Bakso or meatballs is an Indonesian dish boiled in broth and usually served with Pangsit (dumplings), tofu, and noodles. This dish is commonly found sold in Gerobak. Gerobak that sells Bakso usually open during lunch and can be found walking around neighborhoods or stopping by sidewalks."
            currentDesc.fontName = "Arial"
            currentDesc.fontSize = 30
            currentDesc.fontColor = UIColor.white
            currentDesc.numberOfLines = 6
            currentDesc.preferredMaxLayoutWidth = 700
            currentDesc.position = CGPoint(x: frame.midX+300, y: frame.midY-75)
            
        } else if randGerobakTexture == "nasgor" {
            buyCurrentLabel.text = "You have found: Nasgor"
            
            currentFoodName = "buyNasgor"
            currentPic = SKSpriteNode(texture: SKTexture(imageNamed: currentFoodName), color: .clear, size: CGSize(width: 400, height: 400))
            currentPic.position = CGPoint(x: frame.midX-400, y: frame.midY+50)
            
            currentDesc = SKLabelNode()
            currentDesc.text = "Nasgor or Nasi Goreng is an Indonesian fried rice dish usually cooked with eggs, spices, proteins of your choice, and Kerupuk (crisps). Gerobak that sells Nasgor usually open at night and can be found walking around neighborhoods or stopping by sidewalks."
            currentDesc.fontName = "Arial"
            currentDesc.fontSize = 30
            currentDesc.fontColor = UIColor.white
            currentDesc.numberOfLines = 6
            currentDesc.preferredMaxLayoutWidth = 700
            currentDesc.position = CGPoint(x: frame.midX+300, y: frame.midY-75)
            
        } else if randGerobakTexture == "cimol" {
            buyCurrentLabel.text = "You have found: Cimol"
            
            currentFoodName = "buyCimol"
            currentPic = SKSpriteNode(texture: SKTexture(imageNamed: currentFoodName), color: .clear, size: CGSize(width: 400, height: 400))
            currentPic.position = CGPoint(x: frame.midX-400, y: frame.midY+50)
            
            currentDesc = SKLabelNode()
            currentDesc.text = "Cimol is a chewy, savory snack made with starch flour, fried, and sprinkled with seasonings. This dish is commonly found sold in Gerobak. Gerobak that sells Cimol open from brunch until afternoon and can be found walking around neighborhoods or stopping by sidewalks."
            currentDesc.fontName = "Arial"
            currentDesc.fontSize = 30
            currentDesc.fontColor = UIColor.white
            currentDesc.numberOfLines = 6
            currentDesc.preferredMaxLayoutWidth = 700
            currentDesc.position = CGPoint(x: frame.midX+300, y: frame.midY-75)
            
        } else if randGerobakTexture == "sate" {
            buyCurrentLabel.text = "You have found: Sate"
            
            currentFoodName = "buySate"
            currentPic = SKSpriteNode(texture: SKTexture(imageNamed: currentFoodName), color: .clear, size: CGSize(width: 400, height: 400))
            currentPic.position = CGPoint(x: frame.midX-400, y: frame.midY+50)
            
            currentDesc = SKLabelNode()
            currentDesc.text = "Sate or satay is an Indonesian dish made with meat (can be chicken, beef, or goat), usually served with Lontong (rice cake) and peanut sauce. Gerobak that sells Sate open at night and can be found walking around neighborhoods or stopping by sidewalks."
            currentDesc.fontName = "Arial"
            currentDesc.fontSize = 30
            currentDesc.fontColor = UIColor.white
            currentDesc.numberOfLines = 6
            currentDesc.preferredMaxLayoutWidth = 700
            currentDesc.position = CGPoint(x: frame.midX+300, y: frame.midY-75)
            
        }
        
        gerobakTexture.filteringMode = .nearest
        
        gerobak = SKSpriteNode(texture: gerobakTexture)
        gerobak.setScale(0.5)
        gerobak.zPosition = 100
        self.addChild(gerobak)
        
        animateGerobak(sprite: gerobak, textureWidth: 1.0)
    }
    
    func animateGerobak(sprite: SKSpriteNode, textureWidth: CGFloat) {
        let screenWidth = self.frame.size.width
        let screenHeight = self.frame.size.height
        
        let distanceOffscreen = 100.0 as CGFloat
        
        let moveGerobak = SKAction.moveTo(x: 0 - sprite.size.width, duration: TimeInterval(screenWidth / CGFloat.random(in: 400 ..< 500)))
        let resetGerobak = SKAction.removeFromParent()
        let gerobakLoop = SKAction.sequence([moveGerobak, resetGerobak])
        
        sprite.position = CGPoint(x: screenWidth + distanceOffscreen + sprite.size.width, y: screenHeight/2.3)
        sprite.run(SKAction.repeatForever(gerobakLoop))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if(currentTime - timeSinceLastSpawn > spawnRate){
            timeSinceLastSpawn = currentTime
            spawnRate = Double.random(in: 3.0 ..< 5.0)
            createGerobak()
        }
    }
    
    func buyPaused() {
        self.addChild(buyView)
        self.addChild(buyCurrentLabel)
        self.addChild(currentDesc)
        self.addChild(currentPic)
        self.addChild(findMoreButton)
        self.addChild(findMoreLabel)
        
        if buyCurrentLabel.text == "You have found: Bakso" {
            bakso.alpha = 1.0
        } else if buyCurrentLabel.text == "You have found: Mie"{
            mie.alpha = 1.0
        } else if buyCurrentLabel.text == "You have found: Sate" {
            sate.alpha = 1.0
        } else if buyCurrentLabel.text == "You have found: Nasgor" {
            nasgor.alpha = 1.0
        } else if buyCurrentLabel.text == "You have found: Cimol" {
            cimol.alpha = 1.0
        }
        
        background.alpha = 0.5
        gerobak.removeFromParent()
        instruction.isHidden = true
        self.isPaused = true
    }
    
    func buyUnpaused() {
        buyView.removeFromParent()
        buyCurrentLabel.removeFromParent()
        currentDesc.removeFromParent()
        currentPic.removeFromParent()
        findMoreButton.removeFromParent()
        findMoreLabel.removeFromParent()
        background.alpha = 1.0
        gerobak.alpha = 1.0
        instruction.isHidden = false
    }
    
    func gameCompleted() {
        self.addChild(completionDesc)
        
        background.alpha = 0.5
        gerobak.removeFromParent()
        instruction.isHidden = true
        self.isPaused = true
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard !gameOver else {
            return
        }
        for touch: AnyObject in touches {
            let pointTouched = touch.location(in: self)
            
            if gerobak.contains(pointTouched) && !findMoreButton.contains(pointTouched) {
                buyPaused()
            }
            
            if findMoreButton.contains(pointTouched) && !gerobak.contains(pointTouched){
                buyUnpaused()
                if (bakso.alpha == 1.0 && sate.alpha == 1.0 && nasgor.alpha == 1.0 && cimol.alpha == 1.0 && mie.alpha == 1.0) {
                    gameOver = true
                    gameCompleted()
                } else {
                    self.isPaused = false
                }
            }
        }
    }
    
}

public func gameScene() {
    let skView = SKView(frame: .zero)
    
    let gameScene = GameScene(size: UIScreen.main.bounds.size)
    gameScene.scaleMode = .aspectFit
    skView.presentScene(gameScene)
    skView.preferredFramesPerSecond = 60
    
    PlaygroundPage.current.liveView = skView
    PlaygroundPage.current.wantsFullScreenLiveView = true
}
