package com.epam.pingonoid.view.components
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * SpriteAdv
	 * 
	 */	
	public class SpriteAdv extends Sprite
	{
		
		/**
		 * Constructor
		 * 
		 */		
		public function SpriteAdv()
		{
			super();
			
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/**
		 * init
		 * 
		 * @param e
		 * 
		 */		
		protected function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
}