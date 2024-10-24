
import 'dart:math';

int counter = 0;
List<int> rotiQueue = [];
void main() async {
  for(int i = 0; i < 100; i++){
   motherProcess();
   childProcess();
  }
}

void motherProcess(){
  addRoti( quantity: 1);
  counter = counter + 1;
  printStatus();
}

void childProcess(){
  if(rotiQueue.isEmpty){
    return;
  }

  rotiQueue.removeAt(0);
  // this is the critical section.
  counter = counter - 1;
  printStatus();
}


void addRoti({int quantity = 1}){

  if(rotiQueue.length >= 5){
    return;
  }
  if(quantity >= 5){
    return;
  }

  for( int i = 0; i< quantity; i++){
    rotiQueue.add(0);
  }

  // this is the critical section.
  counter = counter + quantity;
}

void printStatus(){
  print( "Rotis as per counter : $counter\n");
  print(rotiQueue);
  print("\n");
}