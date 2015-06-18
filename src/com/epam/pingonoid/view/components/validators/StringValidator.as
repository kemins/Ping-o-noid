package com.epam.pingonoid.view.components.validators
{
	import com.epam.pingonoid.utils.StringUtils;
	
	import mx.utils.StringUtil;
	
	public class StringValidator extends Validator
	{
		public var minLength:uint = 0;
		public var maxLength:uint = int.MAX_VALUE;
		
		public var minLengthErrorMsg:String = "Minimum {0} characters are required.";
		public var maxLengthErrorMsg:String = "Maximum allowed {0} characters.";
		
		override public function validate() : Array
		{
			var str:String = source as String;
			if (str != null)
			{
				str = StringUtil.trim(str);
			}
			var res:Array = super.validate();
			
			if (str && str.length < minLength)
			{
				res.push( new ValidationResult(ValidationResult.TYPE_ERROR, 
					StringUtils.replaceMacros(minLengthErrorMsg, minLength), 
					source) );
			}
			
			if (str && str.length > maxLength)
			{
				res.push( new ValidationResult(ValidationResult.TYPE_ERROR, 
					StringUtils.replaceMacros(maxLengthErrorMsg, maxLength), 
					source) );
			}
			
			showErrorTip(res);
			return res;
			
		}
	}
}