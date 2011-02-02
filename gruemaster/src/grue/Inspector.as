package grue
{
    import grue.text.GrueTextField;
    import flash.display.Sprite;
    import flash.system.ApplicationDomain;
    /**
     * @author dave
     */
    public class Inspector
    {
        protected static const CIRCLE:String = "grue.Circle";
        protected static const SQUARE:String = "grue.Square";

        public static function inspect(victim:Sprite, yOffset:int):void
        {
            reportOnDefinition(victim, CIRCLE, yOffset);
            reportOnDefinition(victim, SQUARE, yOffset + 40);
        }

        public static function reportOnDefinition(victim:Sprite, definition:String, yOffset:int):void
        {
            var cd:ApplicationDomain = victim.loaderInfo.applicationDomain;
            var pd:ApplicationDomain = cd.parentDomain;

            var a:GrueTextField = getOutput(victim, "cd" + definition);
            var b:GrueTextField = getOutput(victim, "pd" + definition);

            a.x = 10;
            a.y = yOffset + 20;

            b.x = 10;
            b.y = yOffset + 38;

            a.text = "CD contains " + definition + ": " + cd.hasDefinition(definition);
            if(pd != null)
            {
                b.text = "PD contains " + definition + ": " + pd.hasDefinition(definition);
            }
            else
            {
                b.text = "There is no PD";
            }
        }

        protected static function getOutput(victim:Sprite, name:String):GrueTextField
        {
            var label:GrueTextField = victim.getChildByName(name) as GrueTextField;

            if(label == null)
            {
                label = new GrueTextField();
                label.name = name;
                victim.addChild(label);
            }

            return label;
        }
    }
}
