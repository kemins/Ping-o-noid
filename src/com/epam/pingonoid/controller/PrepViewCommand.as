package com.epam.pingonoid.controller
{
	import com.epam.pingonoid.view.MainViewMediator;
	import com.epam.pingonoid.view.PingPongViewMediator;
	import com.epam.pingonoid.view.views.PingPongView;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * PrepViewCommand
	 * 
	 */	
	public class PrepViewCommand extends SimpleCommand
	{
		/**
		 * execute
		 * @param notification
		 * 
		 */		
		override public function execute( notification:INotification ):void
		{
			var app:Main = notification.getBody() as Main;
			
			facade.registerMediator( new MainViewMediator( app.mainView ) );	
		}
	}
}