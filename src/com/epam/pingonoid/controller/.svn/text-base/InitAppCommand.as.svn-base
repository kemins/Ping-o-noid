package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.model.VO.HighScoresVO;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.*;
	import com.epam.pingonoid.view.interfaces.ISetupViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;

	public class InitAppCommand extends ApplicationCommand
	{
		override public function execute( notification:INotification ):void
		{
			// initialize SettingsView
			
			var settingsVO:SettingsVO = proxies.userSettingsProxy.settingsVO;
			
			if (!settingsVO)
			{
				settingsVO = new SettingsVO();
				proxies.userSettingsProxy.settingsVO = settingsVO;
			}
			
			// initialize mediators and their views
			var setupMediators:Array = [
					mediators.menuViewMediator
					, mediators.highScoresMediator
					, mediators.settingsViewMediator
					, mediators.pingPongMediator
					, mediators.creditsMediator
			];
			
			for each (var mediator:ISetupViewMediator in setupMediators)
			{
				mediator.setupView();
			}

			sendNotification(NotificationConstants.USER_SETTINGS_CHANGED,  settingsVO);
			
			// initialize HighScoresView
			
			var highScoresVO:HighScoresVO = proxies.userSettingsProxy.highScoresVO;
			
			if (!highScoresVO)
			{
				highScoresVO = new HighScoresVO();
				proxies.userSettingsProxy.highScoresVO = highScoresVO;
			}

//			highScoresVO = new HighScoresVO();
//			
//			highScoresVO.pingpongScores.push( new ScoreVO("Andriy", 15) );
//			highScoresVO.pingpongScores.push( new ScoreVO("Vadym", 10) );
//			highScoresVO.pingpongScores.push( new ScoreVO("Yevhen", 5) );
//			highScoresVO.pingpongScores.push( new ScoreVO("Rahul", 3) );
//			highScoresVO.pingpongScores.push( new ScoreVO("Tatsiana", 1) );
			
			mediators.highScoresMediator.applyHighScores( highScoresVO );			
			
			
			//register User Input Controller
			new UserInputController();
		}
		
	}
}