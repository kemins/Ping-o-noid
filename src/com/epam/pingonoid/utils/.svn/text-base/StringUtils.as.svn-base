package com.epam.pingonoid.utils
{
	public class StringUtils
	{
		/**
		 * Prevent from instance creation.
		 * 
		 * @param security
		 * 
		 */		
		public function StringUtils(security:Security) {}
		
		
		/**
		 * 
		 * @param text
		 * @param rest
		 * @return 
		 * 
		 */		
		public static function replaceMacros(text:String, ...rest:Array) : String
		{
			if (text)
			{
				var len:uint = rest.length;
				
				for ( var i:uint = 0; i < len; i++ )
				{
					text = text.split( "{" + i + "}" ).join(rest[i]);
				}
			}
			
			return text;
		}
	}
}
// singleton enforcer class
class Security{}