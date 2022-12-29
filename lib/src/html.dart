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

//clean div Tags
cleanDiv(html.Element targetElement){
  List<html.Element> divTags = targetElement.querySelectorAll('div');
  for (html.Element div in divTags) {
    if (div.children.isEmpty){
      div.remove();
    }else
     {
      html.Element clear = html.Element.tag('div');
      List<html.Element> children = div.children;
      if (children.length == 1) {
        clear =children.first;
      } else {
        for (var element in children) { 
          clear.append(element);
        }
      }
      div.replaceWith(clear);
    }

    if(div.children.length == 1) {
      div.replaceWith(div.children.first);
    } 
  }  
}