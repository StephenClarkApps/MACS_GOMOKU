import UIKit

class ViewController: UIViewController {
    var statusLabel: UILabel!
    var game: Game!
    var presenter: GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        
        game = Game()
        presenter = GamePresenter()
        
        let gridView = GridView(frame: CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.width), board: game.getBoard())
        self.view.addSubview(gridView)
        
        gridView.tapResponder = { (col, row) in
            self.respondToTap(col, row: row)
        }
        
        let labelWidth: CGFloat = 100.0
        statusLabel = UILabel(frame: CGRectMake((view.frame.width - labelWidth) / 2.0, 100,labelWidth, 25))
        self.view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.textAlignment = NSTextAlignment.Center
    }

    
    func respondToTap(col: Int, row: Int) {
        game.takeTurn(col, row)
        if game.getRules().isWin(game.getBoard(), game.whoseTurn()) {
            statusLabel.text = presenter.getWinStatus(game.whoseTurn())
        }
        else {
            statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        }
    }
}

