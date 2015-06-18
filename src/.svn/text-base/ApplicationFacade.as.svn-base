package
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.controller.ApplicationStartupCommand;
	import com.epam.pingonoid.controller.HandleUserSettingsChangeCommand;
	import com.epam.pingonoid.controller.SaveUserSettingsCommand;
	import com.epam.pingonoid.controller.levels.CollisionProcessCommand;
	import com.epam.pingonoid.controller.levels.CreatePingPongRoomCommand;
	import com.epam.pingonoid.controller.levels.EndGameCommand;
	import com.epam.pingonoid.controller.levels.PlayerMissedBallCommand;
	import com.epam.pingonoid.controller.levels.ResetPingPongCommand;
	import com.epam.pingonoid.controller.levels.UpdateGameCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		
		/**
		 * Singleton Method
		 * getInstance
		 * @return 
		 * 
		 */		
        public static function getInstance(): ApplicationFacade 
		{
            if (instance == null) 
			{
				instance = new ApplicationFacade( );
			}
			
            return instance as ApplicationFacade;
        }
		
		
		/**
		 * initializeController
		 * 
		 */		
        override protected function initializeController():void 
		{
            super.initializeController();
			
            registerCommand(NotificationConstants.STARTUP, ApplicationStartupCommand);
			registerCommand(NotificationConstants.CREATE_PINGPONG_ROOM, CreatePingPongRoomCommand);
			
			registerCommand(NotificationConstants.RESET_PINGPONG_GAME, ResetPingPongCommand);
			registerCommand(NotificationConstants.UPDATE_PINGPONG_GAME, UpdateGameCommand);
			registerCommand(NotificationConstants.END_PINGPONG_GAME, EndGameCommand);
			
			//collisions
			registerCommand(NotificationConstants.COLLISION_HAPPENED, CollisionProcessCommand);
			registerCommand(NotificationConstants.LEFT_PLAYER_MISSED_BALL, PlayerMissedBallCommand);
			registerCommand(NotificationConstants.RIGHT_PLAYER_MISSED_BALL, PlayerMissedBallCommand);
			
			registerCommand(NotificationConstants.SAVE_USER_SETTINGS, SaveUserSettingsCommand);
			registerCommand(NotificationConstants.USER_SETTINGS_CHANGED, HandleUserSettingsChangeCommand);
        }

		
		/**
		 * startup
		 * @param app
		 * 
		 */		
		public function startup(app:Object):void 
		{
			sendNotification(NotificationConstants.STARTUP, app);
		}
	}
}