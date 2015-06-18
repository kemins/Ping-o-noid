package com.epam.pingonoid.controller.managers
{
	import com.epam.pingonoid.controller.managers.soundMangerClasses.SoundInfo;
	import com.epam.pingonoid.utils.ArrayUtils;
	
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundManager
	{
		
		private var _soundOn:Boolean;
		
		/**
		 * Constructor
		 * 
		 * @param privateClass
		 * 
		 */		
		public function SoundManager(privateClass:PrivateClass)
		{
			if (_instance)
			{
				throw new IllegalOperationError("Instance already exists.");
			}
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function get soundOn() : Boolean
		{
			return _soundOn;
		}

		/**
		 * 
		 * @param value
		 * 
		 */		
		public function set soundOn(value:Boolean) : void
		{
			_soundOn = value;
			if (!_soundOn)
			{
				stopAll();
			}
		}

		/**
		 * Play new 'soundClass' sound.
		 *  
		 * @param soundClass
		 * @param stopTheSameSounds
		 * 
		 */		
		public function play(sound:Sound, stopTheSameSounds:Boolean = true) : void
		{
		
			if (!_soundOn) return;
			if (stopTheSameSounds)
			{
				stopByPropertyValue("sound", sound);
			}
			
			var soundChannel:SoundChannel = sound.play();
			var soundInfo:SoundInfo = new SoundInfo();
			soundInfo.sound = sound;
			soundInfo.soundChannel = soundChannel;
			
			soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			_activeSounds.push(soundInfo);
		}
		
		
		/**
		 * Stop all sounds.
		 * 
		 */		
		public function stopAll() : void
		{
			for each (var info:SoundInfo in _activeSounds)
			{
				info.soundChannel.stop();
				info.soundChannel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			}
			
			_activeSounds = [];
		}
		
		/**
		 * Stop sound by criterion.
		 * 
		 */		
		private function stopByPropertyValue(property:Object, value:Object) : void
		{
			var info:SoundInfo = 
				ArrayUtils.removeItemByPropertyValue(_activeSounds, property, value) as SoundInfo;
			
			if (info)
			{
				info.soundChannel.stop();
			}
		}
		
		/**
		 * 
		 * @return singletone instance. 
		 * 
		 */		
		public static function get instance():SoundManager
		{
			if (!_instance)
			{
				_instance = new SoundManager( new PrivateClass() );
			}
			
			return _instance;
		}
		
		/**
		 * Sound complete handler.
		 *  
		 * @param event
		 * 
		 */		
		private function onSoundComplete(event:Event) : void
		{
			var soundChannel:SoundChannel = event.currentTarget as SoundChannel;
			soundChannel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			ArrayUtils.removeItemByPropertyValue(_activeSounds, "soundChannel", soundChannel);
		}
		
		
		private static var _activeSounds:Array = [];
		
		private static var _instance:SoundManager;
	}
	
}

class PrivateClass{}