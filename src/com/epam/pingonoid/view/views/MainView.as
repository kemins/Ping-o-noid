package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.view.containers.ViewStack;
	
	public class MainView extends ViewStack
	{
		public static const INDEX_MENU_SCREEN:uint = 0;
		public static const INDEX_SETTINGS_SCREEN:uint = 1;
		public static const INDEX_HIGHSCORES_SCREEN:uint = 2;
		public static const INDEX_PINGPONG_SCREEN:uint = 3;
		public static const INDEX_CREDITS_SCREEN:uint = 4;
		
		/**
		 * Constructor
		 * 
		 */		
		public function MainView()
		{
			super();

			_menuView = new MenuView();
			_pingPongView = new PingPongView();
			_settingsView = new SettingsView();
			_highScoresView = new HighScoresView();
			_creditsView = new CreditsView();
			
			children = [menuView, settingsView, highScoresView, pingPongView, creditsView];
			
			backgroundAlpha = 0;
		}
		
		/**
		 * 
		 * @return ping pong view 
		 * 
		 */		
		public function get pingPongView() : PingPongView
		{
			return _pingPongView;
		}
		/**
		 * 
		 * @return settingsView
		 * 
		 */		
		public function get settingsView() : SettingsView
		{
			return _settingsView;
		}		

		/**
		 * 
		 * @return 
		 * 
		 */
		public function get highScoresView() : HighScoresView
		{
			return _highScoresView;
		}				
		
		/**
		 * 
		 * @return _menuView 
		 * 
		 */
		public function get menuView() : MenuView
		{
			return _menuView;
		}	

		/**
		 * 
		 * @return _creditsView 
		 * 
		 */
		public function get creditsView() : CreditsView
		{
			return _creditsView;
		}			
		
		private var _pingPongView:PingPongView;
		private var _menuView:MenuView;
		private var _settingsView:SettingsView;
		private var _highScoresView:HighScoresView;
		private var _creditsView:CreditsView;
	}
}
