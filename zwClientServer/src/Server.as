package
{
	import flash.events.ProgressEvent;
	import flash.events.ServerSocketConnectEvent;
	import flash.net.ServerSocket;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public class Server
	{
		private var _socket:ServerSocket = new ServerSocket();
		private var _client:Socket;
		public function Server()
		{
		}
		public function listen():void
		{
			if(_socket.bound)
			{
				_socket.close();
				_socket = new ServerSocket();
			}
			_socket.bind(80,"0.0.0.0");
			_socket.addEventListener(ServerSocketConnectEvent.CONNECT,onConnect);
			_socket.listen();
		}
		private function onConnect(e:ServerSocketConnectEvent):void
		{
			_client = e.socket;
			_client.addEventListener(ProgressEvent.SOCKET_DATA,onClientSocketData);
		}
		private function onClientSocketData(e:ProgressEvent):void
		{
			var buffer:ByteArray = new ByteArray;
			var str:String = _client.readUTFBytes(_client.bytesAvailable);
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
				if(_client!=null&&_client.connected)
				{
					_client.writeUTFBytes(message);
					_client.flush();
				}
			}
			catch(error:Error)
			{
				
			}
		}
	}
}


















