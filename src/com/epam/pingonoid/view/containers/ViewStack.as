package com.epam.pingonoid.view.containers
{
	import com.epam.pingonoid.utils.MathUtils;
	
	import flash.display.DisplayObject;
	
	public class ViewStack extends Container
	{
		/**
		 * 
		 * @return - index(from 0 to children length -1).
		 * 
		 */		
		public function get selectedIndex() : int
		{
			return _selectedIndex;
		}
		
		/**
		 * 
		 * @return - selected view.
		 * 
		 */		
		public function get selectedView() : Container
		{
			return (childrenCount > 0) ? children[_selectedIndex] as Container : null;
		}
		
		public function set selectedIndex(value:int) : void
		{
			_selectedIndex = MathUtils.normalizeValue(value, 0, childrenCount-1);
			setSelection();
		}
		
		/**
		 * Array of com.epam.pingonoid.view.components.Container
		 * 
		 * @return 
		 * 
		 */		
		public function get children() : Array
		{
			return _children;
		}

		public function set children(value:Array) : void
		{
			destroyChildren();
			_children = value;
			createChildren();
			selectedIndex = 0;
		}
		
		/**
		 * 
		 * @return - count of children.
		 * 
		 */		
		public function get childrenCount() : uint
		{
			return _children ? _children.length : 0;
		}
		
		/**
		 * Remove all children.
		 * 
		 */		
		private function destroyChildren() : void
		{
			for each (var child:DisplayObject in _children)
			{
				removeChild(child);
			}
		}
		
		/**
		 *  Add all children to layout.
		 * 
		 */		
		private function createChildren() : void
		{
			for each (var child:DisplayObject in _children)
			{
				addChild(child);
			}
		}
		
		/**
		 * Set visible true for selected child and false for other.
		 * 
		 */		
		private function setSelection() : void
		{
			for (var i:int = 0; i < childrenCount; i++)
			{
				var child:DisplayObject  = _children[i] as DisplayObject;
				child.visible = (i == _selectedIndex);
			}
		}
		
		/**
		 * Resizing and moving children.
		 * 
		 */				
		override protected function updateLayout() : void
		{
			super.updateLayout();
			for each (var child:DisplayObject in _children)
			{
				child.x = 0;
				child.y = 0;
				child.width = width;
				child.height = height;
			}
		}
		
		private var _children:Array;
		
		private var _selectedIndex:int;
	}
}