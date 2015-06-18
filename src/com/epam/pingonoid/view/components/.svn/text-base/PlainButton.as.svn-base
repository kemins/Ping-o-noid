package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.constants.SoundConstants;
	import com.epam.pingonoid.controller.managers.SoundManager;
	
	import flash.display.GradientType;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class PlainButton extends Sprite
	{
		private var _btn:SimpleButton;
		private var _label:String = "";
		
		public var buttonWidth:Number = NaN;
		public var buttonHeight:Number = NaN;
	
		private var _enabled:Boolean = true;
		
		public function PlainButton()
		{
			createChildren();
			filters = [new DropShadowFilter()];
			addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		public function get enabled() : Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean) : void
		{
			if (_enabled != value)
			{
				_enabled = value;
				if (_btn)
				{
					_btn.enabled = _enabled;
					updateButtonStates();
				}
			}
		}

		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
			updateButtonStates();
		}
			
		private function createChildren():void 
		{
			if (!_btn)
			{
				_btn = new SimpleButton();
				_btn.enabled = _enabled;
				_btn.x = 0;
				_btn.y = 0;
				
				updateButtonStates();
				
				addChild(_btn);
			}
		}
		
		private function updateButtonStates() : void
		{
			_btn.upState=getState([0x606060, 0x656565]);
			_btn.overState=getState([0x000044, 0x000099]);
			_btn.downState=getState([0x000022, 0x000077]);
			_btn.hitTestState=_btn.upState;
		}
		
		private function getState(gradientColors:Array):Sprite
		{
			var surface:Sprite=new Sprite();
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = 40;
			textFormat.font = "Comic Sans MS";

			var tf:TextField = new TextField();
			tf.text = label;
			tf.textColor = 0xEEEEEE;
			tf.setTextFormat(textFormat);
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.wordWrap = false;
			
			var computedWidth:int;
			if (!isNaN(buttonWidth))
			{
				computedWidth = buttonWidth;
			}
			else
			{
				computedWidth = tf.textWidth + 20;
			}
			var computedHeight:int;
			if (!isNaN(buttonHeight))
			{
				computedHeight = buttonHeight;
			}
			else
			{
				computedHeight = tf.textHeight + 10;
			}
			
			tf.x = (computedWidth - tf.width) / 2;
			tf.y = (computedHeight - tf.height) / 2;

			var fillAlphas:Array = _enabled ? [0.55, 0.55] : [0.2, 0.2];
			surface.graphics.beginGradientFill(GradientType.LINEAR, gradientColors, fillAlphas, [0, 255]);
			surface.graphics.drawRoundRect(0, 0, computedWidth, computedHeight, 10);
			surface.graphics.endFill();
			
			surface.addChild(tf);
			
			return(surface);
		}
		
		private function clickHandler(event:MouseEvent) : void
		{
			if (enabled)
			{
				SoundManager.instance.play(SoundConstants.CLICK_SOUND);
			}
			else
			{
				event.stopImmediatePropagation();
			}
		}
	}
}