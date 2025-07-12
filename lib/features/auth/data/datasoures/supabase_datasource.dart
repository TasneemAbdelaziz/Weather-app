import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/features/auth/data/models/user_model.dart';

abstract interface class SupabaseDatasource{
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
});
  Future<UserModel> signInWithEmailPassword({
    // required String name,
    required String email,
    required String password
  });
}

class  SupabaseDatasourceImpl implements SupabaseDatasource{

  final SupabaseClient supabaseClient;
  SupabaseDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInWithEmailPassword({ required email, required password}) async{
    try{
      final response = await supabaseClient.auth.signInWithPassword(password: password,email: email);
      if(response.user == null){
        throw Exception("user in null");
      }
      return UserModel.fromJson(response.user!.toJson());
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,

  })async{
    try{
      final response = await supabaseClient.auth.signUp(password: password,email: email,data: {"name":name});
      if(response.user == null){
        throw Exception("user in null");
      }
      return UserModel.fromJson(response.user!.toJson());
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}