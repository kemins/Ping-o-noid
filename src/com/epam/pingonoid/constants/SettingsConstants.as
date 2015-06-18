package com.epam.pingonoid.constants
{
	public class SettingsConstants
	{
		//b2d
		public static const DEBUG_B2D:Boolean = false;
		public static const SCALE_PIXELS_PER_METER:Number = 30.0;
		
		//game play
		public static const GAME_DURATION:int = 60 * 2;//sec
		public static const GAME_MIN_DURATION:int = 30;//sec
		public static const GAME_MAX_DURATION:int = 60 * 10;//sec
		
		//ball
		public static const MIN_BALL_LIN_X_VELOCITY:Number = 14;
		public static const STEP_BALL_LIN_X_INCREASE:Number = 0.6;
		public static const STEP_BALL_TIME:Number = 2; //sec
		public static const INIT_BALL_IMPULSE:Number = 0.05; //kg-m/s.
		
		//rackets
		public static const RACKET_FRAME_STEP:Number = 14;
	}
}