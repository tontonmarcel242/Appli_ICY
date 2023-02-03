import 'package:app_icy/home/widgets/CoursWidget.dart';
import 'package:flutter/cupertino.dart';
import 'CoursRepo.dart';

class ProviderSearch extends ChangeNotifier {
  List<CoursWidget> _l_cw = CoursRepo().ListCoursWidget;
  List<CoursWidget> _l_display = <CoursWidget>[];

  List<CoursWidget> get ListCoursWidget {
    if(_l_display.isNotEmpty) {
      return _l_display;
    }
    else {
      return _l_cw;
    }
  }

  // Fonction qui met à jour la liste des CoursWidget de l'on va afficher en rapport au mot clé recherché
  void updateList(String word) {
    _l_display = <CoursWidget>[];
    for(CoursWidget cw in _l_cw ){
      if(cw.s.Matiere.toLowerCase().contains(word.toLowerCase()) || cw.s.Module.toLowerCase().contains(word.toLowerCase())) {
        _l_display.add(cw);
      }
    }
    notifyListeners();
  }
}