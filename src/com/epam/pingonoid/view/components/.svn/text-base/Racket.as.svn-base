package com.epam.pingonoid.view.components
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.controller.UserInputController;
	import com.epam.pingonoid.model.VO.BodyDataVO;
	import com.epam.pingonoid.view.World;
	import com.epam.pingonoid.view.components.walls.AbstractWall;
	
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;

	/**
	 * Racket
	 * 
	 */	
	public class Racket extends Sprite4Box2D
	{	
		private static const SHADOW_DISTANCE:int = 5;
		
		private var _isLeft:Boolean;
		private var _colorSprite:Sprite;
		
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function Racket(isLeft:Boolean)
		{
			this._isLeft = isLeft;
			filters = [new DropShadowFilter(SHADOW_DISTANCE)];

			drawTexture();
			super();
						
			setupColorSprite();
		}
		
		
		/**
		 * setupColorSprite
		 * 
		 */		
		private function setupColorSprite() : void
		{
			_colorSprite = new Sprite();
			addChild(_colorSprite);
		}
		
		
		/**
		 * setColor
		 * 
		 * @param value
		 * 
		 */		
		public function setColor(value:uint) : void
		{
			const V_PADDING:Number = 16;
			const H_PADDING:Number = 3;
			
			_colorSprite.x = -(width/2 + SHADOW_DISTANCE/2);
			_colorSprite.y = -(height/2);
			
			var g:Graphics = _colorSprite.graphics;
			g.clear();
			g.beginFill(value, 0.7);
			g.drawRect(H_PADDING + 1, V_PADDING, width - H_PADDING * 2, height - V_PADDING * 2);
			g.endFill();
		}
		
		
		/**
		 * setB2DBody
		 * 
		 */		
		override protected function setB2DBody() : void
		{			
			//create the box definition		
			bodyDef = new b2BodyDef();	
			bodyDef.type = b2Body.b2_staticBody;
			
			//set the fixture
			shapeDef               = new b2PolygonShape();
			b2PolygonShape(shapeDef).SetAsBox((width / 2) / SettingsConstants.SCALE_PIXELS_PER_METER, 
											 (height / 2) /SettingsConstants.SCALE_PIXELS_PER_METER)
			fixtureDef             = new b2FixtureDef();
			fixtureDef.shape       = shapeDef;
			fixtureDef.density     = 0.5;
			fixtureDef.friction    = 0.4;
			fixtureDef.restitution = 1;
			
			body = World.world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
		}
		
		
		/**
		 * getB2DData
		 * 
		 * @return 
		 * 
		 */		
		override protected function getB2DData() : BodyDataVO
		{
			return new BodyDataVO(_isLeft ? BodyType.LEFT_RACKET : BodyType.RIGHT_RACKET); 
		}
		
		
		/**
		 * drawTexture
		 * 
		 */		
		protected function drawTexture() : void
		{
			var b:Bitmap = Bitmap(new ImageConstants.RACKET_TEXTURE());
			b.smoothing = true;
			
			addChild(b);
			
			b.x -= b.width / 2 + SHADOW_DISTANCE/2;
			b.y -= b.height / 2;
		}
		
		/**
		 * reset
		 * 
		 */		
		public function reset() : void
		{
			setPosition(this.x, World.appHeight / 2);
		}	
		
		
		/**
		 * update 
		 * 
		 */		
		override public function update():void
		{
			super.update();
			navigate();
		}
				
		
		/**
		 * navigate
		 * 
		 */		
		private function navigate() : void
		{
			var step:Number = 0;
			if (_isLeft)
			{
				if (UserInputController.keyA)
				{
					step = - SettingsConstants.RACKET_FRAME_STEP;
				}
				else if (UserInputController.keyZ)
				{
					step = SettingsConstants.RACKET_FRAME_STEP;
				}
			}
			else
			{
				if (UserInputController.keyUp)
				{
					step = - SettingsConstants.RACKET_FRAME_STEP;
				}
				else if (UserInputController.keyDown)
				{
					step = SettingsConstants.RACKET_FRAME_STEP;
				}
			}
			
			if (step != 0)
			{
				var newY:Number = this.y + step;
				
				var minY:Number = AbstractWall.WALL_THICKNESS + height/2;
				var maxY:Number = World.appHeight - AbstractWall.WALL_THICKNESS - height/2;
				
				newY = Math.min(newY, maxY);
				newY = Math.max(newY, minY);
				
				setPosition(this.x, newY);
			}
		}
	}
}