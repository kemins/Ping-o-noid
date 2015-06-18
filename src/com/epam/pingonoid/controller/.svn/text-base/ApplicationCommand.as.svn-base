package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.controller.managers.SpriteManager;
	import com.epam.pingonoid.model.ApplicationMediatorsProxy;
	import com.epam.pingonoid.model.ApplicationProxiesProxy;
	import com.epam.pingonoid.view.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class ApplicationCommand extends SimpleCommand
	{
		/**
		 * Getter to retrieve a singleton instance of the ApplicationProxiesProxy class 
		 * to access all of the application's proxies. 
		 */		
		protected function get proxies() : ApplicationProxiesProxy
		{
			return facade.retrieveProxy( ApplicationProxiesProxy.NAME ) as ApplicationProxiesProxy;
		}
		
		/**
		 * Getter to retrieve a singleton instance of the ApplicationMediatorsProxy class 
		 * to access all of the application's mediators. 
		 */		
		protected function get mediators() : ApplicationMediatorsProxy
		{
			return facade.retrieveProxy( ApplicationMediatorsProxy.NAME ) as ApplicationMediatorsProxy;
		}
	
	}
}