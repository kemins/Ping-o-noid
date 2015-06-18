package com.epam.pingonoid.view.events
{
	import Box2D.Dynamics.b2Body;
	
	import com.epam.pingonoid.model.VO.BodyDataVO;
	
	import flash.events.Event;
	
	public class CollisionEvent extends Event
	{
		public static const COLLISION_HAPPENED:String = "collisionHappened"; 
		
		private var _body1:b2Body;
		private var _body2:b2Body;
		
		public function CollisionEvent(type:String, body1:b2Body, body2:b2Body, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_body1 = body1;
			_body2 = body2;
		}
		
		public function get body1() : b2Body
		{
			return _body1;
		}
		
		public function get body2() : b2Body
		{
			return _body2;
		}
		
		public function get body1Data() : BodyDataVO
		{
			return _body1 ? _body1.GetUserData() : null;
		}
		
		public function get body2Data() : BodyDataVO
		{
			return _body2 ? _body2.GetUserData() : null;
		}
		
		public function get body1Type() : String
		{
			return body1Data ? body1Data.type : null;
		}
		
		public function get body2Type() : String
		{
			return body2Data ? body2Data.type : null;
		}
		
		override public function clone() : Event
		{
			return new CollisionEvent(type, _body1, _body2, bubbles, cancelable);
		}
		
	}
}