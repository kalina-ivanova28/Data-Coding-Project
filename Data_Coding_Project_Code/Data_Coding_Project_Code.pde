//Initializing and assigning all global variables used in this code 
int rectX1 = 400;
int rectX2 = 800;
int rectX3 = 600;
int rectY1 = 200;
int rectY2 = 400;
int rectY3 = 600;
int rectSizeX = 220;
int rectSizeY = 100;
color colourNow = color(66, 227, 245);
color colourNow2 = color(143, 242, 247);
color colourNow3 = color(158, 196, 240);
color colourNow4 = color(199, 163, 240);
color colourNow5 = color(247, 166, 242);
Movies[] movies;
Table films;
boolean pressed1, pressed2, pressed3, pressed4, pressed5;
boolean backPressed = false;
boolean compareButtonPressed=false;
boolean comparePlatformsButtonPressed=false;
boolean found=true;
boolean rT=false;
boolean rtU=false;
boolean m=false;
boolean imdb=false;
boolean fs=false;
boolean compMoviesRT=false;
boolean compMoviesRTU=false;
boolean compMoviesM =false;
boolean compMoviesImdb =false;
boolean compMoviesFS =false;
boolean platformButton =false;
int index=-1;
String[] moviesChosen = new String[3];
String nameThing;
int [] indexArray=new int[3];

//Setting up generic values, which will mostly remain so throughout the code
void setup(){
  size(1200,800);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(20);
  DataHere();
}

//initializing the data from the .csv file, creating objects and making an array of objects
void DataHere(){
  films = loadTable("Film Rating Dataset.csv", "header");
  movies= new Movies[films.getRowCount()];
  TableRow row;
  for (int i=0; i<films.getRowCount(); i++){
    row=films.getRow(i);
    String name=row.getString("FILM");
    int rt=row.getInt("RottenTomatoes");
    int rtu=row.getInt("RottenTomatoes_User");
    int m=row.getInt("Metacritic");
    float imdb=row.getFloat("IMDB");
    float fs=row.getFloat("Fandango_Stars");
    movies[i]=new Movies(name,rt,rtu,m,imdb,fs);
  }
  
}

//looping through the 2 main windows displayed on the screen
void draw(){

      Screen1();
      hoverOver1();
      hoverOver2();
      hoverOver3();
      hoverOver4();
      hoverOver5();
      mousePressed();
      newScreen();
}

//first screen displayed  with buttons
void Screen1(){
  //creating rectangles with the name of each platform on top
  fill(0);
  rect(600,400,1200,800);
  fill(colourNow);
  rect(rectX1,rectY1,rectSizeX,rectSizeY);
  fill(0);
  text("Rotten Tomatoes",rectX1,rectY1);
  fill(colourNow2);
  rect(rectX2,rectY1,rectSizeX,rectSizeY);
  fill(0);
  text("Rotten Tomatoes User",rectX2,rectY1);
  fill(colourNow3);
  rect(rectX3,rectY2,rectSizeX,rectSizeY);
  fill(0);
  text("Metacritic",rectX3,rectY2);
  fill(colourNow4);
  rect(rectX1,rectY3,rectSizeX,rectSizeY);
  fill(0);
  text("IMDB",rectX1,rectY3);
  fill(colourNow5);
  rect(rectX2,rectY3,rectSizeX,rectSizeY);
  fill(0);
  text("Fandango Stars",rectX2,rectY3);
  fill(255);
  textSize(30);
  text("Choose a platform to see graph",600,50);
  textSize(20);
}

