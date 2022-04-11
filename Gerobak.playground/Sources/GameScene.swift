
import SpriteKit
import UIKit
import PlaygroundSupport

public class GameScene: SKScene {
//    bakso, sate, nasgor, cimol, mie, cincau
    
    var gerobak: SKSpriteNode!
    
    var background: SKSpriteNode!
    
    var instruction: SKLabelNode!
    
    var buyView: SKShapeNode!
    var buyCurrentLabel: SKLabelNode!
    var findMoreButton: SKShapeNode!
    var findMoreLabel: SKLabelNode!
    
    var playAgainButton: SKShapeNode!
    var completionDesc: SKLabelNode!
    var completionLabel: SKLabelNode!
    
    var bakso: SKSpriteNode!
    var sate: SKSpriteNode!
    var nasgor: SKSpriteNode!
    var cimol: SKSpriteNode!
    var mie: SKSpriteNode!
    var cincau: SKSpriteNode!
    
    var timeSinceLastSpawn = 0.0 as Double
    var spawnRate = 0 as Double
    
    public override func didMove(to view: SKView) {
        background = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "44771.jpg")))
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: frame.width, height: frame.height)
        background.zPosition = -15
        self.addChild(background)
        
        instruction = SKLabelNode()
        instruction.text = "Find all the food by clicking on the gerobak!"
        instruction.fontName = "Arial"
        instruction.fontSize = 30
        instruction.fontColor = UIColor.black
        instruction.position = CGPoint(x: frame.midX, y: frame.midY+325)
        self.addChild(instruction)
        
        bakso = SKSpriteNode(color: .blue, size: CGSize(width: 70, height: 70))
        bakso.position = CGPoint(x: frame.midX-200, y: frame.midY+250)
        bakso.alpha = 0.5
        self.addChild(bakso)
        
        sate = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "chickSad.png")), color: .clear, size: CGSize(width: 70, height: 70))
        sate.position = CGPoint(x: frame.midX-120, y: frame.midY+250)
        sate.alpha = 0.5
        self.addChild(sate)
        
        nasgor = SKSpriteNode(color: .darkGray, size: CGSize(width: 70, height: 70))
        nasgor.position = CGPoint(x: frame.midX-40, y: frame.midY+250)
        nasgor.alpha = 0.5
        self.addChild(nasgor)
        
        cimol = SKSpriteNode(color: .cyan, size: CGSize(width: 70, height: 70))
        cimol.position = CGPoint(x: frame.midX+40, y: frame.midY+250)
        cimol.alpha = 0.5
        self.addChild(cimol)
        
        mie = SKSpriteNode(color: .green, size: CGSize(width: 70, height: 70))
        mie.position = CGPoint(x: frame.midX+120, y: frame.midY+250)
        mie.alpha = 0.5
        self.addChild(mie)
        
        cincau = SKSpriteNode(color: .magenta, size: CGSize(width: 70, height: 70))
        cincau.position = CGPoint(x: frame.midX+200, y: frame.midY+250)
        cincau.alpha = 0.5
        self.addChild(cincau)
        
        //buy overlay
        buyView = SKShapeNode(rect: CGRect(x: 0, y: 0, width: frame.width - 200, height: frame.height - 500), cornerRadius: 10.0)
        buyView.position = CGPoint(x: frame.midX-((frame.width-200)/2), y: frame.midY-200)
        buyView.fillColor = .white
//        self.addChild(buyView)
//        buyView.isHidden = true
        
        buyCurrentLabel = SKLabelNode()
        buyCurrentLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        buyCurrentLabel.fontName = "Arial"
        buyCurrentLabel.fontSize = 50
        buyCurrentLabel.fontColor = UIColor.black
        buyCurrentLabel.zPosition = 100
//        self.addChild(buyCurrentLabel)
//        buyCurrentLabel.isHidden = true
        
        findMoreButton = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 500, height: 100), cornerRadius: 10.0)
        findMoreButton.fillColor = UIColor.white
        findMoreButton.position = CGPoint(x: frame.midX-250, y: frame.midY-400)
//        self.addChild(findMoreButton)
//        findMoreButton.isHidden = true
        
        findMoreLabel = SKLabelNode()
        findMoreLabel.text = "Find More Food"
        findMoreLabel.fontColor = UIColor.black
        findMoreLabel.fontName = "Arial"
        findMoreLabel.fontSize = 50
        findMoreLabel.position = CGPoint(x: frame.midX, y: frame.midY-370)
//        self.addChild(findMoreLabel)
        findMoreLabel.isUserInteractionEnabled = false
