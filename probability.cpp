#include<iostream>
#include<cmath>
using namespace std;

int calculateFactorial(int n){
    int fact = 1;
    for (int i = 1; i<=n ;i++){
        fact*=i;
    }

    return fact;
}

int main(){

    int a = 3;
    int s = 2;
    int t = 360;

    double num = pow(a,s)/calculateFactorial(s);

    int denom= 0;

    for(int i = 0; i<=s; i++){
        denom += pow(a, i)/calculateFactorial(i);
    }

    double block = num/denom;

    double avg_call = a/t;

    double eff_sys = (a*(1-block))/s;

    return 0;
}