package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.view.views.MenuView;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * MenuViewMediator
	 * 
	 */	
	public class MenuViewMediator extends BaseMediator
	{
		public static const NAME:String = "MenuViewMediator";
		
		/**
		 * Constructor 
		 * @param viewComponent
		 * 
		 */		
		public function MenuViewMediator(viewComponent:MenuView=null)
		{
			super(NAME, viewComponent);
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
//				case NotificationConstants.DATA_LOADED:
//					break;
			}
		}
		
		/**
		 * ISetupViewMediator :: setupView
		 * 
		 */		
		override public function setupView():void
		{
			view.setupUI();
			super.setupView();
		}
		
		override protected function addEventListeners():void
		{
			view.btnStartGame.addEventListener(MouseEvent.CLICK, onStartGameClick);
			view.btnSettings.addEventListener(MouseEvent.CLICK, onOptionsClick);
			view.btnHighScores.addEventListener(MouseEvent.CLICK, onHighScoresClick);
			view.btnCredits.addEventListener(MouseEvent.CLICK, onCreditsClick);
		}
		
		protected function onStartGameClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.START_PINGPONG_GAME);
		}

		protected function onOptionsClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.OPEN_OPTIONS);
		}

		protected function onHighScoresClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.OPEN_HIGH_SCORES);
		}	
		
		protected function onCreditsClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.OPEN_CREDITS);
		}			
		
		/**
		 * get view
		 * @return 
		 * 
		 */		
		public function get view():MenuView
		{
			return viewComponent as MenuView; 
		}
	}
}
