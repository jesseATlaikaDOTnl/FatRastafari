package{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.ui.Keyboard;
	import flash.events.*;
	
	public class FatRastafari extends MovieClip{
		var vspeed=0;
		var game;
		var goleft:Boolean=false,goright:Boolean=false,gojump:Boolean=false;
		public function FatRastafari(stage:Stage){
			trace("Rastafari sais: One love!");
			this.walk.stop();
			this.focusRect=false;
			this.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP,keyUp);
			this.addEventListener(FocusEvent.FOCUS_OUT,reFocus);
			stage.focus = this;
		}
		private function keyDown(event:KeyboardEvent){
			if(event.keyCode==Keyboard.LEFT){
				goleft=true;
			}
			if(event.keyCode==Keyboard.RIGHT){
				goright=true;
			}
			if(event.keyCode==Keyboard.UP){
				gojump=true;
			}
		}
		private function keyUp(event:KeyboardEvent){
			if(event.keyCode==Keyboard.LEFT){
				goleft=false;
			}
			if(event.keyCode==Keyboard.RIGHT){
				goright=false;
			}
			if(event.keyCode==Keyboard.UP){
				gojump=false;
			}
		}
		private function reFocus(event:FocusEvent){
			stage.focus = this;
		}
	}
}