package com.epam.pingonoid.model.VO
{
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.model.interfaces.ICloneable;
	import com.epam.pingonoid.model.interfaces.IComparable;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class SettingsVO extends EventDispatcher implements ICloneable, IComparable
	{
		private var _player1Name:String = TextConstants.MODEL_PLAYER1_NAME;
		private var _player1Color:uint = 0xFFCCFF;
		
		private var _player2Name:String = TextConstants.MODEL_PLAYER2_NAME;			
		private var _player2Color:uint = 0x99FFFF;
		
		private var _soundOn:Boolean = true;
		
		private var _gameDuration:uint = SettingsConstants.GAME_DURATION;
		
		
		/**
		 * get gameDuration
		 * 
		 * @return 
		 * 
		 */		
		public function get gameDuration() : uint
		{
			return _gameDuration;
		}
                 
		/**
		 * set gameDuration
		 * @param value
		 * 
		 */		
		public function set gameDuration(value:uint) : void
		{
			if (_gameDuration != value)
			{
				_gameDuration = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		/**
		 * get soundOn
		 * 
		 */		
		public function get soundOn() : Boolean
		{
			return _soundOn;
		}

		
		/**
		 * set soundOn
		 * @return 
		 * 
		 */
		public function set soundOn(value:Boolean) : void
		{
			if (_soundOn != value)
			{
				_soundOn = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		
		/**
		 * get player2Color
		 * 
		 */		
		public function get player2Color() : uint
		{
			return _player2Color;
		}

		
		/**
		 * set player2Color
		 * @return 
		 * 
		 */	
		public function set player2Color(value:uint) : void
		{
			if (_player2Color != value)
			{
				_player2Color = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		
		/**
		 * get player2Name
		 * 
		 */
		public function get player2Name() : String
		{
			return _player2Name;
		}

		
		/**
		 * set player2Name
		 * @return 
		 * 
		 */
		public function set player2Name(value:String) : void
		{
			if (_player2Name != value)
			{
				_player2Name = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		
		/**
		 * get player1Color
		 * 
		 */
		public function get player1Color() : uint
		{
			return _player1Color;
		}

		
		/**
		 * set player1Color
		 * @return 
		 * 
		 */
		public function set player1Color(value:uint) : void
		{
			if (_player1Color != value)
			{
				_player1Color = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		
		/**
		 * get player1Name
		 * 
		 */
		public function get player1Name() : String
		{
			return _player1Name;
		}
		
		
		/**
		 * set player1Name
		 * @return 
		 * 
		 */
		public function set player1Name(value:String) : void
		{
			if (_player1Name != value)
			{
				_player1Name = value;
				dispatchEvent( new Event(Event.CHANGE) );
			}
		}

		
		/**
		 * clone
		 * 
		 * @param deepCopy
		 * @param target
		 * @return 
		 * 
		 */		
		public function clone(deepCopy:Boolean = false, target:Object = null):Object
		{
			var res:SettingsVO = new SettingsVO();
			
			res.player1Name = this.player1Name;
			res.player1Color = this.player1Color;
			
			res.player2Name = this.player2Name;
			res.player2Color = this.player2Color;
			
			res.soundOn = this.soundOn;
			res.gameDuration = this.gameDuration;
			
			return res;
		}
		
		
		/**
		 * equals
		 * 
		 * @param value
		 * @return 
		 * 
		 */		
		public function equals(value:*) : Boolean
		{
			var valueAsSettingsVO:SettingsVO = value as SettingsVO;
			if (valueAsSettingsVO)
			{
				return (player1Name == valueAsSettingsVO.player1Name) &&
					(player2Name == valueAsSettingsVO.player2Name) &&
					(player1Color == valueAsSettingsVO.player1Color) &&
					(player2Color == valueAsSettingsVO.player2Color) &&
					(soundOn == valueAsSettingsVO.soundOn) &&
					(gameDuration == valueAsSettingsVO.gameDuration);
			}
			else
			{
				return false;
			}
		}
	}
}

