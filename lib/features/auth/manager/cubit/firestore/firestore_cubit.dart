import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_project/features/auth/manager/cubit/firestore/firestore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirestoreCubit extends Cubit<FirestoreState> {
  FirestoreCubit() : super(FirestoreInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save user data to Firestore 'users' collection
  Future<void> saveUser({
    required String name,
    required String age,
    required String favouriteHobby,
  }) async {
    emit(FirestoreLoading());

    try {
      await _firestore.collection('users').add({
        'name': name,
        'age': age,
        'favouriteHobby': favouriteHobby,
      });

      emit(FirestoreSuccess());
    } on FirebaseException catch (e) {
      emit(FirestoreFailure(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(FirestoreFailure(e.toString()));
    }
  }

  // Fetch all users from Firestore 'users' collection
  Future<void> getUsers() async {
    emit(FirestoreLoading());

    try {
      final snapshot = await _firestore.collection('users').get();
      final users = snapshot.docs.map((doc) => doc.data()).toList();

      emit(FirestoreLoaded(users));
    } on FirebaseException catch (e) {
      emit(FirestoreFailure(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(FirestoreFailure(e.toString()));
    }
  }
}
