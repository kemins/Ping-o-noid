package com.epam.pingonoid.utils
{
	public class MathUtils
	{
		
		/**
		 * Prevent from instance creation.
		 * 
		 * @param security
		 * 
		 */		
		public function MathUtils(security:Security) {}
		
		
		/**
		 * 
		 * @param value
		 * @param min
		 * @param max
		 * @return 
		 * 
		 */		
		public static function normalizeValue(value:Number, min:Number, max:Number) : Number
		{
			var res:Number = value;
			res = Math.max(value, min);
			res = Math.min(res, max);
			return res;
		}
		
		
		/**
		 * radian2Degree
		 * 
		 * @param radian
		 * @return 
		 * 
		 */		
		public static function radian2Degree(radian:Number) : Number
		{
			return (radian * 180) / Math.PI;
		}
		
		
		/**
		 * degree2Radian
		 * 
		 * @param degree
		 * @return 
		 * 
		 */		
		public static function degree2Radian(degree:Number) : Number
		{
			return (Math.PI * degree) / 180;
		}
		
		
		public static function get randomBoolean() : Boolean
		{
			return Boolean(Math.random() > 0.5);
		}
	}	
}
// singleton enforcer class
class Security{}