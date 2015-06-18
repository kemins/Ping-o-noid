package com.epam.pingonoid.constants
{
	import flash.media.Sound;

	public class SoundConstants
	{
		[Embed(source='com/epam/pingonoid/assets/sounds/ball_racket.mp3')]
		public static const BALL_RACKET_CLASS:Class;
		
		public static const BALL_RACKET_SOUNDS:Sound = new BALL_RACKET_CLASS();
		
		[Embed(source='com/epam/pingonoid/assets/sounds/ball_wall.mp3')]
		public static const BALL_WALL_CLASS:Class;
		public static const BALL_WALL_SOUND:Sound = new BALL_WALL_CLASS();
		
		[Embed(source='com/epam/pingonoid/assets/sounds/ball_missed.mp3')]
		public static const MISSED_BALL_CLASS:Class;
		public static const MISSED_BALL_SOUND:Sound = new MISSED_BALL_CLASS();
		
		[Embed(source='com/epam/pingonoid/assets/sounds/click.mp3')]
		public static const CLICK_CLASS:Class;
		public static const CLICK_SOUND:Sound = new CLICK_CLASS();
		
		[Embed(source='com/epam/pingonoid/assets/sounds/ovation.mp3')]
		public static const OVATION_CLASS:Class;
		public static const OVATION_SOUND:Sound = new OVATION_CLASS();
		
	}
}