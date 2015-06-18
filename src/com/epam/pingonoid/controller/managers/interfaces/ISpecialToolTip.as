package com.epam.pingonoid.controller.managers.interfaces
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;

	public interface ISpecialToolTip extends IEventDispatcher
	{
		function get text() : String;
		
		function get position() : uint;	
		
		function get owningControl() : DisplayObject;
		
		function set owningControl(value:DisplayObject) : void;
		
		function get width() : Number;
		
		function get height() : Number;
		
		function set x(value:Number) : void;
		
		function set y(value:Number) : void;
		
		function get arrowIconX() : Number;
		
		function get arrowIconY() : Number;
		
		function get deltaX() : int;
		
		function set deltaX(value:int) : void;
	}
}