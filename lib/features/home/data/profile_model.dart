class Profile {
  final String name;
  final String email;
  const Profile({required this.name, required this.email});
  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json['name'] as String? ?? 'Unknown',
    email: json['email'] as String? ?? '-',
  );
}
