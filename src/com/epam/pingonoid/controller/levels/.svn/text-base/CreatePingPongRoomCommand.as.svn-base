package com.epam.pingonoid.controller.levels
{	
	import com.epam.pingonoid.controller.ApplicationCommand;
	import com.epam.pingonoid.controller.listeners.PingPongContactListener;
	import com.epam.pingonoid.view.PingPongViewMediator;
	import com.epam.pingonoid.view.World;
	import com.epam.pingonoid.view.components.walls.AbstractWall;
	import com.epam.pingonoid.view.components.walls.BottomWall;
	import com.epam.pingonoid.view.components.walls.LeftWall;
	import com.epam.pingonoid.view.components.walls.RightWall;
	import com.epam.pingonoid.view.components.walls.TopWall;
	import com.epam.pingonoid.view.views.PingPongView;
	
	import org.puremvc.as3.interfaces.INotification;

	/**
	 * CreateBoundingBoxController
	 * 
	 */	
	public class CreatePingPongRoomCommand extends ApplicationCommand
	{
		
		/**
		 *	execute 
		 * 
		 */		
		override public function execute( notification:INotification ):void
		{
			var view:PingPongView =  notification.getBody() as PingPongView;
						
			//create collision listener
			World.world.SetContactListener(new PingPongContactListener(view));
			
			//ball
			view.createBall();
			
			//rackets
			view.createRackets();
			
			//build walls
			var tw:AbstractWall = new TopWall();
			var bw:AbstractWall = new BottomWall();
			var lw:AbstractWall = new LeftWall();
			var rw:AbstractWall = new RightWall();
			view.addChild(tw);
			view.addChild(bw);
			view.addChild(lw);
			view.addChild(rw);
			
			//score board
			view.createScoreBoard();
			
			//timer board
			view.createTimerBoard();

			//create child screens
			view.createChildScreens();
			
			if (!mediators.pingPongMediator.helpScreenShown)
			{
				view.showHelpScreen();
				mediators.pingPongMediator.helpScreenShown = true;
			}
		}
	}
}