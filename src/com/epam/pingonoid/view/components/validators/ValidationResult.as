package com.epam.pingonoid.view.components.validators
{
	public class ValidationResult
	{
		public static const TYPE_ERROR:String = "error";
		public static const TYPE_WARNING:String = "warning";
		
		public var errorMsg:String;
		public var source:Object;
		
		public var type:String;
		
		public function ValidationResult(type:String, errorMsg:String, source:Object)
		{
			this.type = type;
			this.errorMsg = errorMsg;
			this.source = source;
		}
	}
}