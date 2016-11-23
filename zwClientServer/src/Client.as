package
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public class Client
	{
		private var _socket:Socket = new Socket();
		public function Client()
		{
			
		}
		public function connect(host:String,port:int = 80):void
		{
			_socket.addEventListener(Event.CONNECT,onConnect);
			_socket.connect(host,port);
		}
		public function onConnect(e:Event):void
		{
			_socket.addEventListener(ProgressEvent.SOCKET_DATA,onSocketData)
		}
		private function onSocketData(e:ProgressEvent):void
		{
			var buffer:ByteArray = new ByteArray();
			var str:String = _socket.readUTFBytes(_socket.bytesAvailable);
			dataCallBack(str);
		}
		private var dataCallBack:Function;
		public function setDataCB(f:Function):void
		{
			dataCallBack = f;
		}
		public function send(message:String):void
		{
			try
			{
				if(_socket!=null&&_socket.connected)
				{
					_socket.writeUTFBytes(message);
					_socket.flush();
				}
			}
			catch(error:Error)
			{
				
			}
		}
	}
}
















