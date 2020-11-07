import de.bezier.data.sql.*;
import processing.net.*; //
import hypermedia.net.*;

UDP udp;
JSONObject response;
Server s;

int red1 = 255;
int green1 =251;
int blue1 =150;

int red2 = 255;
int green2 =251;
int blue2 =150;

int red3 = 255;
int green3 =251;
int blue3 =150;

int red4 = 255;
int green4 =251;
int blue4 =150;


void setup()
{
    size( 1000, 800 );
  udp = new UDP( this, 8300 );
  udp.log( true );     // <-- printout the connection activity
  udp.listen( true );
  s = new Server(this, 8300);
}


void draw(){
  
  fill(red1, green1, blue1);
  ellipse(180,547,30,30);
  fill(red2, green2, blue2);
  ellipse(250,484,30,30);
  fill(red3, green3, blue3);
  ellipse(535,210,30,30);
  fill(red4, green4, blue4);
  ellipse(590,160,30,30);
  
  fill(255, 158, 44); //dark yellow
  rect(660,150,200,10);
  
  fill(20, 177, 171); // green
  rect(750,160,70,500);
  
  fill(255, 158, 44);
  translate(width/2, height/2);
  rotate(PI/3.9);
  rect(-82, -290, 20, 710);
  
}

void draw1(int num){

  switch(num){
     case 1:
      red1 = 255;//(255,111,105)(252,52,104)255,8,74
      green1 = 8;
      blue1 = 74;
      break;
      
      case 2:
      red2 = 255;//(255,111,105)(252,52,104)255,8,74
      green2 = 8;
      blue2 = 74;
      break;
      
      case 3:
       red3 = 255;//(255,111,105)(252,52,104)255,8,74
      green3 = 8;
      blue3 = 74;
      break;
      
      case 4:
      red4 = 255;//(255,111,105)(252,52,104)255,8,74
      green4 = 8;
      blue4 = 74;
      break;
  }
}


void receive( byte[] data, String ip, int port ) { 
  
  data = subset(data, 0, data.length);
  String message = new String( data ); //format : 0/1/0/1
  
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
  String dbString[] = message.split("/");
 
  if(dbString[0].equals("1")){
    draw1(1);
    
  }if(dbString[1].equals("1")){
     draw1(2);
    
  }if(dbString[2].equals("1")){
     draw1(3);
    
  }if(dbString[3].equals("1")){
     draw1(4);
  }
}
