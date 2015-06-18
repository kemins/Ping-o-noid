package com.epam.pingonoid.controller.levels
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.view.PingPongViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * PlayerMissedBallCommand
	 * 
	 */	
	public class PlayerMissedBallCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute(notification:INotification):void
		{
			var leftMissed:Boolean = (notification.getName() == NotificationConstants.LEFT_PLAYER_MISSED_BALL);
			
			//if left racket missed then set to right racket and vice versa
			pingPongMediator.setBallToRacket(!leftMissed);
			
			if (leftMissed)
			{
				++pingPongMediator.scoreRight.points;
			}
			else
			{
				++pingPongMediator.scoreLeft.points;
			}
			pingPongMediator.updateScore();
		}
		
		
		//-----------------------------------
		// Mediators
		//-----------------------------------
		
		private function get pingPongMediator() : PingPongViewMediator
		{
			return mediators.pingPongMediator;
		}
	}
}