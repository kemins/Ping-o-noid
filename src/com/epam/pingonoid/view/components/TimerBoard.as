package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.utils.MathUtils;
	
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import org.osmf.layout.ScaleMode;

	public class TimerBoard extends AbstractBoard
	{
		private var radius:Number = 16;
		private var timer:Sprite;
		
		
		/**
		 * Constructor
		 * 
		 */		
		public function TimerBoard()
		{
			super(3);
			timer = new Sprite();
			timer.x = timer.y = radius;
			addChild(timer);
		}
		
		
		/**
		 * shapeRectangle
		 * 
		 * @return 
		 * 
		 */		
		override protected function get shapeRectangle() : Rectangle
		{
			var tx:Number = radius;
			var ty:Number = radius;
			return new Rectangle(tx, ty, radius * 2, radius * 2);
		}
		
		
		/**
		 * drawShape
		 * 
		 */		
		override protected function drawShape() : void
		{
			var r:Rectangle = shapeRectangle;
			graphics.drawCircle(r.x, r.y, r.width/2);
		}
		
		
		/**
		 * updateLayout
		 * 
		 */		
		override protected function updateLayout() : void
		{			
			super.updateLayout();
			
		}
		
		
		/**
		 * reset
		 * 
		 */		
		public function reset() : void
		{
			timer.graphics.clear();
		}
		
		
		/**
		 * update
		 * 
		 */		
		public function update(currFrameTime:int, duration:uint) : void
		{	
			var renderAngle:Number = -90;
			var currAngle:Number = (currFrameTime * 360) / (duration * 60) + renderAngle;
			
			
			var xCurr:Number = Math.cos(MathUtils.degree2Radian(currAngle)) * radius;
			var yCurr:Number = Math.sin(MathUtils.degree2Radian(currAngle)) * radius;
			
			var g:Graphics = timer.graphics;
			g.clear();
			g.lineStyle(2, 0xff0000, 1, false, ScaleMode.NONE, CapsStyle.NONE);
			
			var xP:Number;
			var yP:Number;
			while (renderAngle < currAngle)
			{
				if (renderAngle%6 == 0)
				{
					xP = Math.cos(MathUtils.degree2Radian(renderAngle)) * radius;
					yP = Math.sin(MathUtils.degree2Radian(renderAngle)) * radius;
					g.moveTo(0, 0);
					g.lineTo(xP, yP);
				}
				++renderAngle;
			}
			
			g.endFill();
		}
	}
}