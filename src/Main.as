package
{
	import com.epam.pingonoid.view.components.SpriteAdv;
	import com.epam.pingonoid.view.views.MainView;
	
	import flash.events.Event;
	
	[SWF(width="800", height="480", backgroundColor='#555555', frameRate="60")]
	public class Main extends SpriteAdv
	{
		public static const FRAME_RATE:int = 60;
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function Main()
		{
			super();
		}
		
		
		/**
		 * init
		 * 
		 * @param e
		 * 
		 */		
		override protected function init(e:Event = null) : void 
		{
			super.init(e);
			
			_mainView = new MainView();
			_mainView.width = stage.stageWidth;
			_mainView.height = stage.stageHeight;
			
			addChild(_mainView);
			
			ApplicationFacade.getInstance().startup(this);
		}
		
		
		public function get mainView() : MainView
		{
			return _mainView;
		}
		
		private var _mainView:MainView;
	}
}