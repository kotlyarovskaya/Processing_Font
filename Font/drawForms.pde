void  drawStraight(float x, float y, float w, float h, float angle) {
  v = h/N;
  r =int(random(shapes.length-1));

  push();
  translate(x, y);
  translate(h/2, h/2);
  rotate(angle);

  push();
  translate(-h/2+v, h/2);
  for (int i=0; i<N; i++) {
    float gap = h/N*i;
    if (toggle == true) {
      variant=r;
    }

    forma(gap, 0);
  }
  pop();
  pop();
}

void drawShort(float x, float y, float w, float h, float angle) {
  r =int(random(shapes.length-1));
  push();
  translate(x, y);
  translate(h/2, h/2);
  rotate(angle);
  push();
  translate(-h/2+v, h/2);
  for (int i=0; i<N-1; i++) {
    float gap = h/N*i;
    if (toggle == true) {
      variant=r;
    }
    forma(gap, 0);
  }
  pop();
  pop();
}

void drawRound(float x, float y, float w, float h, float angle) {
  r =int(random(shapes.length-1));
  push();
  translate(x, y);
  translate(h/2, h/2);
  rotate(angle);
  push();
  translate(h/2, h-h/2);
  float ang = 0;
  for (int i=0; i<N+1; i++) {
    rotate(radians(ang));
    noStroke();
    fill(0);
    if (toggle == true) {
      variant=r;
    }

    forma(0, 0);
    ang = -90/(N);
  }
  pop();
  pop();
}


void forma(float x, float y) {
  v = h/N;
  noStroke();
  fill(c[p][4]);
  switch (shapes[variant]) {
  case "rhombus":
    beginShape();
    vertex(x, y-h);
    vertex(x+v, -h/2+y);
    vertex(x, y);
    vertex(x-v, -h/2+y);
    endShape(CLOSE);
    break;
  case "star":
    beginShape();
    vertex(x, y-h);
    vertex(x+v/3, y-h/2-h/12);
    vertex(x+v, -h/2+y);
    vertex(x+v/3, y-h/2+h/12 );
    vertex(x, y);
    vertex(x-v/3, y-h/2+h/12 );
    vertex(x-v, -h/2+y);
    vertex(x-v/3, y-h/2-h/12);
    endShape(CLOSE);
    break;
  case "circle":
    ellipse(x, y-h/2, v*2, h);
    break;
  case "ellipse":
    beginShape();
    vertex(x, y-h);
    vertex(x+v, -h/2+y-h/4);
    vertex(x+v, y-h/4);
    vertex(x, y);
    vertex(x-v, y-h/4);
    vertex(x-v, -h/2+y-h/4);
    endShape(CLOSE);
    break;
  case "form":
    float len = -v*0.8;
    beginShape();
    vertex(x, y-h);
    bezierVertex(x+len, y-h, x+v, -h/2+y-len, x+v, y-h/2);
    bezierVertex(x+v, y-h/2+len, x+len, y, x, y);
    bezierVertex(x-len, y, x-v, y-h/2+len, x-v, -h/2+y);
    bezierVertex(x-v, -h/2+y-len, x-len, y-h, x, y-h);
    endShape();
    break;
  case "forma":
    len = -v*1.5;
    beginShape();
    vertex(x, y-h);
    bezierVertex(x+len, y-h, x+v, -h/2+y-len, x+v, y-h/2);
    bezierVertex(x+v, y-h/2+len, x+len, y, x, y);
    bezierVertex(x-len, y, x-v, y-h/2+len, x-v, -h/2+y);
    bezierVertex(x-v, -h/2+y-len, x-len, y-h, x, y-h);
    endShape();
    break;
  }
}
