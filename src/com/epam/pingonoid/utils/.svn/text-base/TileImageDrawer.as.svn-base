package com.epam.pingonoid.utils
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * TileImageDrawer
	 * 
	 */	
	public class TileImageDrawer
	{
		private var tile:BitmapData;
		private var destination:BitmapData;
		
		
		/**
		 * Constructor 
		 * 
		 * @param tile
		 * @param destination
		 * 
		 */		
		public function TileImageDrawer(tile:BitmapData, destination:BitmapData)
		{
			this.tile = tile;
			this.destination = destination;
			
			
		}
		
		
		/**
		 * draw
		 * 
		 */		
		public function draw() : void
		{
			var horizontalTilesCount:uint = Math.ceil(destination.width / tile.width);
			var verticalTilesCount:uint = Math.ceil(destination.height / tile.height);
			
			var rect:Rectangle = new Rectangle(0, 0, tile.width, tile.height);
			for (var i:int = 0; i < verticalTilesCount; ++i)
			{
				for (var j:int = 0; j < horizontalTilesCount; ++j)
				{
					destination.copyPixels(tile, rect, new Point(j * tile.width, i * tile.height));
				}
			}
		}
	}
}