package grue.button
{
    import flash.display.Sprite;
    import grue.text.GrueTextField;


    /**
     * @author dave
     */
    public class GrueButton
        extends Sprite
    {
        protected var label:GrueTextField;
        protected var _enabled:Boolean = true;

        public function GrueButton()
        {
            label = new GrueTextField();
            addChild(label);

            mouseChildren = false;
            buttonMode = true;
        }

        public function get text():String
        {
            return label.text;
        }

        public function set text(text:String):void
        {
            label.text = text;
        }

        public function get enabled():Boolean
        {
            return _enabled;
        }

        public function set enabled(enabled:Boolean):void
        {
            _enabled = enabled;
            if(_enabled)
            {
                alpha = 1.0;
            }
            else
            {
                alpha = 0.5;
            }
            mouseEnabled = _enabled;
            buttonMode = _enabled;
        }
    }
}
