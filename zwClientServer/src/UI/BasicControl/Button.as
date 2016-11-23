package UI.BasicControl
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Button extends Sprite
	{
		public function Button(width:int=50,height:int=30,color:uint=0xffffff)
		{
			super();
			this.buttonMode=true;
			this.mouseEnabled=true;
			this.mouseChildren=true;
			this.graphics.beginFill(color);
			this.graphics.drawRoundRect(0,0,width,height,10);
			this.graphics.endFill();
			this.addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
		}
		private function downHandler(e:MouseEvent):void
		{
			this.addEventListener(MouseEvent.MOUSE_UP,upHandler);
			this.alpha = 0.75;
		}
		private function upHandler(e:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
			this.alpha=1;
		}
		public function setTitle(str:String="",font:String="simsun",size:uint=20,color:int=0x000000):void
		{
			var name:TextField = new TextField();
			var format:TextFormat = new TextFormat();
			format.font = font;
			format.size = size;
			format.color = color;
			name.defaultTextFormat = format;
			name.autoSize = TextFieldAutoSize.CENTER;
			name.text=str;
			name.x=(this.width-name.width)/2;
			name.y=(this.height-name.height)/2;
			this.addChild(name);
		}
	}
}
















