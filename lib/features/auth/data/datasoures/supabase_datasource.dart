import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class SupabaseDatasource{
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
});
  Future<String> signInWithEmailPassword({
    required String name,
    required String email,
    required String password
  });
}

class  SupabaseDatasourceImpl implements SupabaseDatasource{
  final SupabaseClient supabaseClient;
  SupabaseDatasourceImpl(this.supabaseClient);

  @override
  Future<String> signInWithEmailPassword({required name, required email, required password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,

  })async{
    try{
      final response = await supabaseClient.auth.signUp(password: password,email: email,data: {"name":name});
      if(response.user == null){
        throw Exception("user in null");
      }
      return response.user!.id;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}