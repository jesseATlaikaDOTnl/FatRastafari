package{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class FatCop extends MovieClip{
		var vspeed=0;
		var timer:Timer;
		var goleft:Boolean=false,goright:Boolean=false,gojump:Boolean=false;
		public function FatCop(){
			trace("Cop sais: Get over here!");
			timer = new Timer(1000/30);
			timer.addEventListener("timer",repeatThis);
			timer.start();
		}
		
		public function repeatThis(event:TimerEvent){
			this.x+=5;
		}
	}
}