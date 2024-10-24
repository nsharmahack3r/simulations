void main() async {

  final case1 = ChipCodeCase(
    aChippingCode: [0, 0, 1, 1, 0, 0, 1, 1],
    bChippingCode: [0, 1, 1, 0, 0, 1, 1, 0],
    title: "Test Case 1"
  );

  final case2 = ChipCodeCase(
    aChippingCode: [1, 0, 1, 1, 0, 0, 1, 1],
    bChippingCode: [0, 1, 1, 0, 0, 1, 0, 0],
    title: "Test Case 2"
  );

  final case3 = ChipCodeCase(
    aChippingCode: [1, 0, 0, 1, 0, 0, 1, 1],
    bChippingCode: [0, 1, 1, 0, 0, 1, 0, 1],
    title: "Test Case 3"
  );

  await runSignalSimulation(case1);
  await runSignalSimulation(case2);
  await runSignalSimulation(case3);
}

Future<void> runSignalSimulation(ChipCodeCase chipCodeCase) async {

  final aChipCode = chipCodeCase.aChippingCode;
  final bChipCode = chipCodeCase.bChippingCode;

  print("Running simulation for ${chipCodeCase.title}");

  print("Input values : ");
  print("A : $aChipCode");
  print("B : $bChipCode\n");

  await Future.delayed(const Duration(seconds: 1));

  final aChippingCode = convertChippingCode(aChipCode);

  print("Chipping code for A : ");
  print(aChippingCode);

  final bChippingCode = convertChippingCode(bChipCode);

  final bInvertedChippingCode = invertChippingCode(bChippingCode);

  print("Chipping code for B : ");
  print("$bChippingCode\n");

  final signal = addChippingCodes(aChippingCode, bInvertedChippingCode);

  await Future.delayed(const Duration(seconds: 1));

  print("Generated Signal : ");
  print("$signal\n");

  await Future.delayed(const Duration(seconds: 1));

  final decodeChippingCodeForA = decodeChippingCode(signal, aChippingCode);
  print('Decoded A value : $decodeChippingCodeForA');
  final decodeChippingCodeForB = decodeChippingCode(signal, bChippingCode);
  print('Decoded B value : $decodeChippingCodeForB');

  print("Simulation for ${chipCodeCase.title} Ended\n\n");
}

List<int> convertChippingCode(List<int> input) {
  final result = input.map((i) {
    if (i == 0) {
      return -1;
    }
    return 1;
  }).toList();
  return result;
}

List<int> invertChippingCode(List<int> input) {
  final result = input.map((i) {
    return i * -1;
  }).toList();

  return result;
}

List<int> addChippingCodes(List<int> codeA, List<int> codeB) {
  final List<int> result = [];
  for (int i = 0; i < codeA.length; i++) {
    result.add(codeA[i] + codeB[i]);
  }
  return result;
}

int decodeChippingCode(List<int> signal, List<int> chippingCode) {
  final List<int> result = [];
  for (int i = 0; i < chippingCode.length; i++) {
    result.add(signal[i] * chippingCode[i]);
  }

  int sum = 0;
  for (final val in result) {
    sum = sum + val;
  }

  return sum > 0 ? 1 : 0;
}

class ChipCodeCase {
  final List<int> aChippingCode;
  final List<int> bChippingCode;
  final String title;

  ChipCodeCase({required this.aChippingCode, required this.bChippingCode, required this.title,});
}
