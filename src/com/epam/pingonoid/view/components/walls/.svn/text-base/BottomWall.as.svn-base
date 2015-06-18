package com.epam.pingonoid.view.components.walls
{
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.model.VO.BodyDataVO;
	
	import flash.filters.DropShadowFilter;

	public class BottomWall extends AbstractWall
	{	
		public function BottomWall()
		{
			super();
			filters = [new DropShadowFilter(5, -45, 0, 0.6)];
		}
		
		override protected function get wX() : Number
		{
			return 0;
		}
		
		override protected function get wY() : Number
		{
			return stageHeight - wHeight;
		}
		
		override protected function get wHeight() : Number
		{
			return WALL_THICKNESS;
		}
		
		override protected function get wWidth() : Number
		{
			return stageWidth;
		}
		
		/**
		 * getB2DData
		 * 
		 * @return 
		 * 
		 */		
		override protected function getB2DData() : BodyDataVO
		{
			return new BodyDataVO(BodyType.TOP_BOTTOM_WALL);
		}
	}
}