package com.epam.pingonoid.controller.managers.specialTooltipManagerClasses
{
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.controller.managers.SpecialToolTipManager;
	import com.epam.pingonoid.controller.managers.interfaces.ISpecialToolTip;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class SpecialToolTip extends Sprite implements ISpecialToolTip
	{
		public static const ARROW_ICON_GAP:Number = 15;
		
		private var _textField:TextField;
		private var _arrowIcon:Sprite;
		
		private var _position:uint;
		
		private var _text:String;
		
		private var _deltaX:int;
		
		private var _owningControl:DisplayObject;
		
		
		public function SpecialToolTip(position:uint, text:String) : void
		{
			_position = position;
			_text = text;
			createChildren();
		}
		
		public function get deltaX() : int
		{
			return _deltaX;
		}

		public function set deltaX(value:int) : void
		{
			_deltaX = value;
		}

		public function get owningControl():DisplayObject
		{
			return _owningControl;
		}
		
		public function set owningControl(value:DisplayObject) : void
		{
			_owningControl = value;
		}
		
		
		public function get position() : uint
		{
			return _position;
		}
		
		public function get text() : String
		{
			return _text;
		}
		
		public function get arrowIconY() : Number
		{
			var res:Number = 0;
			switch(position)
			{
				case SpecialToolTipManager.BELOW:
					res = _textField.y + _textField.height - _arrowIcon.height - 10;
					break;
				
				case SpecialToolTipManager.ABOVE:
					res = 10; 
					break;
				
				case SpecialToolTipManager.LEFT:
					throw new Error("Not implemented yet!");
					//TODO: implement in future
					break;
				
				case SpecialToolTipManager.RIGHT:
					//TODO: implement in future
					throw new Error("Not implemented yet!");
					break;
				
				default:
					throw new Error("Invalid position!");
					break;
			}
			
			return res;
		}
		
		public function get arrowIconX() : Number
		{
			var res:Number = 0;
			switch(position)
			{
				case SpecialToolTipManager.BELOW:
					res = _textField.x - _arrowIcon.width;
					break;
				
				case SpecialToolTipManager.ABOVE:
					res = _textField.x - _arrowIcon.width;
					break;
				
				case SpecialToolTipManager.LEFT:
					throw new Error("Not implemented yet!");
					//TODO: implement in future
					break;
				
				case SpecialToolTipManager.RIGHT:
					//TODO: implement in future
					throw new Error("Not implemented yet!");
					break;
				
				default:
					throw new Error("Invalid position!");
					break;
			}
			
			return res;
		}
		
		
		private function createChildren() : void
		{
			if (!_textField)
			{
				_textField = new TextField();
				_textField.text = _text;
				
				var textFormat:TextFormat = new TextFormat();
				textFormat.size = 14;
				textFormat.font = "Comic Sans MS";
				
				_textField.textColor = 0xd10101;
				_textField.setTextFormat(textFormat);
				_textField.autoSize = TextFieldAutoSize.LEFT;
				
				
				addChild(_textField);
			}
			
			if (!_arrowIcon)
			{
				switch(position)
				{
					case SpecialToolTipManager.BELOW:
						_arrowIcon = new ImageConstants.TOP_LEFT_ARROW();
						break;
					
					case SpecialToolTipManager.ABOVE:
						_arrowIcon = new ImageConstants.BOTTOM_LEFT_ARROW();
						break;
					
					case SpecialToolTipManager.LEFT:
						throw new Error("Not implemented yet!");
						//TODO: implement in future
						break;
					
					case SpecialToolTipManager.RIGHT:
						//TODO: implement in future
						throw new Error("Not implemented yet!");
						break;
					
					default:
						throw new Error("Invalid position!");
						break;
				}
				_arrowIcon.x = arrowIconX;
				_arrowIcon.y = arrowIconY;
				addChild(_arrowIcon);
			}
		}
		
	
	}
}
