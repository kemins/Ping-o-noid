package com.epam.pingonoid.model
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class AbstractProxy extends Proxy
	{
		/**
		 * Constructor
		 *  
		 * @param proxyName
		 * @param data
		 * 
		 */		
		public function AbstractProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
		}
		
		/**
		 * 
		 * @param type
		 * @return 
		 * 
		 */		
		final protected function getNotificationName(type:String) : String
		{
			return Class( getDefinitionByName( flash.utils.getQualifiedClassName(this) ) )[type]; 
		}
	}
}