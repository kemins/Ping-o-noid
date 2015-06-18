package com.epam.pingonoid.view.events
{
	import com.epam.pingonoid.model.VO.SettingsVO;
	
	import flash.events.Event;
	
	public class SettingsFormEvent extends Event
	{
		public static const SAVE_SETTINGS:String = "saveSettings";
		public static const BACK_TO_MENU:String = "backToMenu";
		
		public var settings:SettingsVO;
		
		public function SettingsFormEvent(type:String, settings:SettingsVO=null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.settings = settings;
		}
		
		override public function clone() : Event
		{
			return new SettingsFormEvent(type, settings, bubbles, cancelable);
		}
	}
}