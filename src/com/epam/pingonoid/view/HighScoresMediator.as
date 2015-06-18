package com.epam.pingonoid.view
{
	import com.epam.pingonoid.constants.NotificationConstants;
	import com.epam.pingonoid.model.VO.HighScoresVO;
	import com.epam.pingonoid.view.components.ScoreItem;
	import com.epam.pingonoid.view.views.HighScoresView;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * SettingsViewMediator
	 * 
	 */	
	public class HighScoresMediator extends BaseMediator
	{
		public static const NAME:String = "HighScoresMediator";
		
		/**
		 * Constructor 
		 * @param viewComponent
		 * 
		 */		
		public function HighScoresMediator(viewComponent:HighScoresView=null)
		{
			super(NAME, viewComponent);
		}

		/**
		 * listNotificationInterests
		 * 
		 * @return 
		 * 
		 */		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.DATA_LOADED
			];
		}

		/**
		 *	Adding event listeners to the ui components 
		 * 
		 */
		override protected function addEventListeners():void
		{
			view.btnBack2Menu.addEventListener(MouseEvent.CLICK, onBack2MenuClick);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function onBack2MenuClick(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.OPEN_MENU);
		}
		
		/**
		 * handleNotification
		 * 
		 * @param notification
		 * 
		 */		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case NotificationConstants.DATA_LOADED:
					break;
			}
		}
		
		/**
		 * ISetupViewMediator :: setupView
		 * 
		 */		
		override public function setupView():void
		{
			view.setupUI();
			addEventListeners();
		}
		
		public function applyHighScores(highScoresVO:HighScoresVO):void
		{
			if (highScoresVO.pingpongScores.length == 0)
			{
				view.addChild(view.lblNoData);
			}
			else
			{
				if (view.contains(view.lblNoData))
					view.removeChild(view.lblNoData);
				
				// removing previous score items
				for (var j:int = view.numChildren - 1; j >= 0 ; j--)
				{
					if (view.getChildAt(j) is ScoreItem)
					{
						view.removeChildAt(j);
					}
				}
				
				// only first 5 scores are displayed
				var max:int = ( highScoresVO.pingpongScores.length < 5 ? highScoresVO.pingpongScores.length : 5);
					
				var scoreItem:ScoreItem;
				for (var i:int=0; i<max; i++)
				{
					scoreItem = new ScoreItem(highScoresVO.pingpongScores[i])
					view.addChild(scoreItem);
				}
			}
	
		}
		
		/**
		 * get view
		 * @return 
		 * 
		 */		
		public function get view():HighScoresView
		{
			return viewComponent as HighScoresView; 
		}
	}
}
