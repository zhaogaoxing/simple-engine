package UI.DIALOG
{
	import Logic.Manager;
	
	import UI.BasicControl.Button;
	
	import flash.events.*;
	import flash.text.TextField;
	public class DlgBattle extends BasicDlg
	{
		public var server:Server;
		public var client:Client;
		public function DlgBattle()
		{
			super();
			if(Manager.player==0)
			{
				server=new Server();
				server.listen();
			}
			else if(Manager.player==1)
			{
				client = new Client();
				client.connect("172.16.2.20");
			}
		}
		private var _scissors:Button=new Button(50,30,0x006600);
		private var _rock:Button=new Button(50,30,0x006600);
		private var _paper:Button=new Button(50,30,0x006600);
		private var _succ:TextField=new TextField();
		public function initialize():void
		{
			_scissors.setTitle("剪刀");
			_rock.setTitle("石头");
			_paper.setTitle("布");
			_scissors.x=0;
			_scissors.y=0;
			_rock.x=_scissors.width+10;
			_rock.y=0;
			_paper.x=_rock.x+_rock.width+10;
			_paper.y=0;
			_scissors.addEventListener(MouseEvent.CLICK,clkS);
			_rock.addEventListener(MouseEvent.CLICK,clkR);
			_paper.addEventListener(MouseEvent.CLICK,clkP);
			this.addChild(_scissors);
			this.addChild(_rock);
			this.addChild(_paper);
			_succ.x=stage.stageWidth/2;
			_succ.y=stage.stageHeight/2;
			_succ.text="结果：";
			this.addChild(_succ);
		}
		private var _success:int;
		private var _self:int;
		public function game(str:String):void
		{
			if(Manager.player==0)
			{
				var op:int=int(str);
				if(op==_self)
					_success=0;
				else if(_self==0&&op==1)
					_success=-1;
				else if(_self==0&&op==2)
					_success=1;
				else if(_self==1&&op==0)
					_success=1;
				else if(_self==1&&op==2)
					_success=-1;
				else if(_self==2&&op==0)
					_success=-1;
				else if(_self==2&&op==1)
					_success=1;
				server.send(String(_success));
				if(int(str)==-1)
				{
					_succ.text="输";
				}
				else if(int(str)==0)
				{
					_succ.text="平";
				}
				else if(int(str)==1)
				{
					_succ.text="赢";
				}
			}
			else if(Manager.player==1)
			{
				if(int(str)==-1)
				{
					_succ.text="赢";
				}
				else if(int(str)==0)
				{
					_succ.text="平";
				}
				else if(int(str)==1)
				{
					_succ.text="输";
				}
			}
		}
		private function clkS(e:MouseEvent):void
		{
			if(Manager.player==0)
			{
				_self=0;
				server.setDataCB(game);
			}
			else if(Manager.player==1)
			{
				client.send("0");
				client.setDataCB(game);
			}
		}
		private function clkR(e:MouseEvent):void
		{
			if(Manager.player==0)
			{
				_self=1;
				server.setDataCB(game);
			}
			else if(Manager.player==1)
			{
				client.send("1");
				client.setDataCB(game);
			}
		}
		private function clkP(e:MouseEvent):void
		{
			if(Manager.player==0)
			{
				_self=2;
				server.setDataCB(game);
			}
			else if(Manager.player==1)
			{
				client.send("2");
				client.setDataCB(game);
			}
		}
	}
}


















