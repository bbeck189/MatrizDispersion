/* Matrix Graph Class for VisualStructLib */
/* Copyright (c) 2016 Boris Beck, Daniel Herrera */
class MatrixGraph extends Group{

  //Colores de la matriz
  color matrixBorderColor = #000000;
  color matrixBackgroundColor = #ffffff;
  color dotBorderColor = #000000;
  color dotBackgroundColor = #ffffff;
  color labelBackgroundColor = #000000;
  
  //Dimensiones de la matriz
  float matrixWidth;
  float matrixHeight;
  int matrixRows;
  int matrixColumns;
  
  //Margenes de la matriz
  float marginPercent = 0.10;
  float marginLeft;
  float marginTop;
  
  //Dimensiones de cada celda
  float cellWidth;
  float cellHeight;
  float cellAxisX[];
  float cellAxisY[];
  
  //Información de cada celda
  Group[] cells;
  float[][] data = null;
  int dataColumns = 0;
  int dataRows = 0;
  
  //Etiquetas
  String[] labels;
  boolean labelTop;
  boolean labelBottom;
  boolean labelLeft;
  boolean labelRight;
  boolean labelCenter;
  
  //Ejes de coordenadas
  boolean axisTop;
  boolean axisBottom;
  boolean axisLeft;
  boolean axisRight;
  float axisPercent = 0.05;
  
  //Valores de los ejes
  int axisDivisions[] = null;  
  float minValues[] = null;
  float maxValues[] = null;
  
  
  
  /*
  =======================================================
  Este constructor recibe un ancho y largo de la matriz
  que pueden ser diferentes (no cuadrado). Ademas el nú-
  mero de filas y columnas tambien pueden ser diferentes.
  =======================================================
  */
  MatrixGraph(int w, int h, int r, int c) {
    matrixWidth = w;
    matrixHeight = h;
    matrixRows = r;
    matrixColumns = c;
  }
  
  /*
  =======================================================
  Este constructor recibe un ancho y largo de la matriz
  que son iguales. Ademas el número de filas y columnas
  pueden ser diferentes.
  =======================================================
  */
  MatrixGraph(int s, int r, int c) {
    matrixWidth = s;
    matrixHeight = s;
    matrixRows = r;
    matrixColumns = c;
  }

  /*
  =======================================================
  Este constructor recibe un ancho y largo de la matriz
  que son iguales. Ademas el número de filas y columnas
  es el mismo. Genera una matriz cuadrada.
  =======================================================
  */
  MatrixGraph(int s, int c) {
    matrixWidth = s;
    matrixHeight = s;
    matrixRows = c;
    matrixColumns = c;
  }
  
  /*
  =======================================================
  Realiza el proceso de dibujar todos los elementos que
  fueron agregados. Debe ejecutarse este metodo para que
  se muestre la figura.
  =======================================================
  */    
  void update() {
    empty();
    calculateCellArray();
    calculateCellSize();
    calculateMargins();
    calculateData();
    calculateMinMax();
    drawMatrix();
    drawLabel();
    drawAxis();
    drawData();
  }

  /*
  =======================================================
  Realiza el proceso de estimar el número de celdas que
  tendrá la matriz para crear un arreglo de objetos de 
  tipo Group.
  =======================================================
  */
  void calculateCellArray(){
    cells = new Group[matrixRows * matrixColumns];
    print("Matrix width: " + matrixWidth + "\n");
    print("Matrix height: " + matrixHeight + "\n");
    print("Matrix cells: " + matrixRows * matrixColumns + "\n");
  }

  /*
  =======================================================
  Realiza el proceso de estimar el tamaño de cada celda
  de la matriz (ancho y largo).
  =======================================================
  */
  void calculateCellSize(){
    cellWidth = (int)matrixWidth/matrixColumns;
    cellHeight = (int)matrixHeight/matrixRows;
    print("Matrix cell width: " + cellWidth + "\n");
    print("Matrix cell height: " + cellHeight + "\n");
  }
  
  /*
  =======================================================
  Realiza el proceso de estimar un margen basado en el
  10% del alto y el ancho correspondientemente de la ma-
  triz. El margen se utiliza para rotular los ejes.
  =======================================================
  */
  void calculateMargins(){
    marginTop = matrixHeight*marginPercent;
    marginLeft = matrixWidth*marginPercent;
    print("Matrix margin top: " + marginTop + "\n");
    print("Matrix margin left: " + marginLeft + "\n");   
  }
  
