package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.World;
	import com.epam.pingonoid.view.components.Ball;
	import com.epam.pingonoid.view.components.Racket;
	import com.epam.pingonoid.view.components.ScoreBoard;
	import com.epam.pingonoid.view.components.TimerBoard;
	import com.epam.pingonoid.view.containers.Container;
	
	public class PingPongView extends Container
	{		
		public var scoreBoard:ScoreBoard;
		public var timerBoard:TimerBoard;
		public var ball:Ball;
		public var leftRacket:Racket;
		public var rightRacket:Racket;
		
		public var pauseGameView:PauseGameView;
		public var endGameView:EndGameView;
		public var helpScreenView:HelpScreenView;
		
		/**
		 * Constructor
		 * 
		 */		
		public function PingPongView() 
		{
			super();
			
			backgroundAlpha = 0.6;
			backgroundTexture = ImageConstants.BACKGROUND_TILE_TEXTURE;
			useBackgroundTexture = true
		}
		
		
		/**
		 * createRackets
		 * 
		 */		
		public function createRackets() : void
		{
			leftRacket = new Racket(true);
			leftRacket.setPosition(leftRacket.width, World.appHeight/2);
			addChild(leftRacket);
			
			rightRacket = new Racket(false);
			rightRacket.setPosition(World.appWidth - rightRacket.width, World.appHeight/2);
			addChild(rightRacket);
		}
		
		
		/**
		 * createBall
		 * 
		 */		
		public function createBall() : void
		{
			ball = new Ball();
			ball.setPosition(World.appWidth/2, World.appHeight/2);
			addChild(ball);
		}

		/**
		 * Create child screens 
		 * 
		 */
		public function createChildScreens() : void
		{
			pauseGameView = new PauseGameView();
			pauseGameView.visible = false;
			addChild(pauseGameView);
			
			endGameView = new EndGameView();
			endGameView.visible = false;
			addChild(endGameView);
			
			helpScreenView = new HelpScreenView();
			helpScreenView.visible = false;
			addChild(helpScreenView);					
		}
		
		public function showHelpScreen() : void
		{
			helpScreenView.visible = true;
		}
		
		
		/**
		 * createBall
		 * 
		 */		
		public function createScoreBoard() : void
		{
			scoreBoard = new ScoreBoard();
			addChild(scoreBoard);
		}
		
		
		/**
		 * timerBoard
		 * 
		 */		
		public function createTimerBoard() : void
		{
			timerBoard = new TimerBoard();
			addChild(timerBoard);	
			updateLayout();
		}
		
		
		/**
		 * setLeftPlayerNameColor
		 * 
		 * @param playerSettings
		 * 
		 */		
		public function setPlayersSettings(playerSettings:SettingsVO) : void
		{
			scoreBoard.setLeftPlayerNameColor(playerSettings.player1Name, playerSettings.player1Color);
			scoreBoard.setRightPlayerNameColor(playerSettings.player2Name, playerSettings.player2Color);
			leftRacket.setColor(playerSettings.player1Color);
			rightRacket.setColor(playerSettings.player2Color);
			updateLayout();
		}
		
		
		/**
		 * setScore
		 * 
		 * @param playerSettings
		 * 
		 */		
		public function setScore(scoreLeft:ScoreVO, scoreRight:ScoreVO) : void
		{
			scoreBoard.setScore(scoreLeft.points, scoreRight.points);
			updateLayout();
		}
		
		
		/**
		 * setBallToRacket
		 * 
		 * @param toLeftRacket
		 * 
		 */		
		public function setBallToRacket(toLeftRacket:Boolean) : void
		{
			var racket:Racket = toLeftRacket ? leftRacket : rightRacket;
			var newX:Number = ball.width / 2 + 12;
			newX = toLeftRacket ? newX : -newX;
			
			ball.stop();
			ball.setPosition(racket.x + newX, racket.y);
		}
		
		
		/**
		 * update 
		 * 
		 */		
		public function update() : void
		{
			ball.update();
			leftRacket.update();
			rightRacket.update();
		}
		
		
		/**
		 * updateLayout
		 * 
		 */		
		override protected function updateLayout() : void
		{
			super.updateLayout();
			
			//center score board by new dimensions
			if (scoreBoard)
			{
				scoreBoard.x = (width - scoreBoard.width) / 2;
				scoreBoard.y = 0;
			}
			
			//center timer board by new dimensions
			if (timerBoard)
			{
				timerBoard.x = scoreBoard.x + scoreBoard.width - 5;
				timerBoard.y = 4;
			}

			if (pauseGameView)
			{
				pauseGameView.width = this.width;
				pauseGameView.height = this.height;
			}	
			
			if (endGameView)
			{
				endGameView.width = this.width;
				endGameView.height = this.height;
			}
			
			if (helpScreenView)
			{
				helpScreenView.width = this.width;
				helpScreenView.height = this.height;
			}			
		}
	}
}