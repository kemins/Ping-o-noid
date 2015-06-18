package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.utils.ErrorThrower;
	import com.epam.pingonoid.utils.MathUtils;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	public class AbstractBoard extends SpriteAdv
	{
		
		protected const GAP:int = 15;
		
		
		/**
		 * Constructor
		 * 
		 */		
		public function AbstractBoard(bevelDist:Number = 4.0)
		{
			super();
			
			filters = [new DropShadowFilter(2),
					   new BevelFilter(bevelDist)];
			updateLayout();			
		}
		
		
		/**
		 * updateLayout
		 * 
		 */		
		protected function updateLayout() : void
		{	
			drawBackground();			
		}
		
		
		/**
		 * Draw gradient backround.
		 * Can be used in inherited classes to draw custom backgrounds
		 */		
		protected function drawBackground() : void
		{
			graphics.clear();			
			
			if ( !isNaN(width) && !isNaN(height))
			{				
				var r:Rectangle = shapeRectangle;
				var matrix:Matrix = new Matrix();
				matrix.createGradientBox(r.width, r.height, MathUtils.degree2Radian(90), -GAP, r.y);
				var colors:Array = [0xf2f2f2, 0xd4cdc7];
				var alphas:Array = [1.0, 1.0];
				var ratios:Array = [0, 255];
				graphics.lineStyle(1, 0xb3b3b3, 1, true);
				graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix, SpreadMethod.PAD);
				
				drawShape();
				
				graphics.endFill();
			}
		}
		
		
		/**
		 * shapeRectangle
		 * 
		 * @return 
		 * 
		 */		
		protected function get shapeRectangle() : Rectangle
		{
			ErrorThrower.toBeOverridenError();
			return null;
		}
		
		
		/**
		 * drawShape
		 * 
		 */		
		protected function drawShape() : void
		{
			ErrorThrower.toBeOverridenError();
		}
	}
}