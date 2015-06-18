package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.view.views.CreditsView;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * SettingsViewMediator
	 * 
	 */	
	public class CreditsMediator extends BaseMediator
	{
		public static const NAME:String = "CreditsMediator";
		
		/**
		 * Constructor 
		 * @param viewComponent
		 * 
		 */		
		public function CreditsMediator(viewComponent:CreditsView=null)
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
		 *	Adding event listeners to the ui components 
		 * 
		 */
		override protected function addEventListeners():void
		{
			view.btnBack2Menu.addEventListener(MouseEvent.CLICK, onBack2MenuClick);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function onBack2MenuClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.OPEN_MENU);
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
			addEventListeners();
		}
		
		/**
		 * get view
		 * @return 
		 * 
		 */		
		public function get view():CreditsView
		{
			return viewComponent as CreditsView; 
		}
	}
}
