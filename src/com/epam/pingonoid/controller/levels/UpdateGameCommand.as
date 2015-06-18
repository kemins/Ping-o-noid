package com.epam.pingonoid.controller.levels
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.controller.UserInputController;
	import com.epam.pingonoid.view.PingPongViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * UpdateGameCommand
	 * 
	 */	
	public class UpdateGameCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute(notification:INotification):void
		{
			if (UserInputController.keyEsc)
			{
				sendNotification(NotificationConstants.PAUSE_GAME);
			}
			else
			{
				//update view basing on B2D
				ppMed.view.update();
				
				//update B2D world
				ppMed.world.update();
				
				if (ppMed.view.helpScreenView.visible)
				{
					return;
				}
				
				if (ppMed.isBallOnRacket)
				{
					if (UserInputController.space)
					{
						//push the ball
						UserInputController.space = false;
						ppMed.startBall();
					}
					else
					{
						//keep the ball with position of racket
						ppMed.setBallToRacket(ppMed.isBallOnRacketLeft);
					}
				}
				else
				{
					var duration:Number = ppMed.settings.gameDuration;
					var time:int = ++ppMed.gameTime;
					if (time / Main.FRAME_RATE > duration)
					{
						sendNotification(NotificationConstants.END_PINGPONG_GAME);
					}
					else
					{
						ppMed.timerBoard.update(time, duration);
					}
				}
			}
		}
		
		
		//-----------------------------------
		// Mediators
		//-----------------------------------
		
		private function get ppMed() : PingPongViewMediator
		{
			return mediators.pingPongMediator;
		}
	}
}