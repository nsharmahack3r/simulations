import 'dart:math';
void main(){

  final testCases = TestCases();

  for (final y in testCases.yValues){
    for(final offset in testCases.offsets){
      runSimulation(y: y, offset: offset);
    }
  }

}

void runSimulation({ required double y, required double offset, }){
  final double radius = 10;
  final cells = [
    Cell(radius: radius, offset: offset),
    Cell(radius: radius, offset: offset),
    Cell(radius: radius, offset: 0),
    Cell(radius: radius, offset: 0),
    Cell(radius: radius, offset: -offset),
    Cell(radius: radius, offset: -offset),
  ];

  double x = 0;

  for ( final cell in cells){

    final n = (cells.length + 1);

    final d = sqrt(3 * n) * cell.radius;

    final q = (d/cell.radius) - cell.offset;

    x = x + pow(q, -y);
  }


  print('C/I when y = $y & Mobile station @ offset $offset');
  print(1/x);
}

class Cell {
  final double radius;
  final double offset;
  Cell({required this.radius, this.offset = 0});
}

class TestCases{
  final List<double> yValues = [ 2, 2.5, 3, 3.5, 4, 4.5, 5 ];
  final List<double> offsets = [0, 1/4, 1/2, 3/4, 1];
  late final String title;
}