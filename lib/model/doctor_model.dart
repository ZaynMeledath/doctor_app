class DoctorModel {
  final String? name;
  final String? specialization;
  final String? hospital;
  final String? description;
  final int? experience;
  final int? totalPatients;
  final int totalReviews;

  DoctorModel({
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.description,
    required this.experience,
    required this.totalPatients,
    required this.totalReviews,
  });
}
