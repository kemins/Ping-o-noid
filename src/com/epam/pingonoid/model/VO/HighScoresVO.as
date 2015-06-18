package com.epam.pingonoid.model.VO
{
	import com.epam.pingonoid.model.interfaces.ICloneable;

	public class HighScoresVO implements ICloneable
	{
		public static const GAME_TYPE_PINGPONG:String = "PingPong";
		public static const GAME_TYPE_PINGONOID:String = "Pingonoid";
		
		public var pingpongScores:Vector.<ScoreVO> = new Vector.<ScoreVO>();
		public var pingonoidScores:Vector.<ScoreVO> = new Vector.<ScoreVO>();
		
		/**
		 * Adding new score to the appropriate storage
		 *  
		 * @param gameType
		 * @param value
		 * 
		 */
		public function addScore(gameType:String, value:ScoreVO):void
		{
			var target:Vector.<ScoreVO>;
			
			if (gameType == GAME_TYPE_PINGPONG)
				target = pingpongScores;
			else if (gameType == GAME_TYPE_PINGONOID)
				target = pingonoidScores;
			else
				throw new Error("HighScoresVO::addScore() - unknown game type")
				
			if (target.length == 0)
			{
				// for empty storage 
				target.push(value)
			}
			else
			{
				var insertionPointFound:Boolean = false;
				
				for (var i:int = 0; i < target.length; i++)
				{
					if (value.points > ScoreVO(target[i]).points)
					{
						insertionPointFound = true;
						target.splice(i, 0, value);
						break;
					}
				}
				
				if (!insertionPointFound)
					target.push(value);
			}
		}

		public function clone(deepCopy:Boolean = true, target:Object = null):Object
		{
			var res:HighScoresVO = new HighScoresVO();
			
			if (!deepCopy)
			{
				trace ('HighScoresVO::clone() - shallow copy '); 
				trace ('Only references are copied, use this mode with caution');
				
				res.pingpongScores = this.pingpongScores;
				res.pingonoidScores = this.pingonoidScores;
			}
			else
			{
				var elem:ScoreVO;
				
				for each (elem in this.pingpongScores)
				{
					res.pingpongScores.push(elem.clone());
				}				
				for each (elem in this.pingonoidScores)
				{
					res.pingonoidScores.push(elem.clone());
				}
			}
			
			return res;
		}		
		
	}
}


