part of nuts;

String stringN(String? s) => s?? '';
  //(s == null) ? '' : s;


int intN(int? i) => i?? 0;


void dPrint(String text) {
  if (kDebugMode)  print(text);
}

class DebugPrint {
  bool _show = false;

  DebugPrint();
  
  get status => _show;
  set on(bool status) => _show = status;
  
  set print(String str){
    if (_show) dPrint(str);
  }

}
