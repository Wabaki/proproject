package actionScript.portfolios.diagramm
{
	import mx.collections.ArrayCollection;
	import mx.core.Container;
	import mx.formatters.NumberFormatter;

	public class ItemContainer extends Container
	{
		var ring:DynamicRing2;
		var ring2:DynamicRing2;
		var days:Number;
		var formatter:NumberFormatter = new NumberFormatter();
		public var sd:ArrayCollection = new ArrayCollection();
		public var info:InfoShape;
		public function ItemContainer(shape:Number=0,radius:Number=25,x:Number=0,y:Number=0,days:Number=0,heute:Number=0,progress1:Number=0,progress2:Number=0,info:InfoShape=null)
		{
			if(y > 0){
				y = Math.abs(((y/100)*430)-430);	
			}else{
				y = 410;
			}
			if(x > 0){
				x =(x/100)*820;
			}else{
				x = 20;
			}
			
			//var pr2:Number = (progress1 / days)*100;
			trace("progress1 "+progress1);
			var pr1:Number = ((heute-progress1) / days)*100;
			if(pr1>=100){
				pr1 =100;
			}
			trace("pr1"+pr1);
			trace("heute "+heute);
			
			
			radius = radius * 15;
			formatter.rounding = "down";
			formatter.precision = 0;
			ring = new DynamicRing2(radius,pr1);
			ring2 = new DynamicRing2(radius+7,progress2,3,0x00ff10);
			this.info=info;
			switch (shape){
				case 0:
				var square = new DynamicSquare(radius,radius);
				square.x = ring.x-(square.width/2);
				square.y = ring.y-(square.height/2);
				rawChildren.addChild(square);
				break;
				case 1:
				var tri = new DynamicTriangle(radius);
				tri.x = ring.x+radius-(tri.width/1.5);
				tri.y = ring.y+radius-(tri.height);
				rawChildren.addChild(tri);
				break;
			}
			this.x=x;
			this.y=y;
			rawChildren.addChild(ring);
			rawChildren.addChild(ring2);
			
		}
		
		public function put(str1,str2):void {
			sd.addItem(new SimpleInfoData(str1,str2));
		}
		
		public function goFrwd(progress){
			ring.reFill(progress);
		}
		public function getXValue():String {
			return formatter.format((x/820)*100);
		}
		public function getYValue():String {
			return formatter.format(Math.abs(((y/430)*100)-100));
		}
		
	}
}