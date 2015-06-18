package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.EventConstants;
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.view.components.PlainButton;
	import com.epam.pingonoid.view.containers.Container;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class PauseGameView extends Container
	{
		private static const BTN_WIDTH:int = 285;
		
		public var lblPause:TextField;
		public var btnQuitGame:PlainButton;
		public var btnResumeGame:PlainButton;

		/**
		 * Constructor
		 * 
		 */		
		public function PauseGameView()
		{
			super();
			
			backgroundAlpha = 0.8;
			backgroundTexture = ImageConstants.BACKGROUND_PAUSEVIEW_IMAGE;
			useBackgroundTexture = true;		
		}		
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			lblPause = new TextFieldAdv(TextConstants.LABEL_GAME_PAUSED, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			addChild(lblPause);

			btnResumeGame = new PlainButton();
			btnResumeGame.buttonWidth = BTN_WIDTH;
			btnResumeGame.label = TextConstants.BTN_RESUME_GAME;
			addChild(btnResumeGame);

			btnQuitGame = new PlainButton();
			btnQuitGame.buttonWidth = BTN_WIDTH;
			btnQuitGame.label = TextConstants.BTN_QUIT_GAME;
			addChild(btnQuitGame);
			
		}

		override protected function init(e:Event=null):void
		{
			super.init(e);
			
			setupUI();
			addEventListeners();
		}
		
		override protected function updateLayout() : void
		{
			super.updateLayout();
			
			if (lblPause)
			{
				lblPause.x = (width - lblPause.width) / 2;
				lblPause.y = 50;
			}
			
			if (btnResumeGame)
			{
				btnResumeGame.x = int ( (width - btnResumeGame.width) / 2 );
				btnResumeGame.y = lblPause.y + lblPause.height + 150;
			}
			
			if (btnQuitGame)
			{
				btnQuitGame.x = int ( (width - btnQuitGame.width) / 2 );
				btnQuitGame.y = btnResumeGame.y + btnResumeGame.height + 25;
			}			
		}
		
		protected function addEventListeners():void
		{
			btnResumeGame.addEventListener(MouseEvent.CLICK, onResumeGameClick);
			btnQuitGame.addEventListener(MouseEvent.CLICK, onQuitGameClick);
		}
		
		protected function onResumeGameClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(EventConstants.EVENT_RESUME_GAME));;
		}	
		
		protected function onQuitGameClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(EventConstants.EVENT_QUIT_GAME));;
		}			
	}
}