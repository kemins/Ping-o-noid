package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.EventConstants;
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.model.VO.ScoreVO;
	import com.epam.pingonoid.view.components.PlainButton;
	import com.epam.pingonoid.view.containers.Container;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class EndGameView extends Container
	{
		private static const BTN_WIDTH:int = 285;
		
		public var lblEndGame:TextField;
		
		public var lblResultHeader:TextField;
		public var lblWinner:TextField;
		
		public var btnPlayAgain:PlainButton;
		public var btnMenu:PlainButton;
		
		private var _winnerTF:TextFormat;		

		/**
		 * Constructor
		 * 
		 */		
		public function EndGameView()
		{
			super();
			
			backgroundAlpha = 0.75;
			backgroundTexture = ImageConstants.BACKGROUND_ENDWINNER_IMAGE;
			useBackgroundTexture = true;		
		}		
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			lblEndGame = new TextFieldAdv(TextConstants.LABEL_END_GAME, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			addChild(lblEndGame);

			_winnerTF = new TextFormat();
			_winnerTF.size = 25;
			_winnerTF.font = "Comic Sans MS";			
			
			lblResultHeader = new TextField();
			lblResultHeader.text = TextConstants.LABEL_VICTORY_HEADER;
			lblResultHeader.autoSize = TextFieldAutoSize.LEFT;
			lblResultHeader.wordWrap = false;
			lblResultHeader.setTextFormat(_winnerTF);
			addChild(lblResultHeader);

			lblWinner = new TextField();
			lblWinner.text = TextConstants.LABEL_DEFAULT_WINNER;
			lblWinner.autoSize = TextFieldAutoSize.LEFT;
			lblWinner.wordWrap = false;
			lblWinner.setTextFormat(_winnerTF);
			addChild(lblWinner);			
			
			btnPlayAgain = new PlainButton();
			btnPlayAgain.buttonWidth = BTN_WIDTH;
			btnPlayAgain.label = TextConstants.BTN_PLAY_AGAIN;
			addChild(btnPlayAgain);

			btnMenu = new PlainButton();
			btnMenu.buttonWidth = BTN_WIDTH;
			btnMenu.label = TextConstants.BTN_BACK_MENU;
			addChild(btnMenu);
		}
		
		public function setWinner(scoreVO:ScoreVO):void
		{
			if (scoreVO)
			{
				backgroundTexture = ImageConstants.BACKGROUND_ENDWINNER_IMAGE;
				
				lblResultHeader.text = TextConstants.LABEL_VICTORY_HEADER;
				lblWinner.visible = true;
				
				var suffix:String = (scoreVO.points == 1) ? TextConstants.LABEL_POINT : TextConstants.LABEL_POINTS;
				lblWinner.text = scoreVO.name + TextConstants.LABEL_WHO_SCORED + scoreVO.points.toString() + suffix;
			}
			else
			{
				backgroundTexture = ImageConstants.BACKGROUND_ENDTIE_IMAGE;
				
				lblResultHeader.text = TextConstants.LABEL_TIE_HEADER;
				lblWinner.visible = false;
			}
			
			lblWinner.setTextFormat(_winnerTF)
			lblResultHeader.setTextFormat(_winnerTF);
			
			updateLayout();
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
			
			if (lblEndGame)
			{
				lblEndGame.x = (width - lblEndGame.width) / 2;
				lblEndGame.y = 40;
			}

			if (lblResultHeader)
			{
				lblResultHeader.x = (width - lblResultHeader.width) / 2;
				lblResultHeader.y = lblEndGame.y + lblEndGame.height + 30;
			}			

			if (lblWinner)
			{
				lblWinner.x = (width - lblWinner.width) / 2;
				lblWinner.y = lblResultHeader.y + lblResultHeader.height + 5;
			}			
			
			if (btnPlayAgain)
			{
				btnPlayAgain.x = int ( (width - btnPlayAgain.width) / 2 );
				btnPlayAgain.y = lblWinner.y + lblWinner.height + 50;
			}
			
			if (btnMenu)
			{
				btnMenu.x = int ( (width - btnMenu.width) / 2 );
				btnMenu.y = btnPlayAgain.y + btnPlayAgain.height + 25;
			}			
		}
		
		protected function addEventListeners():void
		{
			btnPlayAgain.addEventListener(MouseEvent.CLICK, onPlayAgainClick);
			btnMenu.addEventListener(MouseEvent.CLICK, onGotoMenuClick);
		}
		
		protected function onPlayAgainClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(EventConstants.EVENT_PLAY_AGAIN));;
		}	
		
		protected function onGotoMenuClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(EventConstants.EVENT_GOTO_MENU));;
		}			
	}
}