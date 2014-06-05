package;


import openfl.Assets;
import openfl.text.Font;
import openfl.text.AntiAliasType;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Sprite;

#if js
@:font("Assets/Handycandy.ttf") class HandyCandyFont extends Font {}
#end

class Main extends Sprite
{

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
        #if js
        Font.registerFont(HandyCandyFont);
        #end

        var font:Font = Assets.getFont("assets/Handycandy.ttf");

        #if js
        var format:TextFormat = new TextFormat("Handycandy", 40, 0xffffff);
        #else
        var format:TextFormat = new TextFormat(font.fontName, 40, 0xffffff);
        #end

        var tf:TextField = new TextField();
        tf.defaultTextFormat = format;
        tf.embedFonts = true;
        tf.autoSize = TextFieldAutoSize.LEFT;
        tf.antiAliasType = AntiAliasType.ADVANCED;
        tf.selectable = false;

        tf.text = "Hello OpenFL!!";

        stage.addChild(tf);

    }
	
}