//        findMoreLabel.isHidden = true
        
        completionDesc = SKLabelNode()
        completionDesc.text = "You have found all the food!"
        completionDesc.position = CGPoint(x: frame.midX, y: frame.midY)
        completionDesc.fontName = "Arial"
        completionDesc.fontSize = 50
        completionDesc.fontColor = UIColor.black
        completionDesc.zPosition = 100
//        self.addChild(completionDesc)
//        completionDesc.isHidden = true
        
        playAgainButton = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 500, height: 100), cornerRadius: 10.0)
        playAgainButton.fillColor = UIColor.white
        playAgainButton.position = CGPoint(x: frame.midX-250, y: frame.midY-400)
//        self.addChild(playAgainButton)
//        playAgainButton.isHidden = true
        
        completionLabel = SKLabelNode()
        completionLabel.text = "Play Again!"
        completionLabel.fontColor = UIColor.black
        completionLabel.fontName = "Arial"
        completionLabel.fontSize = 50
        completionLabel.position = CGPoint(x: frame.midX, y: frame.midY-370)
//        self.addChild(completionLabel)
//        completionLabel.isUserInteractionEnabled = false
//        completionLabel.isHidden = true
                             
        physicsWorld.gravity = .zero
    }
    
    func createGerobak() {
        let gerobakTextures = ["gerobakMie", "gerobakBakso"]
        var randGerobakTexture = gerobakTextures.randomElement()!
        let gerobakTexture = SKTexture(imageNamed: randGerobakTexture)
        
        if randGerobakTexture == "gerobakMie" {
            buyCurrentLabel.text = "Mie"
        } else if randGerobakTexture == "gerobakBakso" {
            buyCurrentLabel.text = "Bakso"
        }
        
        gerobakTexture.filteringMode = .nearest
        
        gerobak = SKSpriteNode(texture: gerobakTexture)
        gerobak.setScale(1.0)
        gerobak.zPosition = -10
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
        
        sprite.position = CGPoint(x: screenWidth + distanceOffscreen + sprite.size.width, y: screenHeight/3.5 )
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
        self.addChild(findMoreButton)
        self.addChild(findMoreLabel)
        
        if buyCurrentLabel.text == "Bakso" {
            bakso.alpha = 1.0
        } else if buyCurrentLabel.text == "Mie"{
            sate.alpha = 1.0
            nasgor.alpha = 1.0
            cimol.alpha = 1.0
            mie.alpha = 1.0
            cincau.alpha = 1.0
        }
        
        background.alpha = 0.5
        gerobak.alpha = 0.0
        instruction.isHidden = true
        self.isPaused = true
    }
    
    func buyUnpaused() {
        if (bakso.alpha == 1.0 && sate.alpha == 1.0 && nasgor.alpha == 1.0 && cimol.alpha == 1.0 && mie.alpha == 1.0 && cincau.alpha == 1.0) {
            buyView.removeFromParent()
            buyCurrentLabel.removeFromParent()
            findMoreButton.removeFromParent()
            findMoreLabel.removeFromParent()
            self.isPaused = false
            gameCompleted()
        } else {
            buyView.removeFromParent()
            buyCurrentLabel.removeFromParent()
            findMoreButton.removeFromParent()
            findMoreLabel.removeFromParent()
            
            background.alpha = 1.0
            gerobak.alpha = 1.0
            instruction.isHidden = false
            self.isPaused = false
        }
    }
    
    func gameCompleted() {
        self.addChild(buyView)
        self.addChild(playAgainButton)
        self.addChild(completionDesc)
        self.addChild(completionLabel)
        
        background.alpha = 0.5
        gerobak.alpha = 0.0
        instruction.isHidden = true
        self.isPaused = true
    }
    
    func restartGame() {
        bakso.alpha == 0.5
        sate.alpha == 0.5
        nasgor.alpha == 0.5
        cimol.alpha == 0.5
        mie.alpha == 0.5
        cincau.alpha == 0.5
//        buyUnpaused()
        startPage()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointTouched = touch.location(in: self)
            
            if gerobak.contains(pointTouched) {
                buyPaused()
            }
            
            if findMoreButton.contains(pointTouched) {
                buyUnpaused()
            }
            
            if playAgainButton.contains(pointTouched){
                restartGame()
            }
        }
    }
    
}

public func gameScene() {
    let skView = SKView(frame: .zero)
    
    let gameScene = GameScene(size: UIScreen.main.bounds.size)
    gameScene.scaleMode = .aspectFill
    skView.presentScene(gameScene)
    skView.preferredFramesPerSecond = 60
    
    PlaygroundPage.current.liveView = skView
}
