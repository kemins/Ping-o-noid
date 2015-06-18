package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.controller.managers.SoundManager;
	import com.epam.pingonoid.model.VO.SettingsVO;
	
	import org.puremvc.as3.interfaces.INotification;

	public class HandleUserSettingsChangeCommand extends ApplicationCommand
	{
		override public function execute(notification:INotification) : void
		{
			var settings:SettingsVO = notification.getBody() as SettingsVO;
			
			mediators.settingsViewMediator.applySettings(settings);
			mediators.pingPongMediator.setUserSettings(settings);
			
			SoundManager.instance.soundOn = settings.soundOn;
		}
	}
}