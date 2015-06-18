package com.epam.pingonoid.view.components
{
	import com.epam.pingonoid.model.VO.ScoreVO;
	
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class ScoreItem extends SpriteAdv
	{
		protected var lblName:TextField = new TextField();
		protected var lblScore:TextField  = new TextField();
		
		private var _scoreVO:ScoreVO;
		
		public function set scoreVO(value:ScoreVO):void
		{
			_scoreVO = value;
			
			lblName.text = value.name;
			lblScore.text = value.points.toString();
		}
		
		public function ScoreItem(scoreVO:ScoreVO)
		{
			super();
			
			lblName = new TextField();
			lblScore = new TextField();

			this.scoreVO = scoreVO;

			lblName.autoSize = TextFieldAutoSize.LEFT;
			lblScore.autoSize = TextFieldAutoSize.LEFT;
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = 30;
			textFormat.font = "Comic Sans MS";			
			
			lblName.setTextFormat(textFormat);
			addChild(lblName);
			
			lblScore.setTextFormat(textFormat);
			addChild(lblScore);			
		}
		
		
		override protected function init(e:Event=null):void
		{
			super.init(e);
			
			lblName.x = this.x;
			lblName.y = this.y;
			
			lblScore.x = lblName.x + lblName.width + 50;
			lblScore.y = this.y;
		}
	}
}