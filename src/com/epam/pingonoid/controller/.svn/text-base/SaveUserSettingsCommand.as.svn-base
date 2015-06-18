package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.model.VO.SettingsVO;
	
	import org.puremvc.as3.interfaces.INotification;

	public class SaveUserSettingsCommand extends ApplicationCommand
	{
		override public function execute(notification:INotification) : void
		{
			var settings:SettingsVO = notification.getBody() as SettingsVO;
			proxies.userSettingsProxy.settingsVO = settings;
			
			sendNotification(NotificationConstants.USER_SETTINGS_CHANGED,  settings);
		}
	}
}