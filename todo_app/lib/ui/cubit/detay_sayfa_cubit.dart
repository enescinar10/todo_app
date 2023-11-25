import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/yapilacaklar_dao_repository.dart';
class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int id ,String name) async{
    await yrepo.guncelle(id , name);
  }
}