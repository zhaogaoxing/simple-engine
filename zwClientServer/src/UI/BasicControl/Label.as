package UI.BasicControl
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	public class Label extends Sprite
	{
		public function Label(text:String="",font:String="simsun",size:uint=20,color:int=0x00000)
		{
			super();
			var name:TextField=new TextField();
			var format:TextFormat=new TextFormat();
			format.font=font;
			format.size=size;
			format.color=color;
			name.defaultTextFormat=format;
			name.autoSize=TextFieldAutoSize.CENTER;
			name.text=text;
			this.addChild(name);
		}
	}
}