package com.epam.pingonoid.model.VO
{
	public class BodyDataVO
	{
		public var type:String;
		public var data:Object;
		
		public function BodyDataVO(type:String, data:Object = null)
		{
			this.type = type;
			this.data = data;
		}
		
	}
}