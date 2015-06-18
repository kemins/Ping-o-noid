package com.epam.pingonoid.view.components.validators
{
	import com.epam.pingonoid.controller.managers.SpecialToolTipManager;
	
	import flash.display.DisplayObject;

	public class Validator
	{
		public var required:Boolean = true;
		
		public var requiredErrorMsg:String = "Field is required.";
		
		public var source:Object;
		
		public var validationUiTarget:DisplayObject;
		
		public var tooltipArrowDirection:uint = SpecialToolTipManager.ABOVE;
		
		public var toolTipDeltaX:int = 0;
		
		public static function validateAll(validators:Array) : Array
		{
			var res:Array = [];
			for each (var validator:Validator in validators)
			{
				res = res.concat( validator.validate() );
			}
			
			return res;
		}
		
		public static function isValid(validators:Array) : Boolean
		{
			return validateAll(validators).length == 0;
		}
		
		public function validate() : Array
		{
			var res:Array = [];
			if (required && !source)
			{
				res.push( new ValidationResult(ValidationResult.TYPE_ERROR, requiredErrorMsg, source) );
			}
			
			return res;
		}
		
		public function showErrorTip(res:Array) : void
		{
			if (validationUiTarget)
			{
				var msg:String = "";
				for each(var vRes:ValidationResult in res)
				{
					msg+= vRes.errorMsg + "\n";
				}
				
				if (msg)
				{
					SpecialToolTipManager.instance.addSpecialToolTip(validationUiTarget, msg, tooltipArrowDirection, toolTipDeltaX);
				}
				else
				{
					SpecialToolTipManager.instance.removeSpecialToolTip(validationUiTarget);
				}
			}
		}
	}
}