package com.epam.pingonoid.utils
{
	public class ArrayUtils
	{
		public function ArrayUtils(security:Security){}
		
		/**
		 * Remove item from array by critirion.
		 * 
		 * @param source
		 * @param property
		 * @param value
		 * @return 
		 * 
		 */		
		public static function removeItemByPropertyValue(source:Array, property:Object, value:Object) : Object
		{
			for (var i:int = 0; i < source.length; i++)
			{
				var item:Object = source[i];
				if (item[property] == value)
				{
					source.splice(i, 1);
					return item;
				}
			}
			
			return null;
		}
	}
}
// singleton enforcer class
class Security{}