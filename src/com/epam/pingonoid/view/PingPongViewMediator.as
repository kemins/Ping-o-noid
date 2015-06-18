package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.EventConstants;
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.components.Ball;
	import com.epam.pingonoid.view.components.TimerBoard;
	import com.epam.pingonoid.view.events.CollisionEvent;
	import com.epam.pingonoid.view.interfaces.ISetupViewMediator;
	import com.epam.pingonoid.view.views.PingPongView;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * PingPongViewMediator
	 * 
	 */	
	public class PingPongViewMediator extends BaseMediator implements ISetupViewMediator
	{
		public static const NAME:String = "PingPongViewMediator";
		
		public var isBallOnRacket:Boolean;
		public var isBallOnRacketLeft:Boolean;
		public var helpScreenShown:Boolean;
		
		public var settings:SettingsVO;
		
		public var world:World;
		public var gameTime:int; //frames time
		public var scoreLeft:ScoreVO;
		public var scoreRight:ScoreVO;
		
		
		/**
		 * Constructor 
		 * 
		 * @param viewComponent
		 * 
		 */		
		public function PingPongViewMediator(viewComponent:PingPongView=null)
		{
			super(NAME, viewComponent);
		}

		
		/**
		 * add event listeners.
		 * 
		 */		
		override protected function addEventListeners() : void
		{
			view.addEventListener(CollisionEvent.COLLISION_HAPPENED, collisionHandler);
			view.helpScreenView.addEventListener(EventConstants.EVENT_GO_GAME, goGameHandler);
			view.endGameView.addEventListener(EventConstants.EVENT_GOTO_MENU, gotoMenuHandler);
			view.endGameView.addEventListener(EventConstants.EVENT_PLAY_AGAIN, playAgainHandler);			
			view.pauseGameView.addEventListener(EventConstants.EVENT_RESUME_GAME, resumeGameHandler);
			view.pauseGameView.addEventListener(EventConstants.EVENT_QUIT_GAME, quitGameHandler);
		}
		
		
		/**
		 * Remove event listeners.
		 * 
		 */		
		override protected function removeEventListeners() : void
		{
			view.removeEventListener(Event.ENTER_FRAME, update);
			view.removeEventListener(CollisionEvent.COLLISION_HAPPENED, collisionHandler);
		}
		
		
		/**
		 * update
		 * 
		 */		
		public function update(e:Event) : void
		{
			sendNotification(NotificationConstants.UPDATE_PINGPONG_GAME);
		}
		
		
		/**
		 * Push ball from the racket
		 * 
		 * 
		 */		
		public function startBall() : void
		{
			ball.start(!isBallOnRacketLeft);
			
			isBallOnRacket = false;
		}
		
		
		/**
		 * setWinner
		 * 
		 * @param scoreVO
		 * 
		 */		
		public function setWinner(scoreVO:ScoreVO):void
		{
			view.endGameView.setWinner(scoreVO);
		}
		
		
		/**
		 * setBallToRacket
		 * 
		 * @param toLeftRacket
		 * 
		 */		
		public function setBallToRacket(toLeftRacket:Boolean) : void
		{
			view.setBallToRacket(toLeftRacket);
			
			isBallOnRacket = true;
			isBallOnRacketLeft = toLeftRacket;
		}
		
		
		/**
		 * updateScore
		 * 		 */		
		public function updateScore() : void
		{
			view.setScore(scoreLeft, scoreRight);
		}
		
		
		/**
		 * Populate view according to settings. 
		 * @param settings
		 * 
		 */		
		public function setUserSettings(settings:SettingsVO) : void
		{
			this.settings = settings;
			view.setPlayersSettings(settings);
			scoreLeft.name = settings.player1Name;
			scoreRight.name = settings.player2Name;
		}
		
		
		/**
		 * resetRackets
		 * 
		 */		
		public function resetRackets() : void
		{
			view.leftRacket.reset();
			view.rightRacket.reset();
		}	
		
		/**
		 * resetTimer
		 * 
		 */		
		public function resetTimer() : void
		{
			view.timerBoard.reset();
		}
		
		
		/**
		 * ISetupViewMediator :: setupView
		 * 
		 */		
		override public function setupView() : void
		{
			//create the world
			world = new World(view);

			sendNotification(NotificationConstants.CREATE_PINGPONG_ROOM, view);
			sendNotification(NotificationConstants.RESET_PINGPONG_GAME);
			
			super.setupView();
		}
		

		/**
		 * listNotificationInterests
		 * 
		 * @return 
		 * 
		 */		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.PAUSE_GAME				
				, NotificationConstants.RESUME_GAME
				, NotificationConstants.QUIT_GAME
				, NotificationConstants.END_PINGPONG_GAME
				, NotificationConstants.START_PINGPONG_GAME
			];
		}
		
		
		/**
		 * handleNotification
		 * 
		 * @param notification
		 * 
		 */		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case NotificationConstants.START_PINGPONG_GAME:
					view.addEventListener(Event.ENTER_FRAME, update);
					view.stage.addEventListener(Event.DEACTIVATE, browserDeactivateHandler);					
					break;	
				
				case NotificationConstants.PAUSE_GAME:
					view.removeEventListener(Event.ENTER_FRAME, update);
					view.pauseGameView.visible = true;
					break;							
				
				case NotificationConstants.QUIT_GAME:
					view.pauseGameView.visible = false;
					break;

				case NotificationConstants.END_PINGPONG_GAME:
					view.removeEventListener(Event.ENTER_FRAME, update);
					view.stage.removeEventListener(Event.DEACTIVATE, browserDeactivateHandler);					
					view.endGameView.visible = true;
					break;				
				
				case NotificationConstants.RESUME_GAME:
					view.addEventListener(Event.ENTER_FRAME, update);
					view.pauseGameView.visible = false;
					update(null);
					break;
			}
		}		
		
		
		/**
		 * resetView
		 * 
		 * @param resetSubViews
		 * 
		 */		
		override public function resetView(resetSubViews:Boolean=true) : void
		{
			super.resetView(resetSubViews);
			view.endGameView.visible = false;
			view.pauseGameView.visible = false;
			
			sendNotification(NotificationConstants.RESET_PINGPONG_GAME);
		}
		
		
		/**
		 * get ball
		 * @return 
		 * 
		 */		
		public function get ball() : Ball
		{
			return view.ball; 
		}
		
		
		/**
		 * get view
		 * @return 
		 * 
		 */		
		public function get view() : PingPongView
		{
			return viewComponent as PingPongView; 
		}
		
		/**
		 * get timerBoard
		 * @return 
		 * 
		 */		
		public function get timerBoard() : TimerBoard
		{
			return view.timerBoard as TimerBoard; 
		}
		
		
		/**
		 * Collision event handler
		 * 
		 * @param event
		 * 
		 */		
		private function collisionHandler(event:CollisionEvent) : void
		{
			trace("Collision happend between " + event.body1Type + " and " + event.body2Type);
			event.stopPropagation();
			sendNotification(NotificationConstants.COLLISION_HAPPENED, event);
		}

		/**
		 * Resume game event handler
		 * 
		 * @param event
		 * 
		 */		
		private function resumeGameHandler(event:Event) : void
		{
			sendNotification(NotificationConstants.RESUME_GAME);
		}		

		/**
		 * Quit game event handler 
		 * 
		 * @param event
		 * 
		 */		
		private function quitGameHandler(event:Event) : void
		{
			sendNotification(NotificationConstants.QUIT_GAME);
		}	

		/**
		 * Play again event handler 
		 * 
		 * @param event
		 * 
		 */		
		private function playAgainHandler(event:Event) : void
		{
			sendNotification(NotificationConstants.START_PINGPONG_GAME);
		}	

		/**
		 * Go to menu event handler 
		 * 
		 * @param event
		 * 
		 */		
		private function gotoMenuHandler(event:Event) : void
		{
			sendNotification(NotificationConstants.OPEN_MENU);
		}			

		/**
		 * Deactivate event handler (executed when flash app looses focus, e.g. browser window minimized) 
		 * 
		 * @param event
		 * 
		 */		
		private function browserDeactivateHandler(event:Event) : void
		{
			sendNotification(NotificationConstants.PAUSE_GAME);
		}			
		
		/**
		 * Go game handler (dispatched after helper screen) 
		 * 
		 * @param event
		 * 
		 */		
		private function goGameHandler(event:Event) : void
		{
			//hiding helper screen
			view.helpScreenView.visible = false;

			sendNotification(NotificationConstants.START_PINGPONG_GAME);
		}			
		
	}
}
