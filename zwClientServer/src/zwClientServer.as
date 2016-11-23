package
{
	import Logic.Manager;
	
	import UI.UIManager;
	
	import flash.display.Sprite;
	
	[SWF(frameRate="60",width="1800",height="900")]
	public class zwClientServer extends Sprite
	{
		public var manager:Manager=new Manager();
		public var server:Server=new Server();
		public var client:Client=new Client();
		private var _uiManager:UIManager=new UIManager(stage);
		
		public function zwClientServer()
		{
			if(stage)
			{
				if(!_uiManager)
				{
					_uiManager=new UIManager(stage);
				}
				_uiManager.open("coming");
			}
		}
	}
}