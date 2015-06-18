package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.view.views.MainView;
	
	import flash.display.InteractiveObject;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class MainViewMediator extends BaseMediator
	{
		public static const NAME:String = "MainViewMediator";
		
		/**
		 * Constructor 
		 * @param viewComponent
		 * 
		 */		
		public function MainViewMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		
		/**
		 * createSubMediators
		 * @return 
		 * 
		 */		
		override protected function createSubMediators() : Array
		{
			return [
				new MenuViewMediator(view.menuView)
				, new PingPongViewMediator(view.pingPongView)
				, new SettingsViewMediator(view.settingsView)
				, new HighScoresMediator(view.highScoresView)
				, new CreditsMediator(view.creditsView)
			];
		}
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.START_PINGPONG_GAME
				, NotificationConstants.OPEN_OPTIONS
				, NotificationConstants.OPEN_HIGH_SCORES
				, NotificationConstants.OPEN_MENU
				, NotificationConstants.OPEN_CREDITS
				, NotificationConstants.QUIT_GAME
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
					setSelectedIndex(MainView.INDEX_PINGPONG_SCREEN);
					break;
				
				case NotificationConstants.OPEN_OPTIONS:
					setSelectedIndex(MainView.INDEX_SETTINGS_SCREEN);
					break;
				
				case NotificationConstants.OPEN_HIGH_SCORES:
					setSelectedIndex(MainView.INDEX_HIGHSCORES_SCREEN);
					break;		
				
				case NotificationConstants.OPEN_MENU:
					setSelectedIndex(MainView.INDEX_MENU_SCREEN);
					break;
				
				case NotificationConstants.OPEN_CREDITS:
					setSelectedIndex(MainView.INDEX_CREDITS_SCREEN);
					break;				
				
				case NotificationConstants.QUIT_GAME:
					setSelectedIndex(MainView.INDEX_MENU_SCREEN);
					break;
			}
		}		
		
		/**
		 * Switch view in view stack.
		 * 
		 * @param index
		 * 
		 */		
		private function setSelectedIndex(index:int) : void
		{
			// reset current view
			getActivePageMediator().resetView();
			
			
			view.selectedIndex = index;
			
			//set focus for active view
			var selectedView:InteractiveObject = view.selectedView;
			selectedView.stage.focus = selectedView;
		}
		
		/**
		 * 
		 * @return  - Mediator of active page.
		 * 
		 */		
		private function getActivePageMediator() : BaseMediator
		{
			for each (var m:BaseMediator in subMediators)
			{
				if( m.getViewComponent() == view.selectedView)
				{
					return m;
				}
			}
			return null;
		}
		
		/**
		 * Cast view component to MainView.
		 * 
		 * @return  
		 * 
		 */		
		public function get view() : MainView
		{
			return viewComponent as MainView;
		}
	}
}