//checks if the mouse is pressed and if the colour of the correspinding button changes to a certain colour, two variables become true
void mousePressed(){
  if (mousePressed & colourNow == color(33,114,123)){
    //the first variable will show which window should be displayed next
    pressed1 = true;
    //second varaiable will show which platform it is to the comparison function, specific to one platform
    compMoviesRT=true;
  }
  else if(mousePressed & colourNow2 == color(72,121,124)){
    //the first variable will show which window should be displayed next    
    pressed2 = true;
    //second varaiable will show which platform it is to the comparison function, specific to one platform
    compMoviesRTU=true;
  }
  else if(mousePressed & colourNow3 == color(79,98,120)){
    //the first variable will show which window should be displayed next
    pressed3 = true;
    //second varaiable will show which platform it is to the comparison function, specific to one platform
    compMoviesM=true;
  }
  else if(mousePressed & colourNow4 == color(100,82,120)){
    //the first variable will show which window should be displayed next
    pressed4 = true;
    //second varaiable will show which platform it is to the comparison function, specific to one platform
    compMoviesImdb=true;
  }
  else if(mousePressed & colourNow5 == color(124,83,121)){
    //the first variable will show which window should be displayed next
    pressed5 = true;
    //second varaiable will show which platform it is to the comparison function, specific to one platform
    compMoviesFS=true;
  }
}
 
//This code checks if the cursor is on top of the first button and if so, changes the colour and that contributs to the previous function
//to check on top of which button the cursor is, which will allow the system to know which graph to open
void hoverOver1(){
  if (((rectX1-rectSizeX/2)<mouseX) & (mouseX<(rectX1+rectSizeX/2))){
    if (((rectY1+rectSizeY/2)>mouseY) & ((rectY1-rectSizeY/2)<mouseY)){
      colourNow = color(33,114,123);
    }
    else{
      colourNow = color(66, 227, 245);
    }
  }
  else{
    colourNow = color(66, 227, 245);
  
  }
}
//This code checks if the cursor is on top of the second button and if so, changes the colour and that contributs to the previous function
//to check on top of which button the cursor is, which will allow the system to know which graph to open
void hoverOver2(){
  if (((rectX2-rectSizeX/2)<mouseX) & (mouseX<(rectX2+rectSizeX/2))){
    if (((rectY1+rectSizeY/2)>mouseY) & ((rectY1-rectSizeY/2)<mouseY)){
      colourNow2 = color(72,121,124);
    }
    else{
      colourNow2 = color(143, 242, 247);
    }
  }
  else{
    colourNow2 = color(143, 242, 247);
  
  }
}
//This code checks if the cursor is on top of the third button and if so, changes the colour and that contributs to the previous function
//to check on top of which button the cursor is, which will allow the system to know which graph to open
void hoverOver3(){
  if (((rectX3-rectSizeX/2)<mouseX) & (mouseX<(rectX3+rectSizeX/2))){
    if (((rectY2+rectSizeY/2)>mouseY) & ((rectY2-rectSizeY/2)<mouseY)){
      colourNow3 = color(79,98,120);
    }
    else{
      colourNow3 = color(158, 196, 240);
    }
  }
  else{
    colourNow3 = color(158, 196, 240);
  }
}
//This code checks if the cursor is on top of the fourth button and if so, changes the colour and that contributs to the previous function
//to check on top of which button the cursor is, which will allow the system to know which graph to open
void hoverOver4(){
  if (((rectX1-rectSizeX/2)<mouseX) & (mouseX<(rectX1+rectSizeX/2))){
    if (((rectY3+rectSizeY/2)>mouseY) & ((rectY3-rectSizeY/2)<mouseY)){
      colourNow4 = color(100,82,120);
    }
    else{
      colourNow4 = color(199, 163, 240);
    }
  }
  else{
    colourNow4 = color(199, 163, 240);
  }
}
//This code checks if the cursor is on top of the fifth button and if so, changes the colour and that contributs to the previous function
//to check on top of which button the cursor is, which will allow the system to know which graph to open
void hoverOver5(){
  if (((rectX2-rectSizeX/2)<mouseX) & (mouseX<(rectX2+rectSizeX/2))){
    if (((rectY3+rectSizeY/2)>mouseY) & ((rectY3-rectSizeY/2)<mouseY)){
      colourNow5 = color(124,83,121);
    }
    else{
      colourNow5 = color(247, 166, 242);
    }
  }
  else{
    colourNow5 = color(247, 166, 242);
  }
}
//the second window which will be displayed
//only a part of it will be diplayed, depending on where the user has clicked
void newScreen(){
  if(pressed1){
    fill(0);
    rect(600,400,1200,800);
    //Displays corresponding graph
    RottenTomatoesBGraph();
    //Calls the button allowing the user to compare movies
    compareMoviesButton();
    //Calls the button allowing the user to comapre different platform ratings for the same movie
    comparePlatformsButton();
    backButton();
    if (backPressed == true){
      Screen1();
    }
    if (rT){
      compareThreeMoviesRT();
    }
    //if(platformButton){
    //  comparePlatformsScreen();
    //}
    
  }
  else if(pressed2){
    fill(0);
    rect(600,400,1200,800);
    //Displays corresponding graph
    RottenTomatoesUserBGraph();
    //Calls the button allowing the user to compare movies    
    compareMoviesButton();
    //Calls the button allowing the user to comapre different platform ratings for the same movie
    comparePlatformsButton();
    backButton();
    if (backPressed == true){
      Screen1();
    }
    if (rtU){
      compareThreeMoviesRTU();
    }
    
  }
  else if (pressed3){
    fill(0);
    rect(600,400,1200,800);
    //Displays corresponding graph
    MetacriticBGraph();
    //Calls the button allowing the user to compare movies
    compareMoviesButton();
    //Calls the button allowing the user to comapre different platform ratings for the same movie
    comparePlatformsButton();
    backButton();
    if (backPressed == true){
      Screen1();
    }
    if (m){
      compareThreeMoviesM();
    }
    
  }
  else if (pressed4){
    fill(0);
    rect(600,400,1200,800);
    //Displays corresponding graph
    IMDBBGraph();
    //Calls the button allowing the user to compare movies
    compareMoviesButton();
    //Calls the button allowing the user to comapre different platform ratings for the same movie
    comparePlatformsButton();
    backButton();
    if (backPressed == true){
      Screen1();
    }
    if (imdb){
      compareThreeMoviesIMDB();
    }
   
  }
  else if (pressed5){
    fill(0);
    rect(600,400,1200,800);
    //Displays corresponding graph
    Fandango_StarsBGraph();
    //Calls the button allowing the user to compare movies
    compareMoviesButton();
    //Calls the button allowing the user to comapre different platform ratings for the same movie
    comparePlatformsButton();
    backButton();
    if (backPressed == true){
      Screen1();
    }
    if (fs){
      compareThreeMoviesFandangoStars();
    }
    
  }
}

