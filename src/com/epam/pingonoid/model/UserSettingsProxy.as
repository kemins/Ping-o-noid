package com.epam.pingonoid.model
{
	import com.epam.pingonoid.model.VO.HighScoresVO;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.model.VO.SettingsVO;
	
	import flash.net.SharedObject;
	import flash.net.registerClassAlias;

	public class UserSettingsProxy extends AbstractProxy
	{
		
		/**
		 *	Constants for names of stored items 
		 */
		public static const SETTINGS_VO:String = "settingsVO";		
		public static const HIGH_SCORES_VO:String = "highScoresVO";
		
		/**
		 * Proxy name. 
		 */		
		public static const NAME:String = "UserSettingsProxy";
		
		/**
		 * Error notification.
		 */		
		public static const SHARED_OBJECT_ERROR:String = NAME + ".SHARED_OBJECT_ERROR";
		
		/**
		 * Shared object name.
		 */		
		public static const SO_NAME:String = "userSettings";
		
		/**
		 * Constructor
		 * 
		 */		
		public function UserSettingsProxy()
		{
			super(NAME);
			
			try
			{
				registerClassAlias("SettingsVO", SettingsVO);
				registerClassAlias("HighScoresVO", HighScoresVO);
				registerClassAlias("ScoreVO", ScoreVO);
				
				_so = SharedObject.getLocal(SO_NAME);
			}
			catch ( e:Error )
			{
				sendNotification(SHARED_OBJECT_ERROR, e);
			}
		}
		
		// ------------------ Stored items
		
		/**
		 * Game settings getter
		 * @return 
		 * 
		 */		
		public function get settingsVO() : SettingsVO
		{
			return this.getAsObject( SETTINGS_VO ) as SettingsVO;
		}		
		
		/**
		 * High scores setter 
		 * @param value
		 * 
		 */		
		public function set settingsVO(value:SettingsVO) : void
		{
			this.setAsObject( SETTINGS_VO, value );
		}		

		/**
		 * High scores getter
		 * @return 
		 * 
		 */		
		public function get highScoresVO() : HighScoresVO
		{
			return this.getAsObject( HIGH_SCORES_VO ) as HighScoresVO;
		}		
		
		/**
		 * High scores setter 
		 * @param value
		 * 
		 */		
		public function set highScoresVO(value:HighScoresVO) : void
		{
			this.setAsObject( HIGH_SCORES_VO, value );
		}			

		// ------------------- Generic functions
		
		/**
		 * Retrieve a value from the SharedObject instance, cast as an integer.
		 *  
		 * @param key
		 * @return 
		 * 
		 */		
		public function getAsInt(key:String) : int
		{
			return int ( getAsObject(key) );
		}
		
		/**
		 * Retrieve a value from the SharedObject instance, cast as a String.
		 *  
		 * @param key
		 * @return 
		 * 
		 */		
		public function getAsString(key:String) : String
		{
			return String ( getAsObject(key) );	
		}
		
		/**
		 * Retrieve a value from the SharedObject instance, cast as a Number. 
		 * @param key
		 * @return 
		 * 
		 */		
		public function getAsNumber(key:String) : Number
		{
			return Number( getAsObject(key) );
		}
		
		/**
		 * Retrieve a value from the SharedObject instance, cast as a Boolean value. 
		 * 
		 * @param key
		 * @return 
		 * 
		 */		
		public function getAsBoolean(key:String) : Boolean
		{
			return Boolean( getAsObject(key) );
		}
		
		/**
		 * Retrieves a value from the SharedObject instance. 
		 * 
		 * @param key
		 * @return 
		 * 
		 */		
		public function getAsObject(key:String) : Object
		{
			var retVal:Object = null;
			
			if ( key == null || key == "" )
			{
				throw new Error("Invalid key");
			}		
			
			if (_so)
			{
				retVal = _so.data[key];
			}
			
			return retVal;
		}
		
		/**
		 * Set a value as an Object. 
		 * @param key
		 * @param value
		 * 
		 */		
		public function setAsObject(key:String, value:Object = null) : void
		{
			if ( key == null || key == "" )
			{
				throw new Error("Invalid key");
			}		
			
			if (_so)
			{
				_so.data[key] = value;
				_so.flush();	
			}
		}
		
		/**
		 * The SharedObject instance.  
		 */		
		private var _so:SharedObject;
		
	}
}