// JavaScript Document
var MaxImg = 6;
var NowImg = 1;
var bStart = 0;
var bStop =0;   
var begin;
var interval = 3000;
var next = 0;
function initialization(){
//debugger;
	bStop = 0;
	next = NowImg + 1;
	if(next == MaxImg+1){
		NowImg = MaxImg;
		next = 1;
	}	 
	if(bStop != 1){
		if(bStart == 0){
			bStart = 1;	
			begin = setTimeout('initialization()', interval);	
			return;
		}else{
			$("#pic"+NowImg).fadeOut(600, function(){
				$('#pic'+next).fadeIn(1000);
			});
			//setTimeout($('#pic'+next).fadeIn(1000),1000);
			document.getElementById("letter" + next).style.display="";
			document.getElementById("letter" + NowImg).style.display="none";
				   
			for (var i=1;i<=MaxImg;i++){
				document.getElementById("num"+i).className="link";
				if(i == next){
					document.getElementById("num"+i).className="current";
				}
			}			
			if(NowImg == MaxImg) 
				NowImg = 1;
			else
				NowImg++;	
		}		
		begin = setTimeout('initialization()', interval);	
	}
}
function showit(x){
	bStop=1;
	clearTimeout(begin);
	for (var i=1;i<=MaxImg;i++){
		document.getElementById("pic" + i).style.display="none";
		document.getElementById("letter" + i).style.display="none";
		//document.getElementById("brief" + i).style.display="none";
		document.getElementById("num"+i).className="link";
		if(i == x){
			document.getElementById("pic" + i).style.display="block";
			document.getElementById("letter" + i).style.display="block";
			//document.getElementById("brief" + i).style.display="block";
			document.getElementById("num"+i).className="current";
		}		
	}	
	NowImg=x;
}
function stopit(){	
	clearTimeout(begin);
}
function playit(){	
	begin = setTimeout('initialization()', interval);	
}
begin = setTimeout('initialization()', interval);	