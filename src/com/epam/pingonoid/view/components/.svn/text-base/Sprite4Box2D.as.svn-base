package com.epam.pingonoid.view.components
{
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.model.VO.BodyDataVO;
	import com.epam.pingonoid.utils.ErrorThrower;
	import com.epam.pingonoid.utils.MathUtils;

	/**
	 * Constructor 
	 * 
	 */	
	public class Sprite4Box2D extends SpriteAdv
	{
		protected var body:b2Body;
		protected var bodyDef:b2BodyDef;
		protected var fixtureDef:b2FixtureDef;
		protected var shapeDef:b2Shape;
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function Sprite4Box2D()
		{
			super();
			setB2D();
		}
		
		
		/**
		 * Final template method setB2D
		 * 
		 */		
		final protected function setB2D() : void
		{
			setB2DBody();
			
			body.SetUserData( getB2DData() );
		}
		
		/**
		 * Abstract getB2DData
		 * 
		 */		
		protected function getB2DData() : BodyDataVO
		{
			ErrorThrower.toBeOverridenError();
			return null;
		}
		
		/**
		 * Abstract setB2DBody
		 * 
		 */		
		protected function setB2DBody() : void
		{
			ErrorThrower.toBeOverridenError();
		}
		
		
		/**
		 * setPosition
		 * 
		 * @param x
		 * @param y
		 * 
		 */		
		public function setPosition(x:Number, y:Number) : void
		{
			body.SetPosition(new b2Vec2(x / SettingsConstants.SCALE_PIXELS_PER_METER, y / SettingsConstants.SCALE_PIXELS_PER_METER));
			this.x = x;
			this.y = y;
		}
		
		
		/**
		 * update 
		 * 
		 */		
		public function update():void
		{
			x = body.GetPosition().x * SettingsConstants.SCALE_PIXELS_PER_METER;
			y = body.GetPosition().y * SettingsConstants.SCALE_PIXELS_PER_METER;
			//trace(toString() + ": x=" + x + "; y=" + y);
			rotation  = MathUtils.radian2Degree(body.GetAngle());
		}
	}
}