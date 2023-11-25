import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/yapilacaklar_dao_repository.dart';
class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);
  var yrepo = YapilacaklarDaoRepository();

  Future<void> kaydet(String name) async{
    await yrepo.kaydet(name);
  }
}