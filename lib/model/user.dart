class User {
  final String firstName;
  final String lastName;
  final int? boto;

  const User({required this.firstName, required this.lastName, this.boto});

  User copy({
    String? firstName,
    String? lastName,
    int? boto,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        boto: boto ?? this.boto,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          boto == other.boto;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ boto.hashCode;
}
