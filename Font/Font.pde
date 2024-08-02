import controlP5.*;
ControlP5 UI;
int amount = 0;
int size = 0;
int inter =10;
int trek =10;
RadioButton shape;
String currentShape = "Circle";
boolean toggle;
String [] shapes = {"rhombus", "star", "circle", "ellipse", "form", "forma", "random" };
PImage rhIcon, sIcon, cIcon, eIcon, fIcon, ffIcon, rIcon;
int p =0;
color [][] c = {{#525359, #878890, #A5A6AE, 255, #000000}, {#525359, #878890, #A5A6AE, #000000, 255}};
boolean t;

StringDict ABC;
float h=39;
float N =6;
float v;
int variant = 0;
String text = "";
float pos =25;
float result;
PFont myFont;
boolean k = false;
int r;


void setup() {
  size(800, 800);
  pixelDensity(2);
  myFont = createFont("SuisseIntl-Book.otf", 4);
  textFont(myFont);

  UI = new ControlP5(this);
  
  rhIcon = loadImage("rhombus.png");
  sIcon = loadImage("star.png");
  cIcon = loadImage("circle.png");
  eIcon = loadImage("ellipse.png");
  fIcon = loadImage("forma.png");
  ffIcon = loadImage("form.png");
  rIcon = loadImage("random.png");

  Slider amountSlider = UI.addSlider("amount")
    .setPosition(293, 30)
    .setValue(3)
    .setRange(2, 18)
    .setSize(200, 25);
  amountSlider.getCaptionLabel().set("Amount");
  amountSlider.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(3);
  amountSlider.setColorBackground(c[p][0]);
  amountSlider.setColorForeground(c[p][1]);
  amountSlider.setColorActive(c[p][2]);
  amountSlider.getCaptionLabel().setColor(c[p][0]);
  amountSlider.getCaptionLabel().setFont(myFont);

  Slider sizeSlider = UI.addSlider("size")
    .setPosition(293, 80)
    .setValue(39)
    .setRange(20, 60)
    .setSize(200, 25);
  sizeSlider.getCaptionLabel().set("Size");
  sizeSlider.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(3);
  sizeSlider.setColorBackground(c[p][0]);
  sizeSlider.setColorForeground(c[p][1]);
  sizeSlider.setColorActive(c[p][2]);
  sizeSlider.getCaptionLabel().setColor(c[p][0]);
  sizeSlider.getCaptionLabel().setFont(myFont);

  Slider trekSlider = UI.addSlider("trek")
    .setPosition(561, 30)
    .setValue(10)
    .setRange(0, 20)
    .setSize(200, 25);
  trekSlider.getCaptionLabel().set("Letter spacing");
  trekSlider.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(3);
  trekSlider.setColorBackground(c[p][0]);
  trekSlider.setColorForeground(c[p][1]);
  trekSlider.setColorActive(c[p][2]);
  trekSlider.getCaptionLabel().setColor(c[p][0]);
  trekSlider.getCaptionLabel().setFont(myFont);

  Slider interSlider = UI.addSlider("inter")
    .setPosition(561, 80)
    .setValue(10)
    .setRange(-size, size * 3)
    .setSize(200, 25);
  interSlider.getCaptionLabel().set("Line height");
  interSlider.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(3);
  interSlider.setColorBackground(c[p][0]);
  interSlider.setColorForeground(c[p][1]);
  interSlider.setColorActive(c[p][2]);
  interSlider.getCaptionLabel().setColor(c[p][0]);
  interSlider.getCaptionLabel().setFont(myFont);

  Toggle tSwitcher = UI.addToggle("t")
    .setPosition(25, 80)
    .setSize(50, 25)
    .setValue(true)
    .setMode(ControlP5.SWITCH);
  tSwitcher.getCaptionLabel().set("Color");
  tSwitcher.getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0).setPaddingY(3);
  tSwitcher.setColorBackground(c[p][0]);
  tSwitcher.setColorForeground(c[p][1]);
  tSwitcher.setColorActive(c[p][1]);
  tSwitcher.getCaptionLabel().setColor(c[p][0]);
  tSwitcher.getCaptionLabel().setFont(myFont);
  ;

  shape = UI.addRadioButton("shape").setPosition(25, 30).setSize(25, 25)
    .setItemsPerRow(7)
    .setSpacingColumn(0)
    .addItem("rhombus", 1)
    .addItem("star", 2)
    .addItem("circle", 3)
    .addItem("ellipse", 4)
    .addItem("form", 5)
    .addItem("forma", 6)
    .addItem("random", 7)
    ;


  for (Toggle t : shape.getItems()) {
    String name = t.getName();
    PImage icon = null;
    if (name.equals("rhombus")) {
      icon = rhIcon;
    } else if (name.equals("star")) {
      icon = sIcon;
    } else if (name.equals("circle")) {
      icon = cIcon;
    } else if (name.equals("ellipse")) {
      icon = eIcon;
    } else if (name.equals("form")) {
      icon = fIcon;
    } else if (name.equals("forma")) {
      icon = ffIcon;
    } else if (name.equals("random")) {
      icon = rIcon;
    }
    t.getCaptionLabel().setVisible(false);
    t.setImages(icon, icon, icon, icon, icon, icon, icon);
  }

  shape.activate(0);

  noStroke();
  ABC = new StringDict();
  setDict();
}

void draw () {
  N = amount;
  h = size;

  if (t==true) {
    p=0;
  } else {
    p=1;
  }

  background(c[p][3]);
  fill(20);
  rect(0,0, width, 130);
  fill(c[p][0]);
  textSize(8);
  text("SHAPES", 25, 25);

  result =  setType(text, pos, 360, 200);
  for (Toggle t : shape.getItems()) {
    int x = (int)t.getPosition()[0]+25;
    int y = (int)t.getPosition()[1]+30;
    int w = (int)t.getWidth();
    int h = (int)t.getHeight();

    if (t.isMouseOver()) {
      fill(c[p][2]);  
    } else if (t.getState()) {
      fill(c[p][1]); 
    } else {
      fill(c[p][0]); 
    }
    rect(x, y, w, h);
  }
 
}


float setType(String text, float x, float y, float textSize) {
  randomSeed(304940);

  for (int i =0; i< text.length(); i++) {
    float w = drawLetter(str(text.charAt(i)), x, y, textSize);
    if (x<=width-6.2*h) {
      x +=w+trek;
    } else if (x>=width-6.2*h) {
      x =pos;
      y+=h*5+inter;
    }
  }
  return y;
}

float drawLetter(String glyph, float x, float y, float textSize) {
  String code = ABC.get(glyph);
  int cols = int(code.charAt(0)+"");
  int rows = int(code.charAt(1)+"");

  y -=textSize;
  float w = h;

  for (int i = 0; i <cols; i++) {
    for (int j = 0; j <rows; j++) {
      int index = (i + j*cols)*2+2;
      float x1 = x+i*w;
      float y1 = y +j*w;

      float angle = HALF_PI *code.charAt(index+1);

      if (code.charAt(index) == 'S') {
        drawStraight(x1, y1, w, w, angle);
      } else if (code.charAt(index) == 'R') {
        drawRound(x1, y1, w, w, angle);
      } else if (code.charAt(index) == 'H') {
        drawShort(x1, y1, w, w, angle);
      }
    }
  }
  return cols*w;
}


void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(shape)) {
    int selected = (int)theEvent.getValue();
    toggle = false;
    switch (selected) {
    case 1:
      variant = 0;
      break;
    case 2:
      variant = 1;
      break;
    case 3:
      variant = 2;
      break;
    case 4:
      variant = 3;
      break;
    case 5:
      variant = 4;
      break;
    case 6:
      variant = 5;
      break;
    case 7:
      toggle = true;
      break;
    }
  }
}


void keyTyped() {
  if (key == BACKSPACE) {
    if (text.length() > 0) {
      text = text.substring(0, text.length()-1);
    }
  } else if (result < 800 && ABC.hasKey(str(key))) {

    text += key;
  }
}
