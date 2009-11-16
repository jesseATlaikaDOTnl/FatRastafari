package{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class FatRastaGame extends MovieClip{
		var rastafari:FatRastafari;
		var timer:Timer;
		var bloklist:Array;
		var coplist:Array;
		var cop:FatCop;
		
		var gravity:Number=0.4;
		public function FatRastaGame(){
			rastafari = new FatRastafari(this.stage);
			rastafari.x=10;
			rastafari.y=10;
			rastafari.game=this;
			this.addChild(rastafari);
			
			var blok,i=0;
			bloklist=new Array();
			for(var xx:uint=0;xx<=500;xx+=50){
				blok=new Blok();
				blok.x=xx;
				blok.y=450;
				if(xx==0){
					blok.y=400;
				}
				this.addChild(blok);
				bloklist[i]=blok;
				i++;
			}
			coplist=new Array();
			
			timer = new Timer(1000/30);
			timer.addEventListener("timer",repeatThis);
			timer.start();
		}
		
		public function repeatThis(event:TimerEvent){
			if(Math.random()*60<1){
				cop=new FatCop();
				coplist[coplist.length]=cop;
			}
			doRepeatThis(rastafari);
			for(var i:uint=0;i<coplist.length;i++){
				doRepeatThis(coplist[i]);
			}
		}
		
		private function doRepeatThis(who:MovieClip){
			var i=collide(who,0,0)
			if(i>0){
				who.y--;
				if(who.vspeed>0){
					who.vspeed=0;
				}
			}
	
			if(!collide(who,0,1) || who.vspeed<0){
				who.vspeed+=gravity;
			}
			who.y+=who.vspeed;
	
			var walk:Boolean=false;
			if(who.goleft && !collide(who,-5,-10)){
				who.x-=5;
				walk=true;
				who.gotoAndStop("Left");
			}
	
			if(who.goright && !collide(who,5,-10)){
				who.x+=5;
				walk=true;
				who.gotoAndStop("Right");
			}
			if(who.goright && who.goleft){
				walk=false;
			}
	
			if(!walk){
				who.gotoAndStop("Stand");
			}
	
			if(who.gojump && collide(who,0,10)){
				who.vspeed=-8;
			}
	
			if(who.y>1000){
				who.x=10;
				who.y=10;
				who.vspeed=0;
			}
		}
		
		public function collide(obj:MovieClip,offx:int,offy:int){
			var hit:Boolean=false,other,t;
			for(var i:uint=0;i<bloklist.length;i++){
				t=bloklist[i]
				if(	obj.x+offx+obj.width>=t.x &&
					obj.x+offx<=t.x+t.width &&
					obj.y+offy+obj.height>=t.y &&
					obj.y+offy<=t.y+t.height
				){
					return(i+1);
				}
			}
			return(0);
		}
	}
}