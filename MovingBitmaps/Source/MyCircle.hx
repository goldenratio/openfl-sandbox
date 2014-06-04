package ;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import motion.Actuate;
import motion.easing.Quad;
import openfl.geom.Point;
import openfl.Assets;


/**
 * ...
 * @author Makubex
 */
class MyCircle extends Bitmap
{

	private var _direction:Int = 1;
	private var _speed:Point = new Point(4, 4);
	public function new() 
	{
		super();

		this.bitmapData = Assets.getBitmapData ("assets/egghead.png");
		this.cacheAsBitmap = true;
		
		this.alpha = 0;
		this.scaleX = 0.1;
		this.scaleY = 0.1;
		if (Math.floor(Math.random() * 10) > 5)
		{
			_direction = -1;
		}
		
		_speed.x = (Math.random() * 2) + 2;
		_speed.y = (Math.random() * 2) + 2;
		
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedStageHL);
			
	}
	
	private function onAddedStageHL(event:Event):Void
	{
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedStageHL);
		Actuate.tween( this, 2, { alpha:1, scaleX:0.6, scaleY: 0.6 } );
	}
	
	public function update(): Void
	{
		this.x += _speed.x * _direction;
		this.y += _speed.y * _direction;
		
		if(this.x < -150)
                this.x = this.stage.stageWidth + 150;

		if(this.y < -150)
			this.y = this.stage.stageHeight + 150;

			
		if(this.x > this.stage.stageWidth + 150)
			this.x = -150;

		if(this.y > this.stage.stageHeight + 150)
			this.y = -150;
	}
	
}