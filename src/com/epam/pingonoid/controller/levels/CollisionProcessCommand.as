package com.epam.pingonoid.controller.levels
{	
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.constants.SoundConstants;
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.controller.managers.SoundManager;
	import com.epam.pingonoid.view.events.CollisionEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * CollisionProcessCommand
	 * 
	 */	
	public class CollisionProcessCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute( notification:INotification ):void
		{
			var ev:CollisionEvent = notification.getBody() as CollisionEvent;
			var b1Type:String = ev.body1Type;
			var b2Type:String = ev.body2Type;
			
			if (checkTypes(BodyType.BALL, BodyType.LEFT_RACKET))
			{
				processLeftRacketBall();
			}
			else if (checkTypes(BodyType.BALL, BodyType.RIGHT_RACKET))
			{
				processRightRacketBall();
			}
			else if (checkTypes(BodyType.BALL, BodyType.LEFT_WALL))
			{
				sendNotification(NotificationConstants.LEFT_PLAYER_MISSED_BALL);
				processBallLeftWall();
			}
			else if (checkTypes(BodyType.BALL, BodyType.RIGHT_WALL))
			{
				sendNotification(NotificationConstants.RIGHT_PLAYER_MISSED_BALL);
				processBallRightWall();
			}
			else if (checkTypes(BodyType.BALL, BodyType.TOP_BOTTOM_WALL))
			{
				processBallTopBottomWall();
			}
			
			// Check types
			function checkTypes(type1:String, type2:String) : Boolean
			{
				return (b1Type == type1 && b2Type == type2) || 
					(b2Type == type1 && b1Type == type2);
			}
		}
		
		
		/**
		 * processLeftRacketBall
		 * 
		 */		
		private function processLeftRacketBall() : void
		{
			soundManager.play(SoundConstants.BALL_RACKET_SOUNDS);
		}
		
		/**
		 * processRightRacketBall
		 * 
		 */		
		private function processRightRacketBall() : void
		{
			soundManager.play(SoundConstants.BALL_RACKET_SOUNDS);
		}
		
		/**
		 * processBallLeftWall
		 * 
		 */		
		private function processBallLeftWall() : void
		{
			soundManager.play(SoundConstants.MISSED_BALL_SOUND);
		}
		
		/**
		 * processBallRightWall
		 * 
		 */		
		private function processBallRightWall() : void
		{
			soundManager.play(SoundConstants.MISSED_BALL_SOUND);
		}
		
		
		/**
		 * processBallTopBottomWall
		 * 
		 */		
		private function processBallTopBottomWall() : void
		{
			soundManager.play(SoundConstants.BALL_WALL_SOUND);
		}
		
		
		/**
		 * Sound manager getter.
		 * 
		 * @return 
		 * 
		 */		
		public function get soundManager() : SoundManager
		{
			return SoundManager.instance;
		}
	}
}