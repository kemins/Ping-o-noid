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
	
	public class CreditsView extends Container
	{
		public var lblHeader:TextField;
		
		public var lblLine1:TextField;
		public var lblLine2:TextField;
		public var lblLine3:TextField;
		public var lblLine4:TextField;
		public var lblLine5:TextField;
		public var lblLine6:TextField;
		public var lblLine7:TextField;
		public var lblLine8:TextField;
		
		public var btnBack2Menu:PlainButton;

		/**
		 * Constructor
		 * 
		 */		
		public function CreditsView()
		{
			super();
			
			backgroundAlpha = 1;
			backgroundTexture = ImageConstants.BACKGROUND_CREDITS_IMAGE;
			useBackgroundTexture = true;
		}			
		
		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			// todo: get rid of copypaste if there will be enough time
			
			lblHeader = new TextFieldAdv(TextConstants.LABEL_CREDITS_HEADER, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
			lblHeader.x = (stage.width - lblHeader.width) / 2;
			lblHeader.y = 10;
			this.addChild(lblHeader);

			var smallTF:TextFormat = new TextFormat();
			smallTF.size = 20;
			smallTF.font = "Comic Sans MS";			

			lblLine1 = new TextField();
			lblLine1.text = TextConstants.LABEL_CREDITS_1;
			lblLine1.autoSize = TextFieldAutoSize.LEFT;
			lblLine1.wordWrap = false;
			lblLine1.setTextFormat(smallTF)
			this.addChild(lblLine1);
			
			lblLine2 = new TextField();
			lblLine2.text = TextConstants.LABEL_CREDITS_2;
			lblLine2.autoSize = TextFieldAutoSize.LEFT;
			lblLine2.wordWrap = false;
			lblLine2.setTextFormat(smallTF)
			this.addChild(lblLine2);
			
			lblLine3 = new TextField();
			lblLine3.text = TextConstants.LABEL_CREDITS_3;
			lblLine3.autoSize = TextFieldAutoSize.LEFT;
			lblLine3.wordWrap = false;
			
			lblLine3.setTextFormat(smallTF)
			this.addChild(lblLine3);			

			lblLine4 = new TextField();
			lblLine4.text = TextConstants.LABEL_CREDITS_4;
			lblLine4.autoSize = TextFieldAutoSize.LEFT;
			lblLine4.wordWrap = false;
			
			lblLine4.setTextFormat(smallTF)
			this.addChild(lblLine4);				

			lblLine5 = new TextField();
			lblLine5.text = TextConstants.LABEL_CREDITS_5;
			lblLine5.autoSize = TextFieldAutoSize.LEFT;
			lblLine5.wordWrap = false;
			
			lblLine5.setTextFormat(smallTF)
			this.addChild(lblLine5);
			
			lblLine6 = new TextField();
			lblLine6.text = TextConstants.LABEL_CREDITS_6;
			lblLine6.autoSize = TextFieldAutoSize.LEFT;
			lblLine6.wordWrap = false;
			
			lblLine6.setTextFormat(smallTF)
			this.addChild(lblLine6);
			
			lblLine7 = new TextField();
			lblLine7.text = TextConstants.LABEL_CREDITS_7;
			lblLine7.autoSize = TextFieldAutoSize.LEFT;
			lblLine7.wordWrap = false;
			
			lblLine7.setTextFormat(smallTF)
			this.addChild(lblLine7);			
			
			lblLine8 = new TextField();
			lblLine8.text = TextConstants.LABEL_CREDITS_8;
			lblLine8.autoSize = TextFieldAutoSize.LEFT;
			lblLine8.wordWrap = false;
			

			lblLine8.setTextFormat(smallTF)
			this.addChild(lblLine8);			
		
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

			if (lblLine1)
			{
				lblLine1.x = (stage.width - lblLine1.width) / 2;
				lblLine1.y = lblHeader.y + lblHeader.height + 10;
			}			

			if (lblLine2)
			{
				lblLine2.x = (stage.width - lblLine2.width) / 2;
				lblLine2.y = lblLine1.y + lblLine1.height;
			}			

			if (lblLine3)
			{
				lblLine3.x = (stage.width - lblLine3.width) / 2;
				lblLine3.y = lblLine2.y + lblLine2.height + 20;
			}			

			if (lblLine4)
			{
				lblLine4.x = (stage.width - lblLine4.width) / 2;
				lblLine4.y = lblLine3.y + lblLine3.height;
			}				

			if (lblLine5)
			{
				lblLine5.x = (stage.width - lblLine5.width) / 2;
				lblLine5.y = lblLine4.y + lblLine4.height;
			}			
			
			if (lblLine6)
			{
				lblLine6.x = (stage.width - lblLine6.width) / 2;
				lblLine6.y = lblLine5.y + lblLine5.height;
			}			
			
			if (lblLine7)
			{
				lblLine7.x = (stage.width - lblLine7.width) / 2;
				lblLine7.y = lblLine6.y + lblLine6.height + 20;
			}			
			
			if (lblLine8)
			{
				lblLine8.x = (stage.width - lblLine8.width) / 2;
				lblLine8.y = lblLine7.y + lblLine7.height;
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