  /*
  =======================================================
  Realiza el proceso de estimar cuantos datos hay en la
  matriz de datos.
  =======================================================
  */
  void calculateData(){
    if(data != null) {
      dataRows = data.length;
      if(dataRows != 0) {
        dataColumns = data[0].length;
      }      
    }
    print("Data rows: " + dataRows + "\n");
    print("Data columns: " + dataColumns + "\n");
  }
  
  /*
  =======================================================
  Realiza el proceso de estimar los valores máximos y 
  mínimos de cada uno de los tipos de ejes y rellena
  los arreglos con esos valores.
  =======================================================
  */
  void calculateMinMax(){
    float min;
    float max;
    if(minValues == null || maxValues == null) {
      minValues = new float[matrixRows];
      maxValues = new float[matrixRows];
      for(int row = 0; row < dataRows; row++) {
        max = Integer.MIN_VALUE; //Revisar ver si es mejor usar 0
        min = Integer.MAX_VALUE; //Revisar ver si es mejor usar 0
        for(int column = 0; column < dataColumns; column++) {
          if(data[row][column] > max){
            max = data[row][column];
          }
          if(data[row][column] < min) {
            min = data[row][column];
          }
        }
        minValues[row] = min;
        maxValues[row] = max;
        print("Data " + labels[row] + " max value: " + max + "\n");
        print("Data " + labels[row] + " min value: " + min + "\n");
      }      
    }
    else {
      for(int row = 0; row < dataRows; row++) {
        print("Data " + labels[row] + " max value: " + maxValues[row] + "\n");
        print("Data " + labels[row] + " min value: " + minValues[row] + "\n");        
      }
    }
  }
  
