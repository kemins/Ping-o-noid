package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.constants.SettingsConstants;
	import com.epam.pingonoid.constants.TextConstants;
	import com.epam.pingonoid.controller.managers.SpecialToolTipManager;
	import com.epam.pingonoid.model.VO.SettingsVO;
	import com.epam.pingonoid.view.components.validators.StringValidator;
	import com.epam.pingonoid.view.components.validators.Validator;
	import com.epam.pingonoid.view.events.SettingsFormEvent;
	
	import fl.controls.CheckBox;
	import fl.controls.ColorPicker;
	import fl.controls.NumericStepper;
	import fl.controls.TextInput;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class SettingsForm extends Sprite
	{
		public static const HORIZONTAl_GAP:Number = 10;
		public static const VERTICAL_GAP:Number = 15;
		
		/**
		 * Vertical gap between controls and buttons.
		 */		
		public static const FOOTER_GAP:Number = 60;
		
		/**
		 * Text input width.
		 */		
		public static const INPUT_WIDTH:Number = 250;
		
		/**
		 * Text Input max chars
		 */		
		public static const INPUT_MAX_CHARS:uint = 20;
		
		/**
		 * Minimum chars in player name.
		 */		
		public static const PLAYER_NAME_MIN_CHARS:uint = 3;
		
		private var _name1Text:TextField;
		private var _name1TextInput:TextInput;
		
		private var _name2Text:TextField;
		private var _name2TextInput:TextInput;
		
		private var _settings:SettingsVO;
		
		/**
		 * Keep form data in it.
		 */		
		private var _innerSettings:SettingsVO;
		
		private var _color1Text:TextField;
		private var _color2Text:TextField;
		
		private var _colorPicker1:ColorPicker;
		private var _colorPicker2:ColorPicker;
		
		private var _soundCheckBox:CheckBox;
		
		private var _saveButton:PlainButton;
		private var _resetButton:PlainButton;
		private var _back2MenuBtn:PlainButton;
		
		private var _durationText:TextField;
		private var _durationNs:NumericStepper;
		
		private var _player1NameValidator:StringValidator;
		private var _player2NameValidator:StringValidator;
		
		private var _validators:Array = [];
		
		/**
		 * Constructor
		 * 
		 */		
		public function SettingsForm() 
		{
			createChildren();
			initValidators();
			focusRect = false;
		}
		
		/**
		 * settings getter
		 *  
		 * @return 
		 * 
		 */		
		public function get settings() : SettingsVO
		{
			return _settings;
		}
		
		/**
		 * setting setter
		 *  
		 * @param value
		 * 
		 */		
		public function set settings(value:SettingsVO) : void
		{
			if (_settings)
			{
				_settings.removeEventListener(Event.CHANGE, onDataChange);
				_innerSettings.removeEventListener(Event.CHANGE, onDataChange);
			}
			
			_settings = value;
			_innerSettings = _settings ? _settings.clone() as SettingsVO : null;
			
			if (_settings)
			{
				_settings.addEventListener(Event.CHANGE, onDataChange);
				_innerSettings.addEventListener(Event.CHANGE, onDataChange);
			}
			onDataChange(null);
			populateForm();
		}
		
		/**
		 * Create ui children. 
		 * 
		 */		
		private function createChildren() : void
		{
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = 20;
			textFormat.font = "Comic Sans MS";
			textFormat.color = 0x000000;
			
			if (!_name1Text)
			{
				_name1Text = new TextField();
				_name1Text.text = TextConstants.PLAYER_1_NAME;
				_name1Text.x = 0;
				_name1Text.y = 0;
				_name1Text.autoSize = TextFieldAutoSize.LEFT;
				_name1Text.setTextFormat(textFormat);
				
				addChild(_name1Text);
			}
			
			if (!_color1Text)
			{
				_color1Text = new TextField();
				_color1Text.text = TextConstants.PLAYER_1_COLOR;
				_color1Text.autoSize = TextFieldAutoSize.LEFT;
				_color1Text.setTextFormat(textFormat);
				
				_color1Text.x = 0;
				_color1Text.y = _name1Text.y + _name1Text.height + VERTICAL_GAP;
				
				addChild(_color1Text);
			}
			
			if (!_name2Text)
			{
				_name2Text = new TextField();
				_name2Text.text = TextConstants.PLAYER_2_NAME;
				_name2Text.x = 0;
				_name2Text.y = _color1Text.y + _color1Text.height + VERTICAL_GAP;
				_name2Text.autoSize = TextFieldAutoSize.LEFT;
				_name2Text.setTextFormat(textFormat);
				
				addChild(_name2Text);
			}
			
			if (!_color2Text)
			{
				_color2Text = new TextField();
				_color2Text.text = TextConstants.PLAYER_2_COLOR;
				_color2Text.autoSize = TextFieldAutoSize.LEFT;
				_color2Text.setTextFormat(textFormat);
				
				_color2Text.x = 0;
				_color2Text.y = _name2Text.y + _name2Text.height + VERTICAL_GAP;
				
				addChild(_color2Text);
			}
			
			if (!_durationText)
			{
				_durationText = new TextField();
				_durationText.text = TextConstants.GAME_DURATION;
				_durationText.x = 0;
				_durationText.y = _color2Text.y + _color2Text.height + VERTICAL_GAP;
				_durationText.autoSize = TextFieldAutoSize.LEFT;
				_durationText.setTextFormat(textFormat);
				addChild(_durationText);
			}
			
			var textWidth:Number = getMaxTextWidth();
			
			if (!_name1TextInput)
			{
				_name1TextInput = new TextInput();
				_name1TextInput.maxChars = INPUT_MAX_CHARS;
				_name1TextInput.width = INPUT_WIDTH;
				_name1TextInput.height = _name1Text.height;
				
				_name1TextInput.x = textWidth + HORIZONTAl_GAP;
				_name1TextInput.y = 0;
				
				_name1TextInput.textField.background = true;
				_name1TextInput.textField.backgroundColor = 0xFFFFFF;
				_name1TextInput.setStyle("textFormat", textFormat);
				
				_name1TextInput.addEventListener(Event.CHANGE, onName1TextInputChange);
				
				addChild(_name1TextInput);
			}
			
			if (!_colorPicker1)
			{
				_colorPicker1 = new ColorPicker();
				_colorPicker1.x = textWidth + HORIZONTAl_GAP;
				_colorPicker1.y = _color1Text.y;
				_colorPicker1.addEventListener(Event.CHANGE, onColorPicker1Change);
				
				addChild(_colorPicker1);
			}
			
			if (!_name2TextInput)
			{
				_name2TextInput = new TextInput();
				_name2TextInput.maxChars = INPUT_MAX_CHARS;
				_name2TextInput.width = INPUT_WIDTH;
				_name2TextInput.height = _name2Text.height;
				
				_name2TextInput.x = textWidth + HORIZONTAl_GAP;
				_name2TextInput.y = _name2Text.y;
				
				_name2TextInput.textField.background = true;
				_name2TextInput.textField.backgroundColor = 0xFFFFFF;
				_name2TextInput.setStyle("textFormat", textFormat);
				_name2TextInput.addEventListener(Event.CHANGE, onName2TextInputChange);
				
				addChild(_name2TextInput);
			}
			
			if (!_colorPicker2)
			{
				_colorPicker2 = new ColorPicker();
				_colorPicker2.x = textWidth + HORIZONTAl_GAP;
				_colorPicker2.y = _color2Text.y;
				_colorPicker2.addEventListener(Event.CHANGE, onColorPicker2Change);
				
				addChild(_colorPicker2);
			}
			
			if (!_durationNs)
			{
				_durationNs = new NumericStepper();
				_durationNs.stepSize = 1;
				_durationNs.minimum = SettingsConstants.GAME_MIN_DURATION;
				_durationNs.maximum = SettingsConstants.GAME_MAX_DURATION;
				
				_durationNs.setStyle("textFormat", textFormat);
				
				_durationNs.height = _name1TextInput.height;
				_durationNs.width = 70;
				_durationNs.x = textWidth + HORIZONTAl_GAP;
				_durationNs.y = _durationText.y;
				
				_durationNs.addEventListener(Event.CHANGE, onDurationNsChange);
				_durationNs.addEventListener(MouseEvent.MOUSE_OUT, onDurationNsMouseOut);
				
				addChild(_durationNs);
			}
			
			if (!_soundCheckBox)
			{
				_soundCheckBox = new CheckBox();
				_soundCheckBox.useHandCursor = true;
				_soundCheckBox.mouseChildren = false;
				_soundCheckBox.label = TextConstants.SOUND_ENABLED;
				_soundCheckBox.setStyle("textFormat", textFormat);
				_soundCheckBox.textField.autoSize = TextFieldAutoSize.LEFT;
				_soundCheckBox.x = textWidth + HORIZONTAl_GAP;
				_soundCheckBox.y = _durationNs.y + _durationNs.height + VERTICAL_GAP;
				_soundCheckBox.addEventListener(Event.CHANGE, onSoundCheckBoxChange);
				
				addChild(_soundCheckBox);
			}
			
			if (!_saveButton)
			{
				_saveButton = new PlainButton();
				_saveButton.label = TextConstants.BTN_SAVE;
				_saveButton.x = 0;
				_saveButton.y = _soundCheckBox.y  + _soundCheckBox.height + FOOTER_GAP;
				_saveButton.enabled = false;
				_saveButton.addEventListener(MouseEvent.CLICK, onSaveButtonClick);
				addChild(_saveButton);
			}
			
			
			if (!_resetButton)
			{
				_resetButton = new PlainButton();
				_resetButton.label = TextConstants.BTN_RESET;
				_resetButton.x = (_name2TextInput.x + _name2TextInput.width) - _resetButton.width;
				_resetButton.y = _soundCheckBox.y  + _soundCheckBox.height + FOOTER_GAP;
				_resetButton.enabled = false;
				_resetButton.addEventListener(MouseEvent.CLICK, onResetButtonClick);
				addChild(_resetButton);
			}
			
			if (!_back2MenuBtn)
			{
				_back2MenuBtn = new PlainButton();
				_back2MenuBtn.label = TextConstants.BTN_BACK;
				
				var deltaX:Number = _saveButton.x + _saveButton.width;
				var availableWidth:Number = width - deltaX - _resetButton.width;
				
				_back2MenuBtn.x = deltaX + (availableWidth  - _back2MenuBtn.width)/2;
				_back2MenuBtn.y = _saveButton.y;
				_back2MenuBtn.addEventListener(MouseEvent.CLICK, onBackButtonClick);
				addChild(_back2MenuBtn);
			}
		}
		
		/**
		 * Create validators.
		 * 
		 */		
		private function initValidators() : void
		{
			_player1NameValidator = new StringValidator();
			_player1NameValidator.validationUiTarget = _name1TextInput;
			_player1NameValidator.tooltipArrowDirection = SpecialToolTipManager.ABOVE;
			_player1NameValidator.minLength = PLAYER_NAME_MIN_CHARS;
			_player1NameValidator.toolTipDeltaX = 60;
			
			_player2NameValidator = new StringValidator();
			_player2NameValidator.validationUiTarget = _name2TextInput;
			_player2NameValidator.tooltipArrowDirection = SpecialToolTipManager.BELOW;
			_player2NameValidator.minLength = PLAYER_NAME_MIN_CHARS;
			_player2NameValidator.toolTipDeltaX = 60;
			
			_validators = [_player1NameValidator, _player2NameValidator];
		}
		
		/**
		 * Populate form according to data. 
		 * 
		 */		
		private function populateForm() : void
		{
			if (_name1TextInput)
			{
				_name1TextInput.text = _innerSettings ? _innerSettings.player1Name : "";
			}
			
			if (_name2TextInput)
			{
				_name2TextInput.text = _innerSettings ? _innerSettings.player2Name : "";
			}
			
			if (_colorPicker1)
			{
				_colorPicker1.selectedColor = _innerSettings ? _innerSettings.player1Color : 0;
			}
			
			if (_colorPicker2)
			{
				_colorPicker2.selectedColor = _innerSettings ? _innerSettings.player2Color : 0;
			}
			
			if (_soundCheckBox)
			{
				_soundCheckBox.selected = _innerSettings && _innerSettings.soundOn;
			}
			
			if (_durationNs)
			{
				_durationNs.value = _innerSettings ? _innerSettings.gameDuration : 0;
			}
		}
		
		/**
		 * Save button click handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onSaveButtonClick(event:MouseEvent) : void
		{
			event.stopPropagation();
			
			if ( validate() )
			{
				dispatchEvent( new SettingsFormEvent(SettingsFormEvent.SAVE_SETTINGS, _innerSettings) );
			}
		}
		
		/**
		 * Reset button click handler.
		 *  
		 * @param event
		 * 
		 */		
		private function onResetButtonClick(event:MouseEvent) : void
		{
			event.stopPropagation();
			settings = settings;
		}
		
		/**
		 * Return to menu button click handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onBackButtonClick(event:MouseEvent) : void
		{
			event.stopPropagation();
			dispatchEvent( new SettingsFormEvent(SettingsFormEvent.BACK_TO_MENU) );
		}
		
		/**
		 * Player 2 name change handler. 
		 * 
		 * @param event
		 * 
		 */		
		private function onName2TextInputChange(event:Event) : void
		{
			event.stopPropagation();
			var textInput:TextInput = event.currentTarget as TextInput;
			_innerSettings.player2Name = textInput.text;
		}
		
		/**
		 * Player 1 name change handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onName1TextInputChange(event:Event) : void
		{
			event.stopPropagation();
			var textInput:TextInput = event.currentTarget as TextInput;
			_innerSettings.player1Name = textInput.text;
		}
		
		/**
		 * Sound checkbox change handler.
		 *  
		 * @param event
		 * 
		 */		
		private function onSoundCheckBoxChange(event:Event) : void
		{
			event.stopPropagation();
			var cb:CheckBox = event.currentTarget as CheckBox;
			_innerSettings.soundOn = cb.selected;
		}
		
		/**
		 * Player 1 color change handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onColorPicker1Change(event:Event) : void
		{
			event.stopPropagation();
			var cp:ColorPicker = event.currentTarget as ColorPicker;
			_innerSettings.player1Color = cp.selectedColor;
		}
		
		/**
		 * Player 2 color change handler.
		 *  
		 * @param event
		 * 
		 */		
		private function onColorPicker2Change(event:Event) : void
		{
			event.stopPropagation();
			var cp:ColorPicker = event.currentTarget as ColorPicker;
			_innerSettings.player2Color = cp.selectedColor;
		}
		
		/**
		 * Duration nummeric change handler. 
		 *  
		 * @param event
		 * 
		 */		
		private function onDurationNsChange(event:Event) : void
		{
			event.stopPropagation();
			var ns:NumericStepper = event.currentTarget as NumericStepper;
			_innerSettings.gameDuration = ns.value;
		}
		
		/**
		 * Duration nummeric mouse out handler. 
		 * 
		 * @param event
		 * 
		 */		
		private function onDurationNsMouseOut(event:MouseEvent) : void
		{
			var ns:NumericStepper = event.currentTarget as NumericStepper;
			if (ns.getFocus())
			{
				stage.focus = this;//remove focus from NumericStepper to apply change.
			}
		}
		
		/**
		 * Data change handler.
		 * 
		 * @param event
		 * 
		 */		
		private function onDataChange(event:Event = null) : void
		{
			var valid:Boolean = validate();
			updateButtonsState(valid);
		}
		
		/**
		 * Set button enabled/disabled according to validation and dirty state.
		 *  
		 * @param valid
		 * 
		 */		
		private function updateButtonsState(valid:Boolean) : void
		{
			if (_saveButton && _resetButton && _settings && _innerSettings)
			{
				var dirty:Boolean = !_settings.equals(_innerSettings);
				_resetButton.enabled = dirty;
				_saveButton.enabled = dirty && valid
			}
		}
		
		/**
		 * Apply validation.
		 * 
		 * @return 
		 * 
		 */		
		private function validate() : Boolean
		{
			if (_player1NameValidator && _player2NameValidator && _innerSettings)
			{
				_player1NameValidator.source = _innerSettings.player1Name;
				_player2NameValidator.source = _innerSettings.player2Name;
				return Validator.isValid(_validators);
			}
			return false;
		}
		
		/**
		 * Calculate maximum text width.
		 * 
		 * @return 
		 * 
		 */		
		private function getMaxTextWidth() : Number
		{
			var textFields:Array = [_name1Text, _name2Text, _color1Text, _color2Text, _durationText];
			var maxWidth:Number = 0;
			for each(var textField:TextField in textFields)
			{
				if (textField.width > maxWidth)
				{
					maxWidth = textField.width;
				}
			}
			
			return maxWidth;
		}
	}
}