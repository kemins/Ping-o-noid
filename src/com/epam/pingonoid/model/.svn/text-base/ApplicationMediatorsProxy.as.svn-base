package com.epam.pingonoid.model
{
	import com.epam.pingonoid.view.CreditsMediator;
	import com.epam.pingonoid.view.HighScoresMediator;
	import com.epam.pingonoid.view.MainViewMediator;
	import com.epam.pingonoid.view.MenuViewMediator;
	import com.epam.pingonoid.view.PingPongViewMediator;
	import com.epam.pingonoid.view.SettingsViewMediator;
	
	import flash.net.*;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ApplicationMediatorsProxy extends Proxy implements IProxy
	{
		
		public static const NAME:String = "ApplicationMediatorsProxy";
		
	
		public function ApplicationMediatorsProxy( data:Object = null ) 
        {
            super ( NAME, data );
        }

		// ----------------- All application mediators

		public function get mainViewMediator() : MainViewMediator
		{
			return facade.retrieveMediator(MainViewMediator.NAME) as MainViewMediator;
		}
		
		public function get menuViewMediator() : MenuViewMediator
		{
			return facade.retrieveMediator(MenuViewMediator.NAME) as MenuViewMediator;
		}			
		
		public function get pingPongMediator() : PingPongViewMediator
		{
			return facade.retrieveMediator(PingPongViewMediator.NAME) as PingPongViewMediator;
		}
		
		public function get settingsViewMediator() : SettingsViewMediator
		{
			return facade.retrieveMediator(SettingsViewMediator.NAME) as SettingsViewMediator;
		}	
		
		public function get highScoresMediator() : HighScoresMediator
		{
			return facade.retrieveMediator(HighScoresMediator.NAME) as HighScoresMediator;
		}
		
		public function get creditsMediator() : CreditsMediator
		{
			return facade.retrieveMediator(CreditsMediator.NAME) as CreditsMediator;
		}		
		
	}
}