  /*
  =======================================================
  Dibuja las etiquetas de cada parametro al lado del eje
  correspondiente y en el lado que defina el usuario.
  =======================================================
  */
  void drawLabel() {
     //Tamaño de la letra
    int size = (int)cellWidth/10;
    
    //Puntos iniciales para cada etiqueta.
    float initialTopX = marginLeft;
    float initialTopY = size;
    float initialBottomX = marginLeft;
    float initialBottomY = (marginTop * 2 - size * 0.75) + (matrixRows * cellHeight);
    float initialLeftX = size;
    float initialLeftY = marginTop + cellHeight;
    float initialRightX = (marginLeft * 2 - size * 0.75) + (matrixColumns * cellWidth);
    float initialRightY = marginTop + cellHeight;
    float initialCenterX = marginTop + size;
    float initialCenterY = marginLeft + size;
    //Declaración del texto.
    Text label;
    
    /*
    Dibuja las etiquetas en la parte superior de la matriz.
    */
    if(labelTop == true) {
      for(int count=0; count < matrixColumns; count++) {
        label = new Text(labels[count], initialTopX, initialTopY);
        label.fillColor(#000000);
        label.fontSize(size);
        label.fillColor(labelBackgroundColor);
        add(label);
        initialTopX += cellWidth;
      }      
    }
    /*
    Dibuja las etiquetas en la parte inferior de la matriz.
    */
    
    if(labelBottom == true) {
      for(int count=0; count < matrixColumns; count++) {
        label = new Text(labels[count], initialBottomX, initialBottomY);
        label.fillColor(#000000);
        label.fontSize(size);
        label.fillColor(labelBackgroundColor);
        add(label);
        initialBottomX += cellWidth;
      }      
    } 
    
    /*
    Dibuja las etiquetas en la parte izquierda de la matriz
    */    
    if(labelLeft == true) {
      for(int count=0; count < matrixColumns; count++) {
        label = new Text(labels[count], -initialLeftY, initialLeftX);
        label.fillColor(#000000);
        label.fontSize(size);
        label.rotate(270);
        label.fillColor(labelBackgroundColor);
        add(label);
        initialLeftY += cellHeight;
      }      
    }

    /*
    Dibuja las etiquetas en la parte derecha de la matriz
    */    
    if(labelRight == true) {
      for(int count=0; count < matrixColumns; count++) {
        label = new Text(labels[count], -initialRightY, initialRightX);
        label.fillColor(#000000);
        label.fontSize(size);
        label.rotate(270);
        label.fillColor(labelBackgroundColor);
        add(label);
        initialRightY += cellHeight;
      }      
    }  

    /*
    Dibuja las etiquetas en la parte central de la matriz
    */
    if(labelCenter == true) {
      for(int count=0; count < matrixColumns; count++) {
        label = new Text(labels[count], initialCenterX, initialCenterY);
        label.fillColor(#000000);
        label.fontSize(size);
        label.fillColor(labelBackgroundColor);
        add(label);
        initialCenterX += cellWidth;
        initialCenterY += cellHeight;
      }      
    }   
  }
  
  /*
  =======================================================
  Dibuja los ejes de la matriz.
  =======================================================
  */  
  void drawAxis() {
    int divisions;
    String value;
    float min;
    float max;
    float spacing;
    float nextValue;
    int aux;
    float size;
    
    float initialX;
    float initialY;
    
    Line line;
    Text text;
    
    if(axisDivisions == null) {
      axisDivisions = new int[matrixRows];
      for(int count = 0; count < matrixRows; count++){
        axisDivisions[count] = 5;
      }
    }
    
    /*
    Dibuja los ejes en la parte superior de la matriz
    */    
    if(axisTop == true) {
      initialX = marginLeft;
      initialY = marginTop;
        
      for(int row = 0; row < matrixRows; row++){
        divisions = axisDivisions[row];
        spacing = cellWidth/divisions;        
        min = minValues[row];
        max = maxValues[row];
        nextValue = 0;
        size = (int)cellWidth/matrixRows/divisions;

        for(int count = 0; count <= divisions; count++) {
          if(count == 0 || count == divisions) {
            line = new Line(initialX, initialY, initialX, initialY - (cellHeight * axisPercent*2));
          }
          else {
            line = new Line(initialX, initialY, initialX, initialY - (cellHeight * axisPercent));
            aux = (int)(nextValue*10);
            value = String.valueOf((float)aux/10);
            print("Value: " + aux + "<->" + value + "\n");  
            text = new Text(value ,initialX, initialY - (cellHeight * axisPercent * 2));
            text.fillColor(labelBackgroundColor);
            text.fontSize((int)size);
            add(text);
          }
          line.strokeColor(matrixBorderColor);
          add(line);
          initialX += spacing;
          nextValue += (max-min)/divisions;
        }
        initialX -= spacing;
      }
    }
    
    /*
    Dibuja los ejes en la parte inferior de la matriz
    */      
    if(axisBottom == true) { 
      initialX = marginLeft;
      initialY = marginTop + (cellHeight * matrixRows);
        
      for(int row = 0; row < matrixRows; row++){
        divisions = axisDivisions[row];
        spacing = cellWidth/divisions;        
        min = minValues[row];
        max = maxValues[row];
        nextValue = 0;
        size = (int)cellWidth/matrixRows/divisions;

        for(int count = 0; count <= divisions; count++) {
          if(count == 0 || count == divisions) {
            line = new Line(initialX, initialY, initialX, initialY + (cellHeight * axisPercent * 2));
          }
          else {
            line = new Line(initialX, initialY, initialX, initialY + (cellHeight * axisPercent));
            aux = (int)(nextValue*10);
            value = String.valueOf((float)aux/10);
            text = new Text(value ,initialX, initialY + (cellHeight * axisPercent * 2) + size);
            print("Value: " + aux + "<->" + value + "\n");  
            text.fillColor(labelBackgroundColor);
            text.fontSize((int)size);
            add(text);
          }
          line.strokeColor(matrixBorderColor);
          add(line);
          initialX += spacing;
          nextValue += (max-min)/divisions;
        }
        initialX -= spacing;
      }      
    }
    
    /*
    Dibuja los ejes en la parte izquierda de la matriz
    */      
    if(axisLeft == true) {
      initialX = marginLeft;
      initialY = marginTop;
        
      for(int row = 0; row < matrixRows; row++){
        divisions = axisDivisions[row];
        spacing = cellWidth/divisions;        
        min = minValues[row];
        max = maxValues[row];
        nextValue = (max-min);
        size = (int)cellWidth/matrixRows/divisions;

        for(int count = 0; count <= divisions; count++) {
          if(count == 0 || count == divisions) {
            line = new Line(initialX, initialY, initialX - (cellWidth * axisPercent*2), initialY);
          }
          else {
            line = new Line(initialX, initialY, initialX - (cellWidth * axisPercent), initialY);
            aux = (int)(nextValue*10);
            value = String.valueOf((float)aux/10);
            print("Value: " + aux + "<->" + value + "\n");               
            text = new Text(value ,initialX - (cellWidth * axisPercent) - size*2, initialY);
            text.fillColor(labelBackgroundColor);
            text.fontSize((int)size);
            add(text);
          }
          line.strokeColor(matrixBorderColor);
          add(line);
          initialY += spacing;
          nextValue -= (max-min)/divisions;
        }
        initialY -= spacing;
      }       
    }
    
    /*
    Dibuja los ejes en la parte derecha de la matriz
    */      
    if(axisRight == true) {
      initialX = marginLeft + (cellWidth * matrixColumns);
      initialY = marginTop;
        
      for(int row = 0; row < matrixRows; row++){
        divisions = axisDivisions[row];
        spacing = cellWidth/divisions;        
        min = minValues[row];
        max = maxValues[row];
        nextValue = (max-min);
        size = (int)cellWidth/matrixRows/divisions;

        for(int count = 0; count <= divisions; count++) {
          if(count == 0 || count == divisions) {
            line = new Line(initialX, initialY, initialX + (cellWidth * axisPercent*2), initialY);
          }
          else {
            line = new Line(initialX, initialY, initialX + (cellWidth * axisPercent), initialY);
            aux = (int)(nextValue*10);
            value = String.valueOf((float)aux/10);
            print("Value: " + aux + "<->" + value + "\n");            
            text = new Text(value ,initialX + (cellWidth * axisPercent) + size, initialY);
            text.fillColor(labelBackgroundColor);
            text.fontSize((int)size);
            add(text);
          }
          line.strokeColor(matrixBorderColor);
          add(line);
          initialY += spacing;
          nextValue -= (max-min)/divisions;
        }
        initialY -= spacing;
      }       
    }    
  }
  
  /*
  =======================================================
  Dibuja los cuadrados que corresponden a la matriz.
  =======================================================
  */
  void drawMatrix() {
    int position = 0;
    float pointX;
    float pointY;
    cellAxisX = new float[matrixRows * matrixColumns];
    cellAxisY = new float[matrixRows * matrixColumns];
    Rect square;
    
    for(int row = 0; row<matrixRows; row++) {
      for(int column = 0; column<matrixColumns; column++) {
        pointX = marginLeft + cellWidth*column;
        pointY = marginTop + cellHeight*row;
        square = new Rect(pointX, pointY, cellWidth, cellHeight);
        square.fillColor(matrixBackgroundColor);
        square.strokeColor(matrixBorderColor);
        add(square);
        cellAxisX[position] = pointX;
        cellAxisY[position] = pointY + cellHeight;     
        print("Cell " + position + ": " + pointX + "," + (pointY + cellHeight) + "\n");
        position += 1;        
      }
    }
  }
  
  /*
  =======================================================
  Dibuja los datos sobre la matriz.
  =======================================================
  */
  void drawData() {    
    float scalingX;
    float scalingY;
    
    float dataX[];
    float dataY[];
    
    float coordX;
    float coordY; 
    
    Circle dot;
    int position = 0; //Número de la celda en la que se encuentra actualmente.

    
    for(int row = 0; row < matrixRows; row++){
      scalingY = cellHeight/maxValues[row];
      
      for(int column = 0; column < matrixColumns; column++) {
        if(row == column && labelCenter == true) {
        }
        
        else {               
          scalingX = cellHeight/maxValues[column];
          dataX = data[column];
          dataY = data[row];
          
          /*
          Lee los datos de la matriz de datos y empieza a
          dibujar puntos sobre la celda de la matriz que
          corresponde.
          */
          for(int count = 0; count < dataColumns; count++) {
            coordX = cellAxisX[position] + dataX[count] * scalingX;
            coordY = cellAxisY[position] - dataY[count] * scalingY;
            dot = new Circle(coordX, coordY, (matrixHeight*matrixWidth)/100000);
            dot.strokeColor(dotBorderColor);            
            dot.fillColor(dotBackgroundColor);
            add(dot);
          }
        }
        position += 1;          
      }
    }
  }
}
