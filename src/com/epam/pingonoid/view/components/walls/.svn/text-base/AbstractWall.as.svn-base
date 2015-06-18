package com.epam.pingonoid.view.components.walls
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.utils.ErrorThrower;
	import com.epam.pingonoid.utils.TileImageDrawer;
	import com.epam.pingonoid.view.World;
	import com.epam.pingonoid.view.components.Sprite4Box2D;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	/**
	 * AbstractWall
	 * 
	 */	
	public class AbstractWall extends Sprite4Box2D
	{
		public static const WALL_THICKNESS:int = 40;
		
		/**
		 *	Constructor 
		 * 
		 */		
		public function AbstractWall(skipTexture:Boolean = false)
		{
			super();
			if (!skipTexture)
				drawTexture();
		}
		
		
		/**
		 * textureClass
		 * @return 
		 * 
		 */		
		protected function get textureClass() : Class
		{
			return ImageConstants.WALL_TILE_TEXTURE;
		}
		
		
		/**
		 * setB2DBody
		 * 
		 */		
		override protected function setB2DBody() : void
		{
			//create the box definition		
			shapeDef               = new b2PolygonShape();
			bodyDef                = new b2BodyDef();	
			fixtureDef             = new b2FixtureDef();
			
			//create the boxdef
			b2PolygonShape(shapeDef).SetAsBox((wWidth / 2) / SettingsConstants.SCALE_PIXELS_PER_METER, 
											  (wHeight / 2) / SettingsConstants.SCALE_PIXELS_PER_METER);
			bodyDef.type = b2Body.b2_staticBody;
			
			//set the fixture
			fixtureDef.shape       = shapeDef;
			fixtureDef.density     = 1;
			fixtureDef.friction    = 0.3;
			fixtureDef.restitution = 1;
			
			body = World.world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);	
			
			//position of B2D is related to the center of body but not top-left corner
			body.SetPosition(new b2Vec2((wX + wWidth / 2) / SettingsConstants.SCALE_PIXELS_PER_METER, 
										(wY + wHeight / 2) / SettingsConstants.SCALE_PIXELS_PER_METER));
		}
						
		
		/**
		 * drawTexture
		 * 
		 */		
		protected function drawTexture() : void
		{
			if (!textureClass) return;
			
			var tile:BitmapData = (new textureClass() as Bitmap).bitmapData;
			var destination:BitmapData = new BitmapData(wWidth, wHeight);
			
			//fill the destination with tiles
			new TileImageDrawer(tile, destination).draw();
			
			var child:Bitmap = new Bitmap(destination);
			child.smoothing = true;
			
			var texture:DisplayObject = addChild(child);
			texture.x = wX;
			texture.y = wY;
		}
		
		
		/**
		 * stageWidth
		 * @return 
		 * 
		 */		
		protected function get stageWidth() : Number
		{
			return World.appWidth;
		}
		
		
		/**
		 * stageHeight
		 * @return 
		 * 
		 */		
		protected function get stageHeight() : Number
		{
			return World.appHeight;
		}
		
		
		//methods to be overriden 
		protected function get wX() : Number
		{
			ErrorThrower.toBeOverridenError();
			return 0;
		}
		
		protected function get wY() : Number
		{
			ErrorThrower.toBeOverridenError();
			return 0;
		}
		
		protected function get wHeight() : Number
		{
			ErrorThrower.toBeOverridenError();
			return 0;
		}
		
		protected function get wWidth() : Number
		{
			ErrorThrower.toBeOverridenError();
			return 0;
		}
		
	}
}