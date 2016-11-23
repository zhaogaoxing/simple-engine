package UI.DIALOG
{
	import Logic.Manager;
	
	import UI.BasicControl.Button;
	import UI.BasicControl.InputField;
	import UI.BasicControl.Label;
	
	import flash.events.*;

	public class DlgConnect extends BasicDlg
	{
		public function DlgConnect()
		{
			super();
		}
		private var _host:Label=new Label("主机");
		private var _hostCode:InputField=new InputField(200,20);
		private var _listen:Button=new Button(90,30,0x006600);
		private var _connect:Button=new Button(90,30,0x006600);
		public function initialize():void
		{
			_host.x=0;
			_host.y=0;
			_hostCode.x=0;
			_hostCode.y=_host.height+20;
			this.addChild(_host);
			this.addChild(_hostCode);
			_listen.setTitle("建立主机");
			_listen.x=0;
			_listen.y=_hostCode.y+_hostCode.height+20;
			_connect.setTitle("连接主机");
			_connect.x=_listen.width+20;
			_connect.y=_listen.y;
			this.addChild(_listen);
			this.addChild(_connect);
			_listen.addEventListener(MouseEvent.CLICK,listen);
			_connect.addEventListener(MouseEvent.CLICK,connect);
		}
		private function listen(e:MouseEvent):void
		{
			_listen.removeEventListener(MouseEvent.CLICK,listen);
			Manager.setServer();
			this.closeCallBack();
		}
		private function connect(e:MouseEvent):void
		{
			_connect.removeEventListener(MouseEvent.CLICK,connect);
			Manager.setClient();
			this.closeCallBack();
		}
	}
}














