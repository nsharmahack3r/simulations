#include<iostream>
#include <cmath>
using namespace std;


class Cell{
    float radius;
    float offset;

    public : Cell( float r, float o ){
        radius = r;
        offset = o;
    }

    float getRadius(){
        return radius;
    }

    float getOffest(){
        return offset;
    }
};

int runSimulation(double y, double offset){
    float radius = 7;
    Cell cells[] = {
        Cell(radius, offset),
        Cell(radius, offset),
        Cell(radius, 0),
        Cell(radius, 0),
        Cell(radius, -offset),
        Cell(radius, -offset),
    };

    float x = 0;

    for(int i = 0; i < 6; i++){

        Cell cell = cells[i];

        int n = 7;

        float d = sqrt(3 * n) * cell.getRadius();

        float q = (d/cell.getRadius()) - cell.getOffest();

        x = x + pow(q, -y);
    }

    float result = 1/x;

    cout<< "When y = "<<y<<" & Mobile station is @ "<<offset<<" Offset from Center"<<endl;
    cout<<"Co-channel interference is "<<result<<"\n\n";
    return 0;
}

int main(){
    cout<<"Running simulation for co-channel Interference"<<endl;
    int option = -1;
    while (option != 0)
    {
        cout<<"Where is your mobile station located?"<<endl;
        cout<<"1. At the center (Best Case)"<<endl;
        cout<<"2. At R/4"<<endl;
        cout<<"3. At R/2"<<endl;
        cout<<"4. At 3R/4"<<endl;
        cout<<"5. At R (Worst Case)"<<endl;
        cout<<"0. Exit\n";
        cin>>option;

        if(option == 0){
            return 0;
        }

        double offset = 0.0;

        switch(option){
            case 1: offset = 0.0; break;
            case 2: offset = 0.25; break;
            case 3: offset = 0.5; break;
            case 4: offset = 0.75; break;
            case 5: offset = 1.0; break;
        }

        int y = 2;

        cout<<"Enter value of gamma"<<endl;
        cin>>y;

        runSimulation(y, offset);
    }
    
}