#include <iostream>
using namespace std;

void printCode(int* code, int length) {
    for (int i = 0; i < length; i++) {
        cout << code[i] << " ";
    }
    cout << endl;
}

void convertChippingCode(const int* input, int* output, int length) {
    for (int i = 0; i < length; i++) {
        if (input[i] == 0) {
            output[i] = -1;
        } else {
            output[i] = 1;
        }
    }
}

void invertChippingCode(const int* input, int* output, int length) {
    for (int i = 0; i < length; i++) {
        output[i] = input[i] * -1;
    }
}

void addChippingCode(const int* codeA, const int* codeB, int* output, int length) {
    for (int i = 0; i < length; i++) {
        output[i] = codeA[i] + codeB[i];
    }
}

int decodeChippingCode(const int* signal, const int* chippingCode, int length) {
    int sum = 0;
    for (int i = 0; i < length; i++) {
        sum += signal[i] * chippingCode[i];
    }
    return sum > 0 ? 1 : 0;
}

void runSignalSimulation() {
    int codeLength;
    cout << "Enter the length of the chipping codes: ";
    cin >> codeLength;

    int aChipCode[codeLength];
    int bChipCode[codeLength];

    cout << "Enter the elements for aChipCode (0 or 1):" << endl;
    for (int i = 0; i < codeLength; i++) {
        cin >> aChipCode[i];
    }

    cout << "Enter the elements for bChipCode (0 or 1):" << endl;
    for (int i = 0; i < codeLength; i++) {
        cin >> bChipCode[i];
    }

    int aChippingCode[codeLength];
    int bChippingCode[codeLength];
    int bInvertedChippingCode[codeLength];
    int signal[codeLength];

    convertChippingCode(aChipCode, aChippingCode, codeLength);
    convertChippingCode(bChipCode, bChippingCode, codeLength);

    invertChippingCode(bChippingCode, bInvertedChippingCode, codeLength);

    addChippingCode(aChippingCode, bInvertedChippingCode, signal, codeLength);

    cout<<"Encoded Data At A";
    printCode(aChippingCode, codeLength);

    cout<<"Encoded Data At B";
    printCode(bChippingCode, codeLength);

    cout<<"Encoded Signal : ";
    printCode(signal, codeLength);

    int decodedResultA = decodeChippingCode(signal, aChippingCode, codeLength);
    int decodedResultB = decodeChippingCode(signal, bChippingCode, codeLength);


    cout << "Result A: " << decodedResultA << endl;
    cout << "Result B: " << decodedResultB << endl;
}

int main() {
    runSignalSimulation();
    return 0;
}
