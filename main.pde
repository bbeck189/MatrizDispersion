Group view;

//*****************************************************************************************   
void setup() {
  size(1000,1000);
  view = new Group();
  
/*
=======================================================
Ejemplo 1
=======================================================
*/  
  MatrixGraph matrix1;
  
  matrix1 = new MatrixGraph(400,4);
  matrix1.marginPercent = 0.10;
  matrix1.labelBottom = true;
  matrix1.labelLeft = true;
  matrix1.axisBottom = true;
  matrix1.axisLeft = true;
  matrix1.dotBorderColor = #0000ff;
  matrix1.dotBackgroundColor = #0000ff;
  matrix1.matrixBackgroundColor = #e6e6e6;
  
  matrix1.labels = new String[] {"Edad", "Peso", "Estatura","Hijos"};
  matrix1.data = new float[][] {
    new float[] {34, 25, 18, 40, 78, 24, 30, 22},
    new float[] {46.13, 42.8, 47.1, 54.3, 73.1, 40.5, 50.2, 60.1},
    new float[] {1.74, 1.81, 1.67, 1.72, 1.57, 1.80, 1.56, 1.77},
    new float[] {1, 2, 4, 1, 3, 1, 1, 2}
  };
  matrix1.minValues = new float[] {0, 0, 0, 0};
  matrix1.maxValues = new float[] {100, 100, 5, 10};
  matrix1.axisDivisions = new int[] {5, 5, 5, 5};
  matrix1.update();
  
  view.add(matrix1);
  
/*
=======================================================
Ejemplo 2
=======================================================
*/
  MatrixGraph matrix2;
  
  matrix2 = new MatrixGraph(400,3);
  matrix2.marginPercent = 0.10;
  matrix2.labelLeft = true;
  matrix2.labelTop = true;
  matrix2.dotBackgroundColor = #000000;
  matrix2.matrixBackgroundColor = #e6e6ff;
  
  matrix2.labels = new String[] {"Vehiculos", "Peso", "Contrabando"};
  matrix2.data = new float[][] {
    new float[] {18, 35, 22, 2, 24, 40, 10, 9, 40, 30},
    new float[] {18, 44, 47, 11, 32, 15, 40, 45, 29, 22},
    new float[] {8, 24, 16, 10, 1, 20, 5, 8, 15, 27}
  };
  matrix2.minValues = new float[] {0, 0, 0};
  matrix2.maxValues = new float[] {50, 50, 50};
  matrix2.axisDivisions = new int[] {5, 5, 5};
  matrix2.update();
  matrix2.translate(500, 0);
  
  view.add(matrix2);
  
/*
=======================================================
Ejemplo 3
=======================================================
*/
  MatrixGraph matrix3;
  
  matrix3 = new MatrixGraph(400,5);
  matrix3.marginPercent = 0.10;
  matrix3.labelCenter = true;
  matrix3.axisTop = true;
  matrix3.axisRight= true;
  matrix3.matrixBorderColor = #ff0000;
  matrix3.matrixBackgroundColor = #58fa82;
  matrix3.labelBackgroundColor = #ff00ff;
  
  matrix3.labels = new String[] {"Medicamentos", "Costo", "Unidades", "Frecuencia", "Edad"};
  matrix3.data = new float[][] {
    new float[] {30, 22, 10, 14, 30, 28, 48, 40 ,42 ,30},
    new float[] {2, 4, 8, 2 , 5, 3 ,1 ,2 , 7, 8},
    new float[] {12, 24, 7, 8, 20, 10, 11, 15, 21, 4},
    new float[] {12, 8, 4, 2, 5, 4, 2, 3, 10, 1},
    new float[] {77, 88, 24, 38, 90, 41, 53, 47, 45, 57}
  };
  matrix3.minValues = new float[] {0, 0, 0, 0, 0};
  matrix3.maxValues = new float[] {50, 10, 50, 25, 100};
  matrix3.axisDivisions = new int[] {2, 2, 2, 2, 2};
  matrix3.update();
  matrix3.translate(0, 500);
  
  view.add(matrix3);
  
/*
=======================================================
Ejemplo 4
=======================================================
*/
  MatrixGraph matrix4;
  
  matrix4 = new MatrixGraph(400,2);
  matrix4.marginPercent = 0.10;
  matrix4.labelCenter = true;
  matrix4.axisTop = true;
  matrix4.axisLeft = true;
  
  matrix4.labels = new String[] {"Atomos (millones)", "Energia (miles)"};
  matrix4.data = new float[][] {
    new float[] {8, 97, 63, 21, 57, 80, 46, 64, 62, 65, 98, 34, 19, 77, 42, 1, 31, 69, 2, 32, 53, 85, 23, 89, 45, 94, 52, 61, 100, 90, 49, 91, 9, 13, 83, 39, 66, 75, 86, 27, 79, 96, 92, 6, 72, 50, 74, 44, 84, 95, 74, 38, 72, 94, 44, 75, 55, 61, 91, 21, 98, 36, 17, 19, 69, 48, 89, 59, 7, 70, 15, 96, 33, 82, 13, 51, 62, 43, 25, 45, 5, 18, 14, 53, 27, 52, 68, 50, 60, 24, 42, 9, 3, 47, 34, 95, 6, 2, 78, 23, 7, 78, 46, 77, 57, 49, 95, 38, 17, 67, 20, 31, 89, 87, 45, 43, 63, 40, 35, 72, 1, 23, 75, 85, 27, 32, 51, 91, 53, 71, 50, 24, 33, 11, 76, 97, 66, 14, 80, 92, 82, 25, 19, 86, 58, 55, 21, 93, 96, 64, 31, 4, 10, 17, 1, 44, 7, 18, 32, 35, 22, 24, 47, 13, 3, 48, 9, 15, 16, 50, 29, 43, 33, 34, 14, 30, 11, 5, 21, 42, 39, 2, 46, 25, 38, 36, 40, 12, 41, 26, 23, 27, 6, 20, 45, 37, 28, 8, 19, 49, 10, 2, 19, 6, 11, 8, 4, 14, 18, 20, 7, 12, 1, 17, 16, 5, 3, 15, 13, 9, 3, 19, 10, 6, 17, 20, 18, 2, 14, 8, 1, 12, 11, 7, 9, 5, 16, 15, 13, 4},
    new float[] {19, 9, 16, 20, 5, 13, 14, 11, 10, 6, 7, 1, 4, 15, 8, 17, 18, 3, 2, 12, 27, 87, 3, 37, 90, 55, 50, 82, 25, 16, 68, 40, 52, 14, 46, 93, 70, 60, 15, 39, 75, 11, 34, 9, 85, 69, 22, 80, 28, 33, 81, 57, 86, 7, 30, 31, 2, 36, 78, 6, 58, 38, 79, 8, 29, 20, 17, 4, 5, 54, 24, 63, 69, 68, 61, 55, 4, 89, 80, 75, 5, 74, 77, 1, 3, 90, 93, 95, 23, 21, 46, 22, 27, 54, 19, 20, 70, 64, 59, 71, 86, 65, 33, 82, 84, 30, 34, 43, 6, 32, 97, 100, 92, 85, 7, 83, 42, 96, 58, 51, 37, 86, 45, 22, 50, 32, 71, 1, 10, 27, 31, 6, 4, 98, 83, 88, 43, 33, 38, 99, 77, 41, 29, 61, 2, 81, 58, 92, 5, 39, 16, 18, 62, 67, 80, 90, 3, 40, 89, 95, 51, 47, 74, 53, 54, 7, 35, 97, 8, 60, 16, 6, 34, 13, 43, 50, 27, 46, 4, 17, 28, 48, 20, 11, 14, 32, 37, 31, 30, 36, 8, 18, 9, 40, 10, 35, 38, 24, 3, 49, 42, 19, 29, 23, 25, 7, 45, 39, 12, 5, 44, 15, 2, 41, 47, 22, 26, 21, 1, 33, 19, 9, 16, 20, 5, 13, 14, 11, 10, 6, 7, 1, 4, 15, 8, 17, 18, 3, 2, 12}
  };
  matrix4.minValues = new float[] {0, 0};
  matrix4.maxValues = new float[] {100, 100};
  matrix4.axisDivisions = new int[] {10, 10};
  matrix4.update();
  matrix4.translate(500, 500);
  
  view.add(matrix4);    
  
//*****************************************************************************************   
}

void draw() {
  background(#ffffff);
  view.draw();
}