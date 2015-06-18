package com.epam.pingonoid.controller.managers.interfaces
{
	import flash.display.DisplayObject;
	
	public interface ISpecialTooltipManager
	{
		function addSpecialToolTip(owningControl:DisplayObject, text:String, position:uint=0, deltaX:int=0) : ISpecialToolTip
		
		function removeSpecialToolTip(owningControl:DisplayObject) : void;
	}
}