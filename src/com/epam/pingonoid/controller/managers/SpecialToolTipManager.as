package com.epam.pingonoid.controller.managers
{
	import com.epam.pingonoid.controller.managers.interfaces.ISpecialToolTip;
	import com.epam.pingonoid.controller.managers.interfaces.ISpecialTooltipManager;
	import com.epam.pingonoid.controller.managers.specialTooltipManagerClasses.SpecialToolTip;
	
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class SpecialToolTipManager implements ISpecialTooltipManager
	{
		
		public static const ABOVE:uint = 0;
		public static const BELOW:uint = 1;
		public static const RIGHT:uint = 2;
		public static const LEFT:uint  = 3;
		
		public static const VERTICAL_GAP:Number = 10;
		public static const HORIZONTAL_GAP:Number = 20;
		
		public static function get instance():SpecialToolTipManager
		{
			if (!_instance)
			{
				_instance = new SpecialToolTipManager( new PrivateClass() );
			}
			
			return _instance;
		}
		
		/**
		 * 
		 * @param privateClass  - security instance (specific of singleton implementation)
		 * 
		 */		
		public function SpecialToolTipManager( privateClass:PrivateClass )
		{
			if (_instance)
			{
				throw new IllegalOperationError("Instance already exists.");
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Start interface methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Add special tooltip to owningControl, 
		 * If owning control already contains tooltip, overrides it with a new one
		 * 
		 * @param owningControl - component to which we are going to add tooltip
		 * @param text - tooltip message
		 * @param position - (expects next constants: ABOVE, BELOW, RIGHT, LEFT)
		 * @return - a new instance of ISpecialToolTip interface
		 * 
		 */		
		public function addSpecialToolTip(owningControl:DisplayObject, text:String, position:uint = ABOVE, deltaX:int = 0) : ISpecialToolTip
		{
			removeSpecialToolTip(owningControl);
			var specialTip:ISpecialToolTip = new SpecialToolTip(position, text);
			specialTip.deltaX = deltaX;
			specialTip.owningControl = owningControl;
			specialTip.addEventListener(Event.ENTER_FRAME, onToolTipEnterFrame);
			_tooltips.push(specialTip);
			
			owningControl.stage.addChild(specialTip as DisplayObject);
			return specialTip;
		}
		
		
		/**
		 * Removes existing tooltip from owning control
		 * @param owningControl
		 * 
		 */		
		public function removeSpecialToolTip(owningControl:DisplayObject) : void
		{
			var tooltip:ISpecialToolTip = getToolTipByOwningControl(owningControl);
			if (tooltip)
			{
				destroyTooltip(tooltip, owningControl);
			}
		}
		//--------------------------------------------------------------------------
		//
		//  End interface methods
		//
		//--------------------------------------------------------------------------
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Start Helper methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 * @param tooltip
		 * @return - coordinates for tooltip;
		 * 
		 */		
		private function calculateToolTipCoordinates(tooltip:ISpecialToolTip) : Point
		{
			var owningControl:DisplayObject = tooltip.owningControl;
			var point:Point = owningControl.localToGlobal( new Point(0, 0) );
			switch(tooltip.position)
			{
				case BELOW:
					point.x+= Math.max(0, owningControl.width) - tooltip.deltaX;
					point.y+= owningControl.height - tooltip.arrowIconY + VERTICAL_GAP;
					break;
				
				case ABOVE:
					point.x+= Math.max(0, owningControl.width - tooltip.deltaX);
					point.y-= tooltip.height + VERTICAL_GAP;
					break;
				
				case LEFT:
					point.x-= tooltip.width + HORIZONTAL_GAP;
					point.y-= (tooltip.height - owningControl.height)/2; 
					break;
				
				case RIGHT:
					point.x+= owningControl.width + HORIZONTAL_GAP;
					point.y-= (tooltip.height - owningControl.height)/2;
					break;
			}
			return point;
		}
		
		/**
		 * 
		 * Finds tooltip by owning control
		 * @param owningControl
		 * @return - proper tooltip or null if there is no applicable tooltip
		 * 
		 */		
		private function getToolTipByOwningControl(owningControl:DisplayObject) : ISpecialToolTip
		{
			for each(var tooltip:ISpecialToolTip in _tooltips)
			{
				if (tooltip.owningControl == owningControl)
				{
					return tooltip;
				}
			}
			
			return null;
		}
		
		/**
		 * Destroys particular tooltip
		 * @param tooltip
		 * 
		 */		
		private function destroyTooltip(tooltip:ISpecialToolTip, owningControl:DisplayObject) : void
		{
			tooltip.removeEventListener(Event.ENTER_FRAME, onToolTipEnterFrame);
			var index:int = _tooltips.indexOf(tooltip);
			if (index>=0)
			{
				_tooltips.splice(index, 1);
			}
			owningControl.stage.removeChild(tooltip as DisplayObject);
		}
		
		//--------------------------------------------------------------------------
		//
		//  End Helper methods
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		//  Start Event handlers
		//
		//--------------------------------------------------------------------------
		
		private function onToolTipEnterFrame(event:Event) : void
		{
			var tooltip:ISpecialToolTip = event.currentTarget as ISpecialToolTip;
			var point:Point = calculateToolTipCoordinates(tooltip);
			tooltip.x = point.x;
			tooltip.y = point.y;
		}
		
		//--------------------------------------------------------------------------
		//
		//  End Event handlers
		//
		//--------------------------------------------------------------------------
		
		
		
		private static var _instance:SpecialToolTipManager;
		
		private var _tooltips:Array = [];
		
	}
}

class PrivateClass
{
}