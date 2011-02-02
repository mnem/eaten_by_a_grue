package grue.text
{
    import flash.text.TextFormatAlign;
    import flash.display.Sprite;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    import flash.text.TextFormat;

    /**
     * @author dave
     */
    public class GrueTextField
        extends Sprite
    {
        protected var textfield:TextField;

        public function GrueTextField()
        {
            mouseChildren = false;

            textfield = new TextField();

            var format:TextFormat = textfield.defaultTextFormat;
            format.font = "Arial";
            format.size = 11;
            format.color = 0xffffff;
            format.align = TextFormatAlign.CENTER;
            textfield.defaultTextFormat = format;

            addChild(textfield);

            autosize();
        }

        protected function autosize():void
        {
            textfield.width = int(textfield.textWidth + 15);
            textfield.height = int(textfield.textHeight + 5);

            width = textfield.width;
            height = textfield.height;

            boxify();
        }

        protected function boxify():void
        {
            graphics.clear();
            graphics.lineStyle(3, 0x000000, 0.5);
            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(0, 0, width, height);
            graphics.endFill();
        }

        public function get text():String
        {
            return textfield.text;
        }

        public function set text(text:String):void
        {
            textfield.text = text;
            autosize();
        }
    }
}
