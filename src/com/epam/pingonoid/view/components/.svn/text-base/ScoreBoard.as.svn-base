package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.utils.MathUtils;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * ScoreBoard
	 * 
	 */	
	public class ScoreBoard extends AbstractBoard
	{
		
		private var leftPlayerName:String; 
		private var rightPlayerName:String;
		
		private var leftPlayerColor:uint; 
		private var rightPlayerColor:uint;
		
		private var playerNameLeft:TextFieldAdv;
		private var playerNameRight:TextFieldAdv;
		
		private var playerScoreLeft:TextFieldAdv;
		private var playerScoreRight:TextFieldAdv;
		
		
		/**
		 * Constructor
		 * 
		 */		
		public function ScoreBoard()
		{
			if (!playerNameLeft)
			{
				playerNameLeft = new TextFieldAdv("", TextFormats.scoreBoardNameFormat, Filters.getDefaultGlow());
				addChild(playerNameLeft);
			}
			
			if (!playerNameRight)
			{
				playerNameRight = new TextFieldAdv("", TextFormats.scoreBoardNameFormat, Filters.getDefaultGlow());
				addChild(playerNameRight);
			}
			
			if (!playerScoreLeft)
			{
				playerScoreLeft = new TextFieldAdv("", TextFormats.scoreBoardScoreFormat, Filters.getDefaultGlow());
				addChild(playerScoreLeft);
			}
			
			if (!playerScoreRight)
			{
				playerScoreRight = new TextFieldAdv("", TextFormats.scoreBoardScoreFormat, Filters.getDefaultGlow());
				addChild(playerScoreRight);
			}
			
			super();			
		}
		
				
		/**
		 * shapeRectangle
		 * 
		 * @return 
		 * 
		 */		
		override protected function get shapeRectangle() : Rectangle
		{
			var h:Number = height - GAP/2;
			var w:Number = width + GAP * 2;
			var ty:Number = (height - h) / 2;
			return new Rectangle(0, ty, w, h);
		}
		
		
		/**
		 * drawShape
		 * 
		 */		
		override protected function drawShape() : void
		{
			var r:Rectangle = shapeRectangle;
			graphics.drawRoundRectComplex(-GAP, r.y, r.width, r.height, 6, 25, 25, 6);
		}
		
		
		/**
		 * setLeftPlayerNameColor
		 * 
		 * @param name
		 * @param color
		 * 
		 */		
		public function setLeftPlayerNameColor(name:String, color:uint) : void
		{
			playerNameLeft.text = name;
			playerNameLeft.color = color;
			playerScoreLeft.color = color;
			updateLayout();
		}
		
		
		/**
		 * setRightPlayerNameColor
		 * 
		 * @param name
		 * @param color
		 * 
		 */		
		public function setRightPlayerNameColor(name:String, color:uint) : void
		{
			playerNameRight.text = name;
			playerNameRight.color = color;
			playerScoreRight.color = color;
			updateLayout();
		}
		
		
		/**
		 * setRightPlayerNameColor
		 * 
		 * @param name
		 * @param color
		 * 
		 */		
		public function setScore(scoreLeft:int, scoreRight:int) : void
		{
			playerScoreLeft.text = String(scoreLeft);
			playerScoreRight.text = String(scoreRight);
			updateLayout();
		}
		
		
		/**
		 * updateLayout
		 * 
		 */		
		override protected function updateLayout() : void
		{			
			if (playerScoreLeft && playerScoreRight && playerNameLeft && playerNameRight)
			{	
				//x
				playerNameLeft.x 	= 0;
				playerScoreLeft.x 	= playerNameLeft.x + playerNameLeft.width + GAP;
				playerScoreRight.x 	= playerScoreLeft.x + playerScoreLeft.width + GAP;
				playerNameRight.x 	= playerScoreRight.x + playerScoreRight.width + GAP;
				
				//y
				playerScoreLeft.y = playerScoreRight.y = -2;
				playerNameLeft.y = playerNameRight.y = playerScoreLeft.y + 7;
			}
			super.updateLayout();
		}
	}
}