part of nuts;

List<String> kImageExtension = ['jpg', 'jpeg', 'gif', 'png', 'webp', 'bmp'];

//find urls from string
List<String> urls(String text) {
  RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  Iterable<RegExpMatch> matches = exp.allMatches(text);
  
  List<String>  ret = <String>[];
  if(matches.isNotEmpty) {
    for(final match in matches) {ret.add(text.substring(match.start, match.end));}
  }
  return ret;
}