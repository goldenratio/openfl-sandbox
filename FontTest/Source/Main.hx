package;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import openfl.Vector;
import openfl.text.TextFieldAutoSize;
import openfl.events.Event;
import openfl.Assets;
import openfl.text.Font;
import openfl.text.AntiAliasType;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Sprite;

class Main extends Sprite
{

    private var _list:Vector<Sprite> = new Vector<Sprite>();
    private var _font:Font = Assets.getFont("assets/Starjedi.ttf");

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
        addText();
        addEventListener(Event.ENTER_FRAME, onEnterFrame);

        var timer:Timer = new Timer(1000);
        timer.addEventListener(TimerEvent.TIMER, onTimerLoop);
        timer.start();

    }

    private function onTimerLoop(event:TimerEvent):Void
    {
        addText();
    }

    private function addText():Void
    {
        var color:UInt = Math.floor(Math.random() * 0xffffff);
        var format:TextFormat = new TextFormat(_font.fontName, 160, color);

        var tf:TextField = new TextField();
        tf.defaultTextFormat = format;
        tf.embedFonts = true;
        tf.autoSize = TextFieldAutoSize.LEFT;
        tf.antiAliasType = AntiAliasType.ADVANCED;
        tf.selectable = false;
        tf.text = "Hello openFL!!";

        var sprite:Sprite = new Sprite();

        #if js
        tf.x = -(tf.width * 0.5);
        tf.y = -(tf.height * 0.5);
        sprite.addChild(tf);
        #else
        var bmd:BitmapData = new BitmapData(Std.int(tf.width), Std.int(tf.height), true, 0x00000000);
        bmd.draw(tf);

        var bitmap:Bitmap = new Bitmap(bmd);
        bitmap.x = -(bitmap.width * 0.5);
        bitmap.y = -(bitmap.height * 0.5);
        bitmap.smoothing = true;
        sprite.addChild(bitmap);
        #end

        sprite.x = 300 + Math.random() * (stage.stageWidth - 600);
        sprite.y = 100 + Math.random() * (stage.stageHeight - 200);
        sprite.scaleX = 0.2;
        sprite.scaleY = 0.2;
        sprite.alpha = 0;
        stage.addChild(sprite);

        _list.push(sprite);
    }

    private function onEnterFrame(event:Event):Void
    {
        for(i in 0..._list.length)
        {
            var sprite:Sprite = _list[i];
            if(sprite.scaleX <= 4)
            {
                sprite.scaleX += 0.01;
                sprite.scaleY += 0.01;

                if(sprite.scaleX < 2 && sprite.alpha < 1)
                {
                    sprite.alpha += 0.01;
                }

                if(sprite.scaleX >= 2)
                {
                    sprite.alpha -= 0.01;
                }
                if(sprite.scaleX >= 4)
                {
                    _list.splice(i, 1);
                    stage.removeChild(sprite);
                    break;
                }
            }

        }
    }
	
}