import controlP5.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage msgS1Play, msgS1Dist, msgS2Play, msgS2Dist, msgS3Play, msgS3Dist;

ControlP5 slider1, slider2, slider3;
int sliderValue1,sliderValue2,sliderValue3;
int playValue1, playValue2, playValue3;


void setup(){
  size(400,300);
  oscP5 = new OscP5(this, 7400);
  myRemoteLocation = new NetAddress("127.0.01", 7400);
  
  //Slider1 -----------------------------------
  slider1 = new ControlP5(this);
  slider1.addSlider("sliderValue1")
    .setLabel("sensor1")
    .setRange(0, 8)//0~8の間
    .setValue(0)//初期値
    .setPosition(50, 50)//位置
    .setSize(200, 20)//大きさ
    .setNumberOfTickMarks(9);//Rangeを(引数の数-1)で割った値が1メモリの値
    
  //スライダーの現在値の表示位置
  slider1.getController("sliderValue1").getValueLabel()
    .align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE)//位置、外側の右寄せ
    .setPaddingX(-20);//padding値をとる alineで設定したRIGHTからのpadding
    
  //Slider2 -----------------------------------
  slider2 = new ControlP5(this);
  slider2.addSlider("sliderValue2").setLabel("sensor2").setRange(0, 8).setValue(0).setPosition(50, 100).setSize(200, 20).setNumberOfTickMarks(9);
  slider2.getController("sliderValue2").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(-20);
  
  //Slider3 -----------------------------------
  slider3 = new ControlP5(this);
  slider3.addSlider("sliderValue3").setLabel("sensor3").setRange(0, 8).setValue(0).setPosition(50, 150).setSize(200, 20).setNumberOfTickMarks(9);
  slider3.getController("sliderValue3").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(-20);
  
  playValue1 = 0;
  playValue2 = 0;
  playValue2 = 0;

}



void draw(){
  background(0);
  
  // Set OSC Message
  msgS1Play = new OscMessage("/sensor/s1/play");
  msgS1Dist = new OscMessage("/sensor/s1/dist");
  msgS2Play = new OscMessage("/sensor/s2/play");
  msgS2Dist = new OscMessage("/sensor/s2/dist");
  msgS3Play = new OscMessage("/sensor/s1/play");
  msgS3Dist = new OscMessage("/sensor/d1/dist");
  //println(sliderValue1);
  msgS1Dist.add(sliderValue1);
  msgS2Dist.add(sliderValue2);
  msgS3Dist.add(sliderValue3);

  oscP5.send(msgS1Dist, myRemoteLocation);
  oscP5.send(msgS2Dist, myRemoteLocation);
  oscP5.send(msgS3Dist, myRemoteLocation);
  
  if(mousePressed){
    if(mouseX > 50 && mouseX < 250){
      
      if(mouseY > 50 && mouseY < 70){
        playValue1 = 1;
        msgS1Play.add(playValue1);

      }
      
      if(mouseY > 100 && mouseY < 120){
        playValue2 = 1;
        msgS2Play.add(playValue2);
 
      }
      
      if(mouseY > 150 && mouseY < 170){
        playValue3 = 1;
        msgS3Play.add(playValue3);
        

      }
    }
  } else {
    playValue1 = 0;
    playValue2 = 0;
    playValue3 = 0;
    
    msgS1Play.add(playValue1);
    msgS2Play.add(playValue2);
    msgS3Play.add(playValue3);
    println("mouse released");
  }
  oscP5.send(msgS1Play, myRemoteLocation);
  oscP5.send(msgS2Play, myRemoteLocation);
  oscP5.send(msgS3Play, myRemoteLocation);
}

//void mousePressed(){
//  if(mouseX > 50 && mouseX < 250){
    
//    if(mouseY > 50 && mouseY < 70){
//      playValue1 = 1;
//      msgS1Play.add(playValue1);
//      oscP5.send(msgS1Play, myRemoteLocation);
//    }
    
//    if(mouseY > 100 && mouseY < 120){
//      playValue2 = 1;
//      msgS2Play.add(playValue2);
//      oscP5.send(msgS2Play, myRemoteLocation);
//    }
    
//    if(mouseY > 150 && mouseY < 170){
//      playValue3 = 1;
//      msgS3Play.add(playValue3);
//      oscP5.send(msgS3Play, myRemoteLocation);
//    }
//  }
//  //println("mouse pressed");
//}


//void mouseReleased(){
//  playValue1 = 0;
//  playValue2 = 0;
//  playValue3 = 0;
  
//  msgS1Play.add(playValue1);
//  msgS2Play.add(playValue2);
//  msgS3Play.add(playValue3);
  
//  oscP5.send(msgS1Play, myRemoteLocation);
//  oscP5.send(msgS2Play, myRemoteLocation);
//  oscP5.send(msgS3Play, myRemoteLocation);
//  println("mouse released");
//}
