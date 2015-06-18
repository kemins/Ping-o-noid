package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.view.components.PlainButton;
	import com.epam.pingonoid.view.components.ScoreItem;
	import com.epam.pingonoid.view.containers.Container;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class HighScoresView extends Container
	{
		public var lblHeader:TextField;
		
		public var lblNoData:TextField;
		
		public var btnBack2Menu:PlainButton;

		/**
		 * Constructor
		 * 
		 */		
		public function HighScoresView()
		{
			super();
			
			backgroundAlpha = 1;
			backgroundTexture = ImageConstants.BACKGROUND_HIGHSCORES_IMAGE;
			useBackgroundTexture = true;
		}			
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			lblHeader = new TextFieldAdv(TextConstants.LABEL_HIGH_SCORES, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			lblHeader.x = (stage.width - lblHeader.width) / 2;
			lblHeader.y = 10;
			this.addChild(lblHeader);
			
			lblNoData = new TextFieldAdv(TextConstants.LABEL_NO_SCORES, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			lblNoData.x = (stage.width - lblNoData.width) / 2;
			lblNoData.y = (stage.height - lblNoData.height) / 2;
			
			btnBack2Menu = new PlainButton();
			btnBack2Menu.label = TextConstants.BTN_BACK_MENU;
			this.addChild(btnBack2Menu);
		}

		override protected function updateLayout() : void
		{
			super.updateLayout();
			
			if (lblHeader)
			{
				lblHeader.x = (width - lblHeader.width) / 2;
				lblHeader.y = 10;
			}
			
			var scoresCount:int = 0;
			var child:DisplayObject; 
			
			for (var i:int=0; i<this.numChildren; i++)
			{
				child = this.getChildAt(i);

				if (child is ScoreItem)
				{
					child.x = (width - child.width) / 2;
					child.y = lblHeader.y + lblHeader.height + 30 + (child.height + 10)*scoresCount;
					scoresCount++;
				}
			}
			
			if (btnBack2Menu)
			{
				btnBack2Menu.x = (width - btnBack2Menu.width) / 2;
				btnBack2Menu.y = height - btnBack2Menu.height - 10;
			}
		}		
		
		override protected function init(e:Event=null):void
		{
			super.init(e);
			
		}
		
	}
}