class EmergencyNoModal {
  final int id;
  final String? username;
  final String? phone;
  bool pinned;

  EmergencyNoModal({
    required this.id,
    this.username,
    this.phone,
    this.pinned = true, // Default pinned value set to false
  });
}
