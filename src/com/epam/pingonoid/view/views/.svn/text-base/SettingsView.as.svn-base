package com.epam.pingonoid.view.views
{
	import com.epam.pingonoid.constants.Filters;
	import com.epam.pingonoid.constants.ImageConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.constants.TextFormats;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.components.SettingsForm;
	import com.epam.pingonoid.view.containers.Container;
	import com.epam.pingonoid.view.controls.TextFieldAdv;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class SettingsView extends Container
	{
		private var _settingsForm:SettingsForm;
		private var _headerText:TextField;
		
		private var _settings:SettingsVO;
		
		/**
		 * Constructor
		 * 
		 */		
		public function SettingsView()
		{
			super();
			
			backgroundAlpha = 1;
			backgroundTexture = ImageConstants.BACKGROUND_SETTINGS_IMAGE;
			useBackgroundTexture = true;
		}
		
		public function get settings() : SettingsVO
		{
			return _settings;
		}

		public function set settings(value:SettingsVO) : void
		{
			_settings = value;
			if (_settingsForm)
			{
				_settingsForm.settings = value;
			}
		}

		/**
		 * 
		 * 
		 */
		public function setupUI():void
		{
			if (!_settingsForm)
			{
				_settingsForm = new SettingsForm();
				_settingsForm.settings = _settings;
				addChild(_settingsForm);
			}
			
			if (!_headerText)
			{
				_headerText = new TextFieldAdv(TextConstants.GAME_OPTIONS, TextFormats.viewHeaderFormat, Filters.getDefaultShadow(2));
				addChild(_headerText);
			}
		}

		override protected function updateLayout() : void
		{
			super.updateLayout();
			if (_headerText)
			{
				_headerText.x = (width - _headerText.width) /2;
				_headerText.y = 10;
			}
			if (_settingsForm && _headerText)
			{
				_settingsForm.x = (width - _settingsForm.width) / 2;
				
				var deltaY:Number = _headerText.y + _headerText.height;
				var awailableHeight:Number = height - deltaY;
				_settingsForm.y = (awailableHeight - _settingsForm.height) /2 + deltaY;
			}
		}
	}
}