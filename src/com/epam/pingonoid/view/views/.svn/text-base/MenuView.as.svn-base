package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.view.components.PlainButton;
	import com.epam.pingonoid.view.containers.Container;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class MenuView extends Container
	{
		private static const BTN_WIDTH:int = 285;
		
		public var lblMainMenu:TextField;
		
		public var btnStartGame:PlainButton;
		public var btnSettings:PlainButton;
		public var btnHighScores:PlainButton;
		public var btnCredits:PlainButton;

		/**
		 * Constructor
		 * 
		 */		
		public function MenuView()
		{
			super();
			
			backgroundAlpha = 1;
			backgroundTexture = ImageConstants.BACKGROUND_MENU_IMAGE;
			useBackgroundTexture = true;
		}		
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			lblMainMenu = new TextFieldAdv(TextConstants.LABEL_MAIN_MENU, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			this.addChild(lblMainMenu);

			btnStartGame = new PlainButton();
			btnStartGame.buttonWidth = BTN_WIDTH;
			btnStartGame.label = TextConstants.BTN_START_GAME;
			this.addChild(btnStartGame);
			
			btnSettings = new PlainButton();
			btnSettings.buttonWidth = BTN_WIDTH;
			btnSettings.label = TextConstants.BTN_OPTIONS;			
			this.addChild(btnSettings);	
			
			btnHighScores = new PlainButton();
			btnHighScores.buttonWidth = BTN_WIDTH;
			btnHighScores.label = TextConstants.BTN_HIGH_SCORES;
			this.addChild(btnHighScores);
			
			btnCredits = new PlainButton();
			btnCredits.buttonWidth = BTN_WIDTH;
			btnCredits.label = TextConstants.BTN_CREDITS;
			this.addChild(btnCredits);			
		}

		override protected function init(e:Event=null):void
		{
			super.init(e);
			
		}
		
		override protected function updateLayout() : void
		{
			super.updateLayout();
			
			if (lblMainMenu)
			{
				lblMainMenu.x = (width - lblMainMenu.width) / 2;
				lblMainMenu.y = 10;
			}
			
			if (btnStartGame)
			{
				btnStartGame.x = int ( (width - btnStartGame.width) / 2 );
				btnStartGame.y = lblMainMenu.y + lblMainMenu.height + 50;
			}
			
			if (btnSettings)
			{
				btnSettings.x = (width - btnSettings.width) / 2;
				btnSettings.y = btnStartGame.y + btnStartGame.height + 10;
			}
			
			if (btnHighScores)
			{
				btnHighScores.x = (width - btnHighScores.width) / 2;
				btnHighScores.y = btnSettings.y + btnSettings.height + 10;
			}
			
			if (btnCredits)
			{
				btnCredits.x = (width - btnCredits.width) / 2;
				btnCredits.y = btnHighScores.y + btnHighScores.height + 10;
			}
		}
		
	}
}