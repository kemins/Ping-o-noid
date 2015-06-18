package com.epam.pingonoid.view.components.walls
{
	import com.epam.pingonoid.constants.BodyType;
	import com.epam.pingonoid.model.VO.BodyDataVO;

	public class RightWall extends AbstractWall
	{
		public function RightWall()
		{
			super(true);
		}
		
		override protected function get wX() : Number
		{
			return stageWidth-1;
		}
		
		override protected function get wY() : Number
		{
			return 0;
		}
		
		override protected function get wHeight() : Number
		{
			return stageHeight;
		}
		
		override protected function get wWidth() : Number
		{
			return 2;
		}
		
		
		/**
		 * getB2DData
		 * 
		 * @return 
		 * 
		 */		
		override protected function getB2DData() : BodyDataVO
		{
			return new BodyDataVO(BodyType.RIGHT_WALL);
		}
	}
}