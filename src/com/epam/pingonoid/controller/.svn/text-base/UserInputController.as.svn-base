package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.view.World;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * UserInputController
	 * 
	 */	
	public class UserInputController
	{
		public static var mouseDown:Boolean;
		
		//left racket
		public static var keyA:Boolean;
		public static var keyZ:Boolean;
		
		//right racket
		public static var keyUp:Boolean;
		public static var keyDown:Boolean;
		
		//push the ball from racket
		public static var space:Boolean;
		
		// pause game
		public static var keyEsc:Boolean;
		
		/**
		 * Constructor 
		 * 
		 */		
		public function UserInputController()
		{
			World.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			World.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			World.stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			World.stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
		}
	
		
		/**
		 * keyDownHandler
		 * 
		 * @param e
		 * 
		 */		
		private function keyDownHandler(e:KeyboardEvent):void
		{
			e.stopImmediatePropagation();
			e.preventDefault();
						
			switch(e.keyCode)
			{
				case Keyboard.UP:
					UserInputController.keyUp = true;
					UserInputController.keyDown = false;
					break;
				case Keyboard.DOWN:
					UserInputController.keyUp = false;
					UserInputController.keyDown = true;
					break;
				case Keyboard.A:
					UserInputController.keyA = true;
					UserInputController.keyZ = false;
					break;
				case Keyboard.Z:
					UserInputController.keyA = false;
					UserInputController.keyZ = true;
					break;
				case Keyboard.SPACE:
					UserInputController.space = true;
					break;
				case Keyboard.ESCAPE:
					UserInputController.keyEsc = true;
					break;
			}
		}
		
		
		/**
		 * keyUpHandler
		 * 
		 * @param e
		 * 
		 */		
		private function keyUpHandler(e:KeyboardEvent):void
		{
			e.stopImmediatePropagation();
			e.preventDefault();
			
			switch(e.keyCode)
			{
				case Keyboard.UP:
					UserInputController.keyUp = false;
					break;
				case Keyboard.DOWN:
					UserInputController.keyDown = false;
					break;
				case Keyboard.A:
					UserInputController.keyA = false;
					break;
				case Keyboard.Z:
					UserInputController.keyZ = false;
					break;
				case Keyboard.SPACE:
					UserInputController.space = false;
					break;				
				case Keyboard.ESCAPE:
					UserInputController.keyEsc = false;
					break;
			}
		}
		
		
		/**
		 * reset
		 * 
		 */		
		public static function reset():void
		{
			UserInputController.keyUp = false;
			UserInputController.keyDown = false;
			UserInputController.keyA = false;
			UserInputController.keyZ = false;
			UserInputController.space = false;
			UserInputController.keyEsc = false;
		}
		
		
		/**
		 * mouseDownHandler
		 * 
		 * @param e
		 * 
		 */		
		private function mouseDownHandler (e:MouseEvent):void
		{
			mouseDown = true;
		}
		
		
		/**
		 * mouseUpHandler
		 * 
		 * @param e
		 * 
		 */		
		private function mouseUpHandler (e:MouseEvent):void
		{
			mouseDown = false;
		}
	}
}