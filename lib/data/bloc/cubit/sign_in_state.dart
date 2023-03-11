// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  SignInState({
    this.isLoading = false,
  });

  final bool isLoading;

  SignInState copyWith({
    bool? isLoading,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
