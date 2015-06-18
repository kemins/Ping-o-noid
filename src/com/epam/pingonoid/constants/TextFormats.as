package com.epam.pingonoid.constants
{
	import flash.text.TextFormat;

	/**
	 * TextFormats
	 * 
	 */	
	public class TextFormats
	{
		
		/**
		 * scoreBoardNameFormat
		 * 
		 * @return 
		 * 
		 */		
		public static function get scoreBoardNameFormat() : TextFormat
		{
			var tf:TextFormat = new TextFormat();
			tf.font = "Comic Sans MS";
			tf.size = 16;
			tf.bold = true;
			return tf;
		}
		
		
		/**
		 * scoreBoardScoreFormat
		 * 
		 * @return 
		 * 
		 */		
		public static function get scoreBoardScoreFormat() : TextFormat
		{
			var tf:TextFormat = scoreBoardNameFormat;
			tf.size = 26;
			return tf;
		}
		
		
		/**
		 * viewHeaderFormat
		 * 
		 * @return 
		 * 
		 */		
		public static function get viewHeaderFormat() : TextFormat
		{
			var tf:TextFormat = new TextFormat();
			tf.size = 40;
			tf.font = "Comic Sans MS";
			return tf;
		}
	}
}