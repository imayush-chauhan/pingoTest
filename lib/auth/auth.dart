// Future<User?> signInWithEmail(
//     BuildContext context, String email, String password) async {
//   final signInFunc = () => FirebaseAuth.instance
//       .signInWithEmailAndPassword(email: email.trim(), password: password);
//   return signInOrCreateAccount(context, signInFunc, 'EMAIL');
// }
//
// Future<User?> createAccountWithEmail(
//     BuildContext context, String email, String password) async {
//   final createAccountFunc = () => FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: email.trim(), password: password);
//   return signInOrCreateAccount(context, createAccountFunc, 'EMAIL');
// }