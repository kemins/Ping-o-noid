package com.epam.pingonoid.view.components.walls
{
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.model.VO.BodyDataVO;
	
	import flash.filters.DropShadowFilter;

	public class TopWall extends AbstractWall
	{
		public function TopWall()
		{
			super();
			filters = [new DropShadowFilter(5, 45, 0, 0.8)];
		}
		
		override protected function get wX() : Number
		{
			return 0
		}
		
		override protected function get wY() : Number
		{
			return 0;
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