package com.epam.pingonoid.view.components
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.model.VO.BodyDataVO;
	import com.epam.pingonoid.view.World;
	
	import flash.display.Bitmap;
	import flash.filters.DropShadowFilter;

	public class Ball extends Sprite4Box2D
	{		
		private var minLinXVelocity:Number = SettingsConstants.MIN_BALL_LIN_X_VELOCITY;
		private var frameCounter:int = 0;
				
		
		/**
		 * Constructor
		 * 
		 */		
		public function Ball()
		{
			drawTexture();
			super();
			filters = [new DropShadowFilter(2)];
		}
		
		
		/**
		 * setB2D
		 * 
		 */		
		override protected function setB2DBody() : void
		{
			//create the box definition		
			bodyDef = new b2BodyDef();	
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.angle = 45;
			
			//set the fixture
			shapeDef               = new b2CircleShape((width / 2) / SettingsConstants.SCALE_PIXELS_PER_METER);
			fixtureDef             = new b2FixtureDef();
			fixtureDef.shape       = shapeDef;
			fixtureDef.density     = 0.05;
			fixtureDef.friction    = 0.2;
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
		override protected function getB2DData(): BodyDataVO
		{
			return new BodyDataVO(BodyType.BALL);
		}
				
		
		/**
		 * drawTexture
		 * 
		 */		
		protected function drawTexture() : void
		{
			var b:Bitmap = Bitmap(new ImageConstants.BALL_TEXTURE());
			b.smoothing = true;
			
			addChild(b);
			
			b.x -= b.width / 2;
			b.y -= b.height / 2;
		}
		
		
		/**
		 * stop
		 * 
		 */		
		public function stop() : void
		{
			body.SetAwake(false);
			minLinXVelocity = SettingsConstants.MIN_BALL_LIN_X_VELOCITY;
			frameCounter = 0;
		}
				
		
		/**
		 * Push the ball
		 * 
		 */		
		public function start(leftSideToFly:Boolean) : void
		{
			var xP:Number = World.appWidth / 2;
			var yP:Number = Math.random() * World.appHeight;
			/*
			body.ApplyForce(new b2Vec2(SettingsConstants.INIT_BALL_IMPULSE, 0), 
							new b2Vec2(xP/SettingsConstants.SCALE_PIXELS_PER_METER, yP / SettingsConstants.SCALE_PIXELS_PER_METER));*/
			
			var linX:Number = SettingsConstants.MIN_BALL_LIN_X_VELOCITY;
			linX = leftSideToFly ? -linX : linX;
			
			body.SetLinearVelocity(new b2Vec2(linX, correctLinYVelocity(0)));
			body.SetAwake(true);
		}
		
		
		/**
		 * update 
		 * 
		 */		
		override public function update():void
		{
			super.update();
			
			if (body.IsActive())
			{
				var lv:b2Vec2 = body.GetLinearVelocity();
				
				if (++frameCounter > (Main.FRAME_RATE * SettingsConstants.STEP_BALL_TIME))
				{
					frameCounter = 0;
					minLinXVelocity += SettingsConstants.STEP_BALL_LIN_X_INCREASE;
				}
				
				//update linear X velocity
				var lvX:Number = lv.x;
				if (Math.abs(lvX) < minLinXVelocity)
				{
					lvX = (lvX > 0) ? minLinXVelocity : -minLinXVelocity
				}
				
				//update linear Y velocity
				var lvY:Number = correctLinYVelocity(lv.y);
				
				body.SetLinearVelocity(new b2Vec2(lvX, lvY));
			}
		}
		
		
		/**
		 * correctLinYVelocity
		 * 
		 * @return 
		 * 
		 */		
		private function correctLinYVelocity(inputLinYVelocity:Number) : Number
		{
			const MIN_Y_ABS:Number = 3;
			const MAX_Y_ABS:Number = 10;
			
			if (inputLinYVelocity > 0)
			{
				while (inputLinYVelocity < MIN_Y_ABS)
				{
					inputLinYVelocity = Math.random() * MAX_Y_ABS;
				}
			}
			else
			{
				while (inputLinYVelocity > -MIN_Y_ABS)
				{
					inputLinYVelocity = -Math.random() * MAX_Y_ABS;
				}
			}
			return inputLinYVelocity;
		}
		
	}
}