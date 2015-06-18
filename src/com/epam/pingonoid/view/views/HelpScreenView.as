package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.EventConstants;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.view.components.PlainButton;
	import com.epam.pingonoid.view.containers.Container;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class HelpScreenView extends Container
	{
		public var btnGo:PlainButton;
		/**
		 * Constructor
		 * 
		 */		
		public function HelpScreenView()
		{
			super();
			
			backgroundAlpha = 1;
			backgroundTexture = ImageConstants.BACKGROUND_HELPSCREEN_IMAGE;
			useBackgroundTexture = true;		
		}		
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			btnGo = new PlainButton();
			btnGo.label = TextConstants.BTN_GO;
			this.addChild(btnGo);
		}

		override protected function updateLayout() : void
		{
			super.updateLayout();
			
			if (btnGo)
			{
				btnGo.x = (width - btnGo.width) / 2;
				btnGo.y = 350;
			}
		}
		
		override protected function init(e:Event=null):void
		{
			super.init(e);
			
			setupUI();
			addEventListeners();
		}
		
		protected function addEventListeners():void
		{
			btnGo.addEventListener(MouseEvent.CLICK, onGoClick);
		}
		
		protected function onGoClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(EventConstants.EVENT_GO_GAME));;
		}			
	}
}