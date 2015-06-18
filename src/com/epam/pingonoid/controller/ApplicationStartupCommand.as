package com.epam.pingonoid.controller
{
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	public class ApplicationStartupCommand extends MacroCommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand( PrepModelCommand );
			addSubCommand( PrepViewCommand );
			addSubCommand( InitAppCommand );
		}
	}
}