//Iterates through all values in the array of objects and displayes circles with radius as big as their rating
void RottenTomatoesBGraph(){
    for (int i=0; i<movies.length; i++){
      int r = movies[i].rottenTomatoes;
      fill(i+150,i*10,50+(i*5));
      circle((i*25)+200,r*7,r);
      textSize(30);
      fill(255);
      text("Rotten Tomatoes",600,50);
      textSize(20);
      if ((dist(mouseX,mouseY,(i*25)+200,r*7))<r){
        fill(i+150,i*10,50+(i*5));
        rect(width-200,100,400,100);
        fill(0);
        text(movies[i].name,width-200,100);
      }
    }
} 
//Iterates through all values in the array of objects and displayes circles with radius as big as their rating
void RottenTomatoesUserBGraph(){
  for (int i=0; i<films.getRowCount(); i++){
    int r = movies[i].rottenTomatoesU;
    fill(i+150,i*10,50+(i*5));
    circle((i*25)+200,r*7,r);
    textSize(30);
    fill(255);
    text("Rotten Tomatoes User",600,50);
    textSize(20);
    if ((dist(mouseX,mouseY,(i*25)+200,r*7))<r){
      fill(i+150,i*10,50+(i*5));
      rect(width-200,100,400,100);
      fill(0);
      text(movies[i].name,width-200,100);
    }
  }
}  
//Iterates through all values in the array of objects and displayes circles with radius as big as their rating
void MetacriticBGraph(){
  for (int i=0; i<films.getRowCount(); i++){
    int r = movies[i].metacritic;
    fill(i+150,i*10,50+(i*5));
    circle((i*25)+100,r*7,r);
    textSize(30);
    fill(255);
    text("Metacritic",600,50);
    textSize(20);
    if ((dist(mouseX,mouseY,(i*25)+100,r*7))<r){
      fill(i+150,i*10,50+(i*5));
      rect(width-200,100,400,100);
      fill(0);
      text(movies[i].name,width-200,100);
    }
  }
} 
//Iterates through all values in the array of objects and displayes circles with radius as big as their rating
void IMDBBGraph(){
  for (int i=0; i<films.getRowCount(); i++){
    float r = (movies[i].imdb)*10;
    fill(i+150,i*10,50+(i*5));
    circle((i*23)+(i*8)+50,(r*7)+50,r);
    textSize(30);
    fill(255);
    text("IMDB",600,50);
    textSize(20);
    if ((dist(mouseX,mouseY,(i*23)+(i*8)+50,(r*7)+50))<r){
      fill(i+150,i*10,50+(i*5));
      rect(width-200,100,400,100);
      fill(0);
      text(movies[i].name,width-200,100);
    }
  }
}  
//Iterates through all values in the array of objects and displayes circles with radius as big as their rating
void Fandango_StarsBGraph(){
  for (int i=0; i<films.getRowCount(); i++){
    float r = (movies[i].fandangoStars)*10;
    fill(i+150,i*10,50+(i*5));
    circle((i*28)+100,(i*5)+r*10,r*1.5);
    textSize(30);
    fill(255);
    text("Fandango Stars",600,50);
    textSize(20);
    if (dist(mouseX,mouseY,(i*28)+100,(i*5)+r*10)<r*1.5){
      fill(i+150,i*10,50+(i*5));
      rect(width-200,100,400,100);
      fill(0);
      text(movies[i].name,width-200,100);
    }
  }
}
//The back button would do the function of a "Home" button, taking the user to the first screen displayed
void backButton(){
  fill(255);
  stroke(1);
  fill(206, 228, 245);
  rect(36,19,70,35);
  fill(0);
  text("Back",36,19);
  if (mousePressed & ((mouseX>0 & mouseX<70) & (mouseY>1 & mouseY<35))){
    backPressed=true;
  }
}
//This function will surve as a menu where all the movies will be written and checks if the cursor is over one of the rectangles
void compareMoviesScreen(){
  fill(0);
  rect(600,400,1200,800);
  fill(255);
  textSize(30);
  text("Double Click on min 3 movies to select them and press ENTER",600,50);
  textSize(20);
  clearButton();
   for (int i=0;i<movies.length;i++){
     fill(206, 228, 245);
     rect(600,(20*i)+70,((movies[i].name).length())*20,20);
     fill(0);
     text(movies[i].name,600,(20*i)+78);
     if ((mouseX>600-(((movies[i].name).length()*20))/2) & (mouseX<600+(((movies[i].name).length()*20))/2)){
       if(( mouseY>((20*i)+70)-10) & (mouseY<((20*i)+70)+10)){
           nameThing=movies[i].name;
           index=i;
           
       }
     }
   }
  
}
//In the case that the cursor is over one of the rectangles from the previous function and the mouse has been clicked:
//The index of the movies, which was clicked, will be added to an array
void mouseClicked(){
  //The first two statements are so that we can see that the correct names and thus index are added to the array
  printArray(moviesChosen);
  moviesChosen=append(moviesChosen,nameThing);
  indexArray=append(indexArray,index);
}
//the user activates the comparison by pressing ENTER, which will call the function, which checks from what platform it was called
void keyPressed(){
  if (keyCode==ENTER){
    checkPlatform();
  }
}
//it checks which platform it should go to
//the variables from mousePressed() show what platform and thus graph were shown before
void checkPlatform(){
  if (compMoviesRT){
    rT=true;
  }
  else if (compMoviesRTU){
    rtU=true;
  }
  else if (compMoviesM){
    m=true;
  }
  else if (compMoviesImdb){
    imdb=true;
  }
  else if (compMoviesFS){
    fs=true;
  }
}
//The button that is pressed, when the user wants to trigger the above process
void compareMoviesButton(){
  fill(206, 228, 245);
  rect(width-200,height-25,400,50);
  fill(0);
  text("Compare movies in one platform",width-200,height-25);
  if (mouseX>width-400 & mouseX<width & mouseY>height-50 & mouseY<height & mousePressed){
    compareButtonPressed=true;
  }
  if (compareButtonPressed){
    compareMoviesScreen();
  }
}
//The window that is going to appear if movies from Rotten Tomatoes are being compared
//The function iterates through the array of indexes created before and displays the corresponding movies in the array of objects
//It outputs the name and the score of each movie and creates a simple graph, representing each movie in the same order
void compareThreeMoviesRT(){
  if (moviesChosen.length > 10){
    fill(0);
    rect(600,400,1200,800);
    fill(206, 228, 245);
    rect(400,400,500,600);
    for (int i=6; i <moviesChosen.length; i=i+2){
      rectMode(CORNER);
      println(movies[indexArray[i]].name);
      fill(0);
      text("Name of movie chosen: "+movies[indexArray[i]].name,400,(i*40)+100);
      text("Score on Rotten Tomatoes:"+movies[indexArray[i]].rottenTomatoes,400,(i*40)+130);
      stroke(255);
      line(800,300,800,700);
      fill(206, 228, 245);
      rect(800,150+(30*i),(movies[indexArray[i]].rottenTomatoes)*2,50);
    }
  }
}
//The window that is going to appear if movies from Rotten Tomatoes User are being compared
//The function iterates through the array of indexes created before and displays the corresponding movies in the array of objects
//It outputs the name and the score of each movie and creates a simple graph, representing each movie in the same order
void compareThreeMoviesRTU(){
  if (moviesChosen.length > 10){
    fill(0);
    rect(600,400,1200,800);
    fill(206, 228, 245);
    rect(400,400,500,600);
    for (int i=6; i <moviesChosen.length; i=i+2){
      rectMode(CORNER);
      println(movies[indexArray[i]].name);
      fill(0);
      text("Name of movie chosen: "+movies[indexArray[i]].name,400,(i*40)+100);
      text("Score on Rotten Tomatoes User:"+movies[indexArray[i]].rottenTomatoesU,400,(i*40)+130);
      stroke(255);
      line(800,300,800,550);
      fill(206, 228, 245);
      rect(800,150+(30*i),(movies[indexArray[i]].rottenTomatoesU)*2,50);
    }
  }
}
//The window that is going to appear if movies from Metacritic are being compared
//The function iterates through the array of indexes created before and displays the corresponding movies in the array of objects
//It outputs the name and the score of each movie and creates a simple graph, representing each movie in the same order
void compareThreeMoviesM(){
  if (moviesChosen.length > 10){
    fill(0);
    rect(600,400,1200,800);
    fill(206, 228, 245);
    rect(400,400,500,600);
    for (int i=6; i <moviesChosen.length; i=i+2){
      rectMode(CORNER);
      println(movies[indexArray[i]].name);
      fill(0);
      text("Name of movie chosen: "+movies[indexArray[i]].name,400,(i*40)+100);
      text("Score on Metacritic:"+movies[indexArray[i]].metacritic,400,(i*40)+130);
      stroke(255);
      line(800,300,800,550);
      fill(206, 228, 245);
      rect(800,150+(30*i),(movies[indexArray[i]].metacritic)*2,50);
    }
  }
}
//The window that is going to appear if movies from IMDB are being compared
//The function iterates through the array of indexes created before and displays the corresponding movies in the array of objects
//It outputs the name and the score of each movie and creates a simple graph, representing each movie in the same order
void compareThreeMoviesIMDB(){
  if (moviesChosen.length > 10){
    fill(0);
    rect(600,400,1200,800);
    fill(206, 228, 245);
    rect(400,400,500,600);
    for (int i=6; i <moviesChosen.length; i=i+2){
      rectMode(CORNER);
      println(movies[indexArray[i]].name);
      fill(0);
      text("Name of movie chosen: "+movies[indexArray[i]].name,400,(i*40)+100);
      text("Score on IMDB:"+movies[indexArray[i]].imdb,400,(i*40)+130);
      stroke(255);
      line(800,300,800,550);
      fill(206, 228, 245);
      rect(800,150+(30*i),(movies[indexArray[i]].imdb)*2,50);
    }
  }
}
//The window that is going to appear if movies from Fandango Stars are being compared
//The function iterates through the array of indexes created before and displays the corresponding movies in the array of objects
//It outputs the name and the score of each movie and creates a simple graph, representing each movie in the same order
void compareThreeMoviesFandangoStars(){
  if (moviesChosen.length > 10){
    fill(0);
    rect(600,400,1200,800);
    fill(206, 228, 245);
    rect(400,400,500,600);
    for (int i=6; i <moviesChosen.length; i=i+2){
      rectMode(CORNER);
      println(movies[indexArray[i]].name);
      fill(0);
      text("Name of movie chosen: "+movies[indexArray[i]].name,400,(i*40)+100);
      text("Score on Fandango Stars:"+movies[indexArray[i]].fandangoStars,400,(i*40)+130);
      stroke(255);
      line(800,300,800,550);
      fill(206, 228, 245);
      rect(800,150+(30*i),(movies[indexArray[i]].fandangoStars)*2,50);
    }
  }
}
//The button that allows the user to call comparePlatformScreen() to comapre the score of a movie in all platforms
void comparePlatformsButton(){
  rectMode(CENTER);
  fill(206, 228, 245);
  rect(200,height-25,400,50);
  fill(0);
  text("Compare movies in all platforms",200,height-25);
  if (mouseX>0 & mouseX<600 & mouseY>height-25 & mouseY<height & mousePressed){
    comparePlatformsButtonPressed=true;
  }
  if (comparePlatformsButtonPressed){
    comparePlatformsScreen();
    
  }
}
//It creates a list of all the movies by iterrating between them and when one is pressed, it outputs its name and all the scores on all of the platforms
void comparePlatformsScreen(){
  fill(0);
  rect(600,400,1200,800);
  fill(255);
  textSize(30);
  text("Click on a movies to see its score in all platforms",600,50);
  textSize(20);
  for (int i=0;i<movies.length;i++){
     fill(206, 228, 245);
     rect(600,(20*i)+70,((movies[i].name).length())*20,20);
     fill(0);
     text(movies[i].name,600,(20*i)+78);
     if ((mouseX>600-(((movies[i].name).length()*20))/2) & (mouseX<600+(((movies[i].name).length()*20))/2)){
       if(( mouseY>((20*i)+70)-10) & (mouseY<((20*i)+78)+10)){
         if (mousePressed){
           index=i;
         }
           
       }
     }
   }
   if (index > -1){
     fill(0);
     rect(600,400,1200,800);
     fill(66, 227, 245);
     rect(600,400,500,700);
     fill(0);
     text(movies[index].name,600,150);
     text("Rotten Tomatoes: "+movies[index].rottenTomatoes,600,300);
     text("Rotten Tomatoes User: " + movies[index].rottenTomatoesU,600,400);
     text("Metacritic: "+movies[index].metacritic,600,500);
     text("IMDB: "+movies[index].imdb,600,600);
     text("Fandango Stars: "+movies[index].fandangoStars,600,700);
   }
}
//It changes all of the values of the indexArray to 0 and thus clears it
void clearButton(){
  fill(255);
  stroke(1);
  fill(206, 228, 245);
  rect(108,19,70,35);
  fill(0);
  text("Clear",108,19);
  if (mousePressed & ((mouseX>100 & mouseX<240) & (mouseY>0 & mouseY<35))){
    for (int i=0; i<moviesChosen.length;i++){
      indexArray[i]=0;
    }
  }
}
