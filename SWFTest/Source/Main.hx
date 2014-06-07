package;


import openfl.display.MovieClip;
import openfl.Assets;
import openfl.events.Event;
import openfl.display.Sprite;


class Main extends Sprite
{

	public function new ()
    {
		super ();
        addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

    private function addedToStage(event:Event):Void
    {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
        init();
    }

    private function init():Void
    {
        Assets.loadLibrary("swfLib", onLibLoaded);
    }

    private function onLibLoaded(lib:AssetLibrary):Void
    {
        var flowerMC:MovieClip = Assets.getMovieClip("swfLib:Flower");
        flowerMC.x = (stage.stageWidth - flowerMC.width) * 0.5;
        flowerMC.y = (stage.stageHeight - flowerMC.height) * 0.5;
        stage.addChild(flowerMC);
    }
	
}