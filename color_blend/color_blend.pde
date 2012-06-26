import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
Oscillator square1, square2;
LowPassSP lowpass;

void setup() {
  size(512, 512);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  
  square1 = new SineWave(440, 1, 44100);
  square2 = new SineWave(330, 1, 44100);
  lowpass = new LowPassSP(200, 44100);
  
  out.addSignal(square1);
  out.addSignal(square2);
  out.addEffect(lowpass);
}

void mouseMoved() {
  square1.setAmp((float) mouseX / (float) width);
  square2.setAmp((float) mouseY / (float) height);
}

void draw() {
  background(255 * square1.amplitude(), 0, 255 * square2.amplitude());
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}
