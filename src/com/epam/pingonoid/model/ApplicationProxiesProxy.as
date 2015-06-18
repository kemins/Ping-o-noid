package com.epam.pingonoid.model
{
	import flash.net.*;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ApplicationProxiesProxy extends Proxy implements IProxy
	{
		
		public static const NAME:String = "ApplicationProxiesProxy";
		
	
		public function ApplicationProxiesProxy( data:Object = null ) 
        {
            super ( NAME, data );
        }

		// ----------------- All application proxies
		
		public function get userSettingsProxy() : UserSettingsProxy
		{
			return facade.retrieveProxy(UserSettingsProxy.NAME) as UserSettingsProxy;
		}
		
	}
}