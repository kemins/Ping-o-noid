package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.events.SettingsFormEvent;
	import com.epam.pingonoid.view.views.SettingsView;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * SettingsViewMediator
	 * 
	 */	
	public class SettingsViewMediator extends BaseMediator
	{
		public static const NAME:String = "SettingsViewMediator";
		
		/**
		 * Constructor 
		 * @param viewComponent
		 * 
		 */		
		public function SettingsViewMediator(viewComponent:SettingsView=null)
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
				NotificationConstants.DATA_LOADED
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
				case NotificationConstants.DATA_LOADED:
					break;
			}
		}
		
		
		/**
		 *	Adding event listeners to the ui components 
		 * 
		 */
		override protected function addEventListeners() : void
		{
			view.addEventListener(SettingsFormEvent.BACK_TO_MENU, backToMenuHandler);
			view.addEventListener(SettingsFormEvent.SAVE_SETTINGS, saveSettingsHandler);
		}
		
		/**
		 *	Adding event listeners to the ui components 
		 * 
		 */
		override protected function removeEventListeners() : void
		{
			view.removeEventListener(SettingsFormEvent.BACK_TO_MENU, backToMenuHandler);
			view.removeEventListener(SettingsFormEvent.SAVE_SETTINGS, saveSettingsHandler);
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
		
		override public function resetView(resetSubViews:Boolean=true) : void
		{
			//set settings again to reset to default state.
			applySettings(view.settings);
		}
		
		public function applySettings(settingsVO:SettingsVO) : void
		{
			view.settings = settingsVO;
		}
		
		private function backToMenuHandler(event:SettingsFormEvent) : void
		{
			event.stopPropagation();
			sendNotification(NotificationConstants.OPEN_MENU);
		}
		
		private function saveSettingsHandler(event:SettingsFormEvent) : void
		{
			event.stopPropagation();
			sendNotification(NotificationConstants.SAVE_USER_SETTINGS, event.settings);
			sendNotification(NotificationConstants.OPEN_MENU);
		}
		
		/**
		 * get view
		 * @return 
		 * 
		 */		
		public function get view():SettingsView
		{
			return viewComponent as SettingsView; 
		}
	}
}
