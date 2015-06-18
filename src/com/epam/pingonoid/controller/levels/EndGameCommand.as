package com.epam.pingonoid.controller.levels
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.constants.SoundConstants;
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.controller.managers.SoundManager;
	import com.epam.pingonoid.model.UserSettingsProxy;
	import com.epam.pingonoid.model.VO.HighScoresVO;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.view.PingPongViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * EndGameCommand
	 * 
	 */	
	public class EndGameCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute(notification:INotification):void
		{
			trace("EndGameCommand.execute");
			
			// determining game result
			var winnerScore:ScoreVO;

			if ( mediators.pingPongMediator.scoreLeft.points > mediators.pingPongMediator.scoreRight.points )
				winnerScore = mediators.pingPongMediator.scoreLeft;
			else if ( mediators.pingPongMediator.scoreLeft.points < mediators.pingPongMediator.scoreRight.points )
				winnerScore = mediators.pingPongMediator.scoreRight;
					
			mediators.pingPongMediator.setWinner(winnerScore);
			
			// updating high scores 
			var highScoresVO:HighScoresVO = proxies.userSettingsProxy.highScoresVO;
			
			highScoresVO.addScore(HighScoresVO.GAME_TYPE_PINGPONG, mediators.pingPongMediator.scoreLeft);
			highScoresVO.addScore(HighScoresVO.GAME_TYPE_PINGPONG, mediators.pingPongMediator.scoreRight);

			mediators.highScoresMediator.applyHighScores( highScoresVO );
			
			// saving high scores to sharedObject
			proxies.userSettingsProxy.highScoresVO = highScoresVO;
			
			SoundManager.instance.play(SoundConstants.OVATION_SOUND);
		}
	}
}