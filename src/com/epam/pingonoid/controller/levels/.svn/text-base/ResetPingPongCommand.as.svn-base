package com.epam.pingonoid.controller.levels
{
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.model.UserSettingsProxy;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.utils.MathUtils;
	import com.epam.pingonoid.view.PingPongViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * ResetPingPongCommand
	 * 
	 */	
	public class ResetPingPongCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute(notification:INotification):void
		{
			ppMed.scoreLeft = new ScoreVO(userSettingsProxy.settingsVO.player1Name, 0);
			ppMed.scoreRight = new ScoreVO(userSettingsProxy.settingsVO.player2Name, 0);
			ppMed.setBallToRacket(MathUtils.randomBoolean);
			ppMed.gameTime = 0;
			ppMed.updateScore();
			ppMed.resetTimer();
			ppMed.resetRackets();
		}
		
		
		//-----------------------------------
		// Mediators
		//-----------------------------------
		
		private function get ppMed() : PingPongViewMediator
		{
			return mediators.pingPongMediator;
		}
		
		//-----------------------------------
		// Proxies
		//-----------------------------------
		
		private function get userSettingsProxy() : UserSettingsProxy
		{
			return proxies.userSettingsProxy;
		}
	}
}