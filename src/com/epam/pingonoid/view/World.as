package com.epam.pingonoid.view
{
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.controller.managers.SpriteManager;
	
	import flash.display.Sprite;
	import flash.display.Stage;

	public class World
	{	
		public static var world:b2World;
		public static var appWidth:Number;
		public static var appHeight:Number;
		
		private static var debugDraw:b2DebugDraw;
		private static var debugSprite:Sprite;
		private static var mainView:Sprite;
		
		private static var m_velocityIterations:int = 10.0;
		private static var m_positionIterations:int = 10.0;
		private static var m_timeStep:Number        = 1 / Main.FRAME_RATE;
		
		
		/**
		 * Constructor
		 * 
		 */		
		public function World(view:Sprite) 
		{
			//create the world
			world = new b2World(new b2Vec2(0, 0), true);
			world.SetWarmStarting(true);
			mainView = view;
			appWidth = view.stage.stageWidth;
			appHeight = view.stage.stageHeight;	
			
			// set debug draw
			if (SettingsConstants.DEBUG_B2D)
			{
				debugDraw   = new b2DebugDraw();
				debugSprite = new Sprite();
				debugDraw.SetSprite(debugSprite);
				debugDraw.SetDrawScale(SettingsConstants.SCALE_PIXELS_PER_METER);
				debugDraw.SetFillAlpha(0.3);
				debugDraw.SetLineThickness(1.0);
				debugDraw.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
				world.SetDebugDraw(debugDraw);
				mainView.addChild(debugSprite);
			}
		}
						
		
		public static function get stage() : Stage
		{
			return mainView.stage;
		}
		
		
		/**
		 * update
		 * 
		 */		
		public function update():void
		{			
			world.DrawDebugData();
			world.Step(m_timeStep, m_velocityIterations, m_positionIterations);
			world.ClearForces();			
		}		
	}
}