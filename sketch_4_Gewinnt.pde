char [][]spielfeld=new char [7][6];
char farbe;
char gewonnen;

int al = 334;
int erlauben = 1;
int green = 0;
int fall = 0;
int belegt;
int zl = 21;
int zr = 21;
int counter_red;
int counter_yellow;
int zeile;
int spalte;
int diagonal;

double spamcheck = 1.2;
double spamcheckk = 1.2;




 void setup(){
   farbe='r'; 
   
  size(1400, 800);
  background(102, 124, 134);
  frameRate(8);
  
  fill(255, 0, 0);
  ellipse(al, 100, 70, 70);
  
   for (int x = 0; x < 7 ;  x ++)
  {
    for (int y = 0; y < 6 ; y ++)
    {
      spielfeld[x][y]='l';
    }
  }
}

 void draw(){
  
  verbleibendeSteine();
  spielFeld();
  bewegendeSteine();
  
}

 // Spielfeld
 void spielFeld(){
  
     // Verbleibende Steine Anzeige 
   stroke(250,0,0);
   strokeWeight(1);
   fill(255);
   rect(28, 150, 80, 40, 10);
   fill(50);
   textSize(25);
   text(zl, 55, 179);
   
   stroke(250, 250, 0);
   strokeWeight(1);
   fill(255);
   rect(1290, 150, 80, 40, 10);
   fill(50);
   textSize(25);
   text(zr, 1318, 179);
    
     // Bord  
   stroke(0);
   fill(154, 186, 201);
   rect(250, 150, 900, 600, 28);
   rect(250, 150, 900, 600, 28);
     
       // Spielfarben und Spieler
    // Spieler 1
  fill(255, 0, 0);
  ellipse(50, 47, 40, 40);
  fill(255);
  textSize(42);
  text("- Spieler 1", 80, 60); 
  
    // Spieler 2
  fill(255, 255, 0);
  ellipse(1350, 47, 40, 40);
  fill(255);
  textSize(42);
  text("Spieler 2 -", 1143, 60); 


  
  
     //erzeugt 6*7 löcher
   for (int i = 0; i < 7;  i ++)
   {
   for (int j = 0; j < 6 ;  j ++)
     {
     if(spielfeld[i][j]=='l'){ fill(245, 251, 253);}
     else if (spielfeld [i][j]=='r'){ fill(255, 0, 0);}
     else { fill(255, 255, 0);}
        ellipse(i*120+334, j*90+220, 70, 70); 
       
     }
   }

 if(gewonnen=='r'){    
fill(255);
  textSize(42);
  text("Rot gewinnt", 500, 60);

}
 if(gewonnen=='g'){    
fill(255);
  textSize(42);
  text("Gelb gewinnt", 500, 60);

}
 
 
 }

 // Verbleibende Steine
 void verbleibendeSteine(){
  
   spamcheckk=spamcheckk+1;
   
  if (keyPressed) {
  if ((key == ' ') && spamcheckk>5.2){
    spamcheckk=0;
    
    fill(50);
    textSize(25);
    text(zl, 55, 179);
    zl = zl - 1;
    
    fill(50);
    textSize(25);
    text(zr, 1318, 179);
     zr = zr - 1;
    
   }
  } 
 }

 // Bewegen der oben angezeigten Steine
 void bewegendeSteine(){
  
    if (keyPressed) {
    if (key == 'a' || key == 'A') {
      al = al - 120;
      if(al<334){al=334;}
      
     fall=fall-1;
     if(fall<0){fall=0;}
     
     background(102, 124, 134);
     fill(255, green, 0);
     ellipse(al, 100, 70, 70);
     spielFeld();
     verbleibendeSteine();
    }
    
    if (key == 'd' || key == 'D') {
      al= al + 120;
     if(al>1054){al=1054;}
     
      fall=fall+1;
     if(fall>6){fall=6;}
     
       background(102, 124, 134);
       fill(255, green, 0);
       ellipse(al, 100, 70, 70);
       spielFeld();
       verbleibendeSteine();
  
    }
    
    spamcheck=spamcheck+1;
    
    if ((key==' ' ) && (spielfeld[fall][0]=='l') && spamcheck>1.2){
      belegt=0;
      spamcheck=0;
      
      // Checken ob das obere Feld frei ist
    if (spielfeld[fall][5]=='l'){spielfeld[fall][5]=farbe;belegt=1;}
    if ((spielfeld[fall][4]=='l')&& (belegt==0)){spielfeld[fall][4]=farbe;belegt=1;}
    if ((spielfeld[fall][3]=='l')&& (belegt==0)){spielfeld[fall][3]=farbe;belegt=1;}
    if ((spielfeld[fall][2]=='l')&& (belegt==0)){spielfeld[fall][2]=farbe;belegt=1;}
    if ((spielfeld[fall][1]=='l')&& (belegt==0)){spielfeld[fall][1]=farbe;belegt=1;}
    if (belegt==0){spielfeld[fall][0]=farbe;}
    
    
   ///////////////////////////////// 
   //Gewinn optionen
     gewonnen='n';
   //gewinn option waagrecht
   for (zeile=0;zeile<6;zeile++){
     counter_red=0;
     counter_yellow=0;
     for (spalte=0;spalte<7;spalte++){
       if(spielfeld[spalte][zeile]=='l'){
          counter_red=0;
          counter_yellow=0;}
       
       
       
       
       if(spielfeld[spalte][zeile]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       
       
       
       
       
       if(spielfeld[spalte][zeile]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
       gewonnen='g';}
     }
   }
    
    //gewinn option senkrecht
   for (spalte=0;spalte<7;spalte++){
     counter_red=0;
     counter_yellow=0;
     for (zeile=0;zeile<6;zeile++){
       if(spielfeld[spalte][zeile]=='l'){
          counter_red=0;
          counter_yellow=0;}
       
       
       
       
       if(spielfeld[spalte][zeile]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       
       
       
       
       
       if(spielfeld[spalte][zeile]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
       gewonnen='g';}
     }
   } 
    
   //gewinn optionen diagonal
   
   for(diagonal=0;diagonal<4;diagonal++){
        if(spielfeld[diagonal][diagonal+2]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal][diagonal+2]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal][diagonal+2]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
    
      for(diagonal=0;diagonal<4;diagonal++){
        if(spielfeld[diagonal+3][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal+3][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal+3][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
       for(diagonal=0;diagonal<4;diagonal++){
        if(spielfeld[6-diagonal][diagonal+2]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[6-diagonal][diagonal+2]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[6-diagonal][diagonal+2]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
          for(diagonal=0;diagonal<4;diagonal++){
        if(spielfeld[3-diagonal][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[3-diagonal][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[3-diagonal][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
             for(diagonal=0;diagonal<5;diagonal++){
        if(spielfeld[diagonal][diagonal+1]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal][diagonal+1]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal][diagonal+1]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
                for(diagonal=0;diagonal<5;diagonal++){
        if(spielfeld[diagonal+2][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal+2][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal+2][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
                   for(diagonal=0;diagonal<5;diagonal++){
        if(spielfeld[6-diagonal][diagonal+1]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[6-diagonal][diagonal+1]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[6-diagonal][diagonal+1]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   } 
   
                      for(diagonal=0;diagonal<5;diagonal++){
        if(spielfeld[4-diagonal][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[4-diagonal][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[4-diagonal][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   }
   
     for(diagonal=0;diagonal<6;diagonal++){
        if(spielfeld[diagonal][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   }
   
        for(diagonal=0;diagonal<6;diagonal++){
        if(spielfeld[diagonal+1][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[diagonal+1][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[diagonal+1][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   }
   
      for(diagonal=0;diagonal<6;diagonal++){
        if(spielfeld[6-diagonal][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[6-diagonal][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[6-diagonal][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   }
   
     for(diagonal=0;diagonal<6;diagonal++){
        if(spielfeld[5-diagonal][diagonal]=='l'){
          counter_red=0;
          counter_yellow=0;}
       if(spielfeld[5-diagonal][diagonal]=='r'){
          counter_red++;
          counter_yellow=0;}  
       if(counter_red>3){
       gewonnen='r';}
       if(spielfeld[5-diagonal][diagonal]=='g'){
          counter_red=0;
          counter_yellow++;} 
            if(counter_yellow>3){
                gewonnen='g';}  
   }
    /////////////////////////////////////
      
     // Farbwechsel nach Abwurf 
   if (farbe=='r'){farbe='g';green=255;}
   else{farbe='r';green=0;}
   
   
      background(102, 124, 134);
      fill(255, green, 0);
      ellipse(al, 100, 70, 70);
      spielFeld();
      verbleibendeSteine();
    
    }   
  }
}
