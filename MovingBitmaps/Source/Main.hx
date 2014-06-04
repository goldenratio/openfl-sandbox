package;

import openfl.Lib;
import openfl.events.MouseEvent;
import openfl.Vector;
import openfl.events.Event;
import openfl.display.Sprite;


class Main extends Sprite
{

    private var _list:Vector<MyCircle> =  new Vector<MyCircle>();

    /**
     * Constructor
    **/
    public function new ()
    {
        super ();
        addEventListener(Event.ADDED_TO_STAGE, addedToStage, false);
    }


    private function addedToStage(event:Event):Void
    {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStage, false);
        init();
    }

    private function init():Void
    {
        stage.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
        stage.addEventListener(MouseEvent.CLICK, onMouseClick);
    }

    private function onMouseClick(event:MouseEvent):Void
    {
        for (i in 0...20)
        {
            var gfx:MyCircle = new MyCircle();
            gfx.x = Math.random() * stage.stageWidth - 100;
            gfx.y = Math.random() * stage.stageHeight - 100;
            stage.addChild(gfx);

            _list.push(gfx);
        }

    }

    private function onEnterFrameHandler(event:Event):Void
    {
        for (circle in _list)
        {
            circle.update();
        }
    }

}