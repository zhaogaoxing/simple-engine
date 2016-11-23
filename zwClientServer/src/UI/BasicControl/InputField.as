package UI.BasicControl
{
	import flash.display.Sprite;
	import flash.text.*;
	
	
	public class InputField extends Sprite
	{
		public function InputField(width:uint=50,height:uint=20,border:Boolean=true,bordercolor:uint=0x000000,textcolor:uint=0x000000)
		{
			super();
			var input:TextField=new TextField();
			input.type=TextFieldType.INPUT;
			input.border=border;
			if(border)
			{
				input.borderColor=bordercolor;	
			}
			input.width=width;
			input.height=height;
			var format:TextFormat=new TextFormat();
			format.size=height-4;
			input.defaultTextFormat=format;
			this.addChild(input);
		}
	}
}