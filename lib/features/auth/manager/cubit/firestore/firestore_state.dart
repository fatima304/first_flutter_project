abstract class FirestoreState {}

class FirestoreInitial extends FirestoreState {}

class FirestoreLoading extends FirestoreState {}

class FirestoreSuccess extends FirestoreState {}

class FirestoreLoaded extends FirestoreState {
  final List<Map<String, dynamic>> users;

  FirestoreLoaded(this.users);
}

class FirestoreFailure extends FirestoreState {
  final String errorMessage;

  FirestoreFailure(this.errorMessage);
}
