package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.model.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.*;
	
	public class PrepModelCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void    
		{

			facade.registerProxy( new UserSettingsProxy() );
			facade.registerProxy( new ApplicationMediatorsProxy() );
			facade.registerProxy( new ApplicationProxiesProxy() );

		}
	}
}