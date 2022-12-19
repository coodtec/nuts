part of nuts;

String stringN(String? s) => s?? '';
  //(s == null) ? '' : s;


int intN(int? i) => i?? 0;


void dPrint(String text) {
  if (kDebugMode)  print(text);
}

