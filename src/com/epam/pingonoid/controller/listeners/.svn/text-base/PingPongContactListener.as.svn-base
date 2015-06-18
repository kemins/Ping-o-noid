package com.epam.pingonoid.controller.listeners
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.b2Fixture;
	
	import com.epam.pingonoid.view.events.CollisionEvent;
	
	import flash.events.IEventDispatcher;
	
	public class PingPongContactListener extends b2ContactListener
	{
		private var _dispatcher:IEventDispatcher;
		
		public function PingPongContactListener(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
		}
		
		override public function BeginContact(contact:b2Contact) : void
		{
			var fixtureA:b2Fixture = contact.GetFixtureA();
			var fixtureB:b2Fixture = contact.GetFixtureB();
			
			var body1:b2Body = fixtureA.GetBody();
			var body2:b2Body = fixtureB.GetBody();
			
			_dispatcher.dispatchEvent( new CollisionEvent(CollisionEvent.COLLISION_HAPPENED, body1, body2) );
			
		}
	}
}