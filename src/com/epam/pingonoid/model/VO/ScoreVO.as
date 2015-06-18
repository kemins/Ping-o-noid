package com.epam.pingonoid.model.VO
{
	import com.epam.pingonoid.model.interfaces.ICloneable;

	[RemoteClass]
	public class ScoreVO implements ICloneable
	{
		public var name:String;
		public var points:int;
		
		public function ScoreVO(name:String = "", points:int = -1)
		{
			super();
			
			this.name = name;
			this.points = points;
		}
		
		public function clone(deepCopy:Boolean = false, target:Object = null):Object
		{
			return new ScoreVO(name, points);
		}
	}	
}

