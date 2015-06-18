package com.epam.pingonoid.view.controls
{
	import com.epam.pingonoid.constants.TextFormats;
	
	import flash.filters.GlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * PlayerNameLabel
	 * 
	 */	
	public class TextFieldAdv extends TextField
	{
		private var tf:TextFormat;
		
		
		/**
		 * Constructor 
		 * 
		 * @param name
		 * @param color
		 * 
		 */		
		public function TextFieldAdv(text:String = "", textFormat:TextFormat = null, filters:Array = null)
		{
			super();

			autoSize = TextFieldAutoSize.CENTER;
			antiAliasType = AntiAliasType.ADVANCED;
			wordWrap = false;
			
			if (!textFormat)
			{
				tf = TextFormats.scoreBoardNameFormat;
			}
			else
			{
				tf = textFormat;
			}
			
			this.text = text;
			
			if (filters)
				this.filters = filters;
		}
		
		
		/**
		 * name
		 * @param value
		 * 
		 */		
		override public function set text(value:String) : void
		{
			super.text = value;
			setTextFormat(tf);
		}
		
		
		/**
		 * color
		 * @param value
		 * 
		 */		
		public function set color(value:uint) : void
		{
			textColor = value;
		}
		
		/**
		 * color
		 * @param value
		 * 
		 */		
		public function set size(value:int) : void
		{
			tf.size = value;
			setTextFormat(tf);
		}
	}
}