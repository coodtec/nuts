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
  for (html.Element child in targetElement.children) {
    if (child.children.isEmpty) {
      if (child.localName == 'div') child.remove();
    } 
    else if(child.children.length == 1 ) { 
        child.replaceWith(child.children.first);
        cleanDiv(child);
    }
    else {
      List<html.Element> grandchildren = child.children;
      child.innerHtml = '';
      for (html.Element grandchild in grandchildren) {
        cleanDiv(grandchild);
        if (grandchild.parent != null) {
          child.append(grandchild);
        }
        if (child.children.isEmpty) {if(child.localName == 'div') child.remove();}
        else if (child.children.length == 1) {
          if (child.localName == 'div') {child.replaceWith(child.children.first);}
        }
      }
    }
  } 
}
