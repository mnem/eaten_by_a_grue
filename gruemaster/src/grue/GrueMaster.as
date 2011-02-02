package grue
{
    import grue.button.GrueButton;

    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;


    /**
     * @author dave
     */
    public class GrueMaster
        extends Sprite
    {
        protected var loadCircle:GrueButton;
        protected var loadSquare:GrueButton;

        protected var circleLoader:Loader;
        protected var squareLoader:Loader;

        public function GrueMaster()
        {
            loadCircle = createButton("Load Circle", loadCircleClick, 0);
            loadSquare = createButton("Load Square", loadSquareClick, 100);

            addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        }

        protected function handleAddedToStage(event:Event):void
        {
            addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
        }

        protected function createButton(label:String, clickHandler:Function, xOffset:int):GrueButton
        {
            var b:GrueButton = new GrueButton();

            b.text = label;
            b.x = xOffset + 10;
            b.y = 10;
            b.addEventListener(MouseEvent.CLICK, clickHandler);
            addChild(b);

            return b;
        }

        protected function load(path:String, xOffset:int, yOffset:int):Loader
        {
            var l:Loader = new Loader();

            l.x = xOffset;
            l.y = yOffset;

            addChild(l);

            l.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
            l.load(new URLRequest(path), new LoaderContext(false, new ApplicationDomain(ApplicationDomain.currentDomain)));

            return l;
        }

        protected function loaded(event:Event):void
        {
            var li:LoaderInfo = LoaderInfo(event.target);

            li.removeEventListener(Event.COMPLETE, loaded);

            updateReports();
        }

        protected function updateReports():void
        {
            Inspector.inspect(this, 20);

            if(circleLoader != null)
            {
                Inspector.inspect(Sprite(circleLoader.content), 50);
            }

            if(squareLoader != null)
            {
                Inspector.inspect(Sprite(squareLoader.content), 50);
            }
        }

        protected function loadCircleClick(event:MouseEvent):void
        {
            loadCircle.enabled = false;
            circleLoader = load("Circle.swf", 30, 150);
        }

        protected function loadSquareClick(event:MouseEvent):void
        {
            loadSquare.enabled = false;
            squareLoader = load("Square.swf", 230, 150);
        }
    }
}
