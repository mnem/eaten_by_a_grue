package grue
{
    import flash.display.Sprite;

    /**
     * @author dave
     */
    public class Circle
        extends Sprite
    {
        public function Circle()
        {
            graphics.lineStyle(3);
            graphics.beginFill(0xc1628b, 0.5);
            graphics.drawEllipse(0, 0, 64, 64);
            graphics.endFill();
        }
    }
}
