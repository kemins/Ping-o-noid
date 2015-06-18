package com.epam.pingonoid.controller.managers
{
	import flash.display.Sprite;

	public class SpriteManager
	{
		private var mainSprite:Sprite;
		private static var instance:SpriteManager;
		
		private var sprites:Array = [];
		
		/**
		 * Constructor
		 * 
		 */		
		public function SpriteManager(mainSprite:Sprite)
		{
			if (!SpriteManager.instance)
			{
				SpriteManager.instance = this;
			}
			else
			{
				throw new Error("AppManager is already created.");
			}
			this.mainSprite = mainSprite;
		}
		
		/**
		 * 
		 * @param sprite
		 * @return 
		 * 
		 */		
		public static function addSprite(sprite:Sprite) : Sprite
		{
			instance.sprites.push(sprite);
			return instance.mainSprite.addChild(sprite) as Sprite;
		}
		
		public static function get width() : Number
		{
			return instance.mainSprite.stage.stageWidth;
		}
		
		public static function get height() : Number
		{
			return instance.mainSprite.stage.stageHeight;
		}
		
		/**
		 * 
		 * @param sprite
		 * @return 
		 * 
		 */		
		public static function removeSprite(sprite:Sprite) : Sprite
		{
			var idx:int = instance.sprites.indexOf(sprite);
			instance.sprites.splice(idx, 1);
			return instance.mainSprite.removeChild(sprite) as Sprite;
		}
		
		
		/**
		 * update
		 * 
		 */		
		public function update() : void
		{
			for each (var sprite:Sprite in sprites)
			{
				
			}
		}
	}
}