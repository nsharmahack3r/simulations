import 'dart:math';

int counter = 0;
const MAX_LENGTH = 5;
const INFINITE = 100;
int flag = -1;
final List<int> rotiQueue = [];
int iteration = 0;

void main(){
  final childProcess = Process(id: 10, turn: 0, run: (){
    if(flag == -1){
      flag = 0;
      eatRoti();
      flag = -1;
    }
  });
  final motherProcess = Process(id: 11, turn: 1, run: (){
    if(flag == -1){
      flag = 1;
      createRoti();
      flag = -1;
    }    
  });

  for(int i = 0; i < INFINITE; i++){
    motherProcess.run();
    childProcess.run();
    ++iteration;
    print(iteration);
  }
}

void createRoti(){
  rotiQueue.add(0);
  ++counter;
  printStatus();
}

void eatRoti(){
  if(rotiQueue.isNotEmpty){
    rotiQueue.removeAt(counter-1);
  --counter;
  printStatus();
  }
}

printStatus(){
  print("Roti Queue : $rotiQueue");
  print("Counter : $counter");
}

class Process {
  final int id;
  final int turn;
  final Function run;

  Process({
    required this.id,
    required this.turn,
    required this.run,
  });
}

// Mutual exclucion
// Bounded Wait
// Progress