package grue
{
    import flash.display.Sprite;

    /**
     * @author dave
     */
    public class Square 
        extends Sprite
    {
        public function Square()
        {
            graphics.lineStyle(3);
            graphics.beginFill(0x873e00, 0.5);
            graphics.drawRect(0, 0, 64, 64);
            graphics.endFill();
        }
    }
}
