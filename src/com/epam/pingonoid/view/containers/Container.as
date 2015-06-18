package com.epam.pingonoid.view.containers
{
	import com.epam.pingonoid.utils.TileImageDrawer;
	import com.epam.pingonoid.view.components.SpriteAdv;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * 
	 * In complete contrast to Sprite, Container doesn't resize itself according to content size.
 	 * 
	 * Graphic drawing, children's positioning and moving have to be done inside 'updateLayout' methos.
	 * 
	 */	
	public class Container extends SpriteAdv
	{
		
		public function Container() : void
		{
			focusRect = false;
		}
		
		public function get backgroundAlpha() : Number
		{
			return _backgroundAlpha;
		}

		public function set backgroundAlpha(value:Number) : void
		{
			_backgroundAlpha = value;
			drawBackground();
		}

		public function get backgroundColor() : uint
		{
			return _backgroundColor;
		}

		public function set backgroundColor(value:uint) : void
		{
			_backgroundColor = value;
			drawBackground();
		}
		
		public function get backgroundTexture() : Class
		{
			return _backgroundTexture;
		}
		
		public function set backgroundTexture(value:Class) : void
		{
			removeTexture();
			_backgroundTexture = value;
			drawTexture();
		}
		
		public function get useBackgroundTexture() : Boolean
		{
			return _useBackgroundTexture;
		}
		
		public function set useBackgroundTexture(value:Boolean) : void
		{
			_useBackgroundTexture = value;
			drawTexture();
		}

		override public function get scaleY() : Number
		{
			return _scaleY;
		}
		
		/**
		 * 
		 * scaleY changing automatically causes changing of height.
		 * @param value
		 * 
		 */		
		override public function set scaleY(value:Number) : void
		{
			_scaleY = value;
			height = _height * _scaleY;
		}
		
		/**
		 * scaleX changing automatically causes changing of width.
		 * 
		 * @return 
		 * 
		 */		
		override public function get scaleX() : Number
		{
			return _scaleX;
		}
		
		override public function set scaleX(value:Number) : void
		{
			_scaleX = value;
			width = width * _scaleX;
		}
		
		override public function get height() : Number
		{
			return _height;
		}

		override public function set height(value:Number) : void
		{
			_height = value;
			updateLayout();
		}

		override public function get width() : Number
		{
			return _width;
		}

		override public function set width(value:Number) : void
		{
			_width = value;
			updateLayout()
		}
		
		/**
		 * Draw backround according to backgroundColor and backgroundAlpha.
		 * Can be used in inherited classes to draw custom backgrounds
		 */		
		protected function drawBackground() : void
		{
			removeTexture();			
			graphics.clear();
			if ( !isNaN(_width) && !isNaN(_height))
			{
				graphics.beginFill(_backgroundColor, _backgroundAlpha);
				graphics.drawRect(0, 0, width, height);
				graphics.endFill();
			}
		}
		
		
		/**
		 * removeTexture
		 * 
		 */		
		private function removeTexture() : void
		{
			if (_textureDO && contains(_textureDO))
			{
				removeChild(_textureDO);
				_textureDO = null;
			}
		}
		
		
		/**
		 * Draw backround according to backgroundColor and backgroundAlpha.
		 * Can be used in inherited classes to draw custom backgrounds
		 */		
		protected function drawTexture() : void
		{
			if (backgroundTexture 
				&& useBackgroundTexture 
				&& _width > 0 
				&& _height > 0
				&& !_textureDO)
			{
				graphics.clear();
				
				var tile:BitmapData = (new backgroundTexture() as Bitmap).bitmapData;
				var destination:BitmapData = new BitmapData(width, height);
				
				//fill the destination with tiles
				new TileImageDrawer(tile, destination).draw();
				
				var child:Bitmap = new Bitmap(destination);
				child.smoothing = true;
				
				_textureDO = child;
				_textureDO.alpha = backgroundAlpha;
				addChildAt(child, 0);
			}
		}
		
		override public function addChild(child:DisplayObject) : DisplayObject
		{
			child.addEventListener(Event.ADDED_TO_STAGE, onChildAddToStage);
			return super.addChild(child);
		}
		
		override public function addChildAt(child:DisplayObject, index:int) : DisplayObject
		{
			child.addEventListener(Event.ADDED_TO_STAGE, onChildAddToStage);
			return super.addChildAt(child, index);
		}
		
		override public function removeChild(child:DisplayObject) : DisplayObject
		{
			child.addEventListener(Event.REMOVED_FROM_STAGE, onChildRemoveFromStage);
			return super.removeChild(child);
		}
		
		override public function removeChildAt(index:int) : DisplayObject
		{
			var child:IEventDispatcher = getChildAt(index);
			if (child)
			{
				child.addEventListener(Event.REMOVED_FROM_STAGE, onChildRemoveFromStage);
			}
			return super.removeChildAt(index);
		}
		
		/**
		 * Call each time when dimensions have been changed or child has been added|removed.
		 * 
		 */		
		protected function updateLayout() : void
		{
			if (_useBackgroundTexture)
			{
				drawTexture();
			}
			else
			{
				drawBackground();
			}
		}
		
		/**
		 * Child add to stage handler.
		 * 
		 * @param event
		 * 
		 */			
		private function onChildAddToStage(event:Event) : void
		{
			var child:IEventDispatcher = event.currentTarget as IEventDispatcher;
			child.removeEventListener(Event.ADDED_TO_STAGE, onChildAddToStage);
			updateLayout();
		}
		
		/**
		 * Child remove from stage handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onChildRemoveFromStage(event:Event) : void
		{
			var child:IEventDispatcher = event.currentTarget as IEventDispatcher;
			child.removeEventListener(Event.REMOVED_FROM_STAGE, onChildRemoveFromStage);
			updateLayout();
		}
		
		private var _backgroundTexture:Class;
		private var _useBackgroundTexture:Boolean;
		private var _textureDO:DisplayObject;

		private var _width:Number = 0 ;
		private var _height:Number = 0;
		
		private var _backgroundColor:uint;
		private var _backgroundAlpha:Number = 0;
		
		private var _scaleX:Number = 1;
		private var _scaleY:Number = 1;
	}
}