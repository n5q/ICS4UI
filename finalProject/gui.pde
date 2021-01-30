/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:877462:
  appc.background(230);
} //_CODE_:window1:877462:

public void start(GButton source, GEvent event) { //_CODE_:startButton:843742:
  reset();
  pause();
} //_CODE_:startButton:843742:

public void cgPos(GSlider source, GEvent event) { //_CODE_:cgPosSlider:223825:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:cgPosSlider:223825:

public void daPos(GSlider source, GEvent event) { //_CODE_:daPosSlider:956507:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:daPosSlider:956507:

public void cgStep(GSlider source, GEvent event) { //_CODE_:cgStepSlider:973710:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:cgStepSlider:973710:

public void daStep(GSlider source, GEvent event) { //_CODE_:daStepSlider:355466:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:daStepSlider:355466:

public void cgSpeed(GSlider source, GEvent event) { //_CODE_:cgSpeedSlider:280514:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:cgSpeedSlider:280514:

public void daSpeed(GSlider source, GEvent event) { //_CODE_:daSpeedSlider:758925:
  if (event == GEvent.PRESSED && playing) {
    pause();
  }
} //_CODE_:daSpeedSlider:758925:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 400, 300, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  startButton = new GButton(window1, 137, 225, 125, 50);
  startButton.setText("START");
  startButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  startButton.addEventHandler(this, "start");
  label1 = new GLabel(window1, 40, 25, 120, 21);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Constant Growth");
  label1.setOpaque(true);
  label4 = new GLabel(window1, 140, 1, 120, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Animation Options");
  label4.setOpaque(false);
  label2 = new GLabel(window1, 240, 25, 120, 21);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Doubling Algorithm");
  label2.setOpaque(true);
  label3 = new GLabel(window1, 150, 60, 100, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Starting Position");
  label3.setOpaque(false);
  cgPosSlider = new GSlider(window1, 40, 75, 120, 35, 10.0);
  cgPosSlider.setShowValue(true);
  cgPosSlider.setShowLimits(true);
  cgPosSlider.setLimits(600, 0, 1200);
  cgPosSlider.setNumberFormat(G4P.INTEGER, 0);
  cgPosSlider.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  cgPosSlider.setOpaque(false);
  cgPosSlider.addEventHandler(this, "cgPos");
  daPosSlider = new GSlider(window1, 240, 75, 120, 35, 10.0);
  daPosSlider.setShowValue(true);
  daPosSlider.setShowLimits(true);
  daPosSlider.setLimits(600, 0, 1200);
  daPosSlider.setNumberFormat(G4P.INTEGER, 0);
  daPosSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  daPosSlider.setOpaque(false);
  daPosSlider.addEventHandler(this, "daPos");
  label5 = new GLabel(window1, 150, 110, 100, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Step Size");
  label5.setOpaque(false);
  cgStepSlider = new GSlider(window1, 40, 125, 120, 35, 10.0);
  cgStepSlider.setShowValue(true);
  cgStepSlider.setShowLimits(true);
  cgStepSlider.setLimits(0.5, 0.0, 1.0);
  cgStepSlider.setNumberFormat(G4P.DECIMAL, 2);
  cgStepSlider.setOpaque(false);
  cgStepSlider.addEventHandler(this, "cgStep");
  daStepSlider = new GSlider(window1, 240, 125, 120, 35, 10.0);
  daStepSlider.setShowValue(true);
  daStepSlider.setShowLimits(true);
  daStepSlider.setLimits(0.5, 0.0, 1.0);
  daStepSlider.setNumberFormat(G4P.DECIMAL, 2);
  daStepSlider.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  daStepSlider.setOpaque(false);
  daStepSlider.addEventHandler(this, "daStep");
  label6 = new GLabel(window1, 150, 165, 100, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Speed");
  label6.setOpaque(false);
  cgSpeedSlider = new GSlider(window1, 40, 180, 120, 35, 10.0);
  cgSpeedSlider.setShowValue(true);
  cgSpeedSlider.setShowLimits(true);
  cgSpeedSlider.setLimits(0.5, 0.0, 1.0);
  cgSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  cgSpeedSlider.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  cgSpeedSlider.setOpaque(false);
  cgSpeedSlider.addEventHandler(this, "cgSpeed");
  daSpeedSlider = new GSlider(window1, 240, 180, 120, 35, 10.0);
  daSpeedSlider.setShowValue(true);
  daSpeedSlider.setShowLimits(true);
  daSpeedSlider.setLimits(0.5, 0.0, 1.0);
  daSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  daSpeedSlider.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  daSpeedSlider.setOpaque(false);
  daSpeedSlider.addEventHandler(this, "daSpeed");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton startButton; 
GLabel label1; 
GLabel label4; 
GLabel label2; 
GLabel label3; 
GSlider cgPosSlider; 
GSlider daPosSlider; 
GLabel label5; 
GSlider cgStepSlider; 
GSlider daStepSlider; 
GLabel label6; 
GSlider cgSpeedSlider; 
GSlider daSpeedSlider; 