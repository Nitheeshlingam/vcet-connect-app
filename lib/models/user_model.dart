class UserModel {
  final String token;
  final String id;
  final String name;
  final String rollNo;
  final String registerNo;
  final String email;
  final String phone;
  final String parentPhone;
  final String departmentId;
  final String mentorId;
  final String batchId;
  final String sectionId;
  final String sectionName;
  final String userType;

  UserModel(
      {required this.token,
      required this.id,
      required this.batchId,
      required this.name,
      required this.rollNo,
      required this.registerNo,
      required this.email,
      required this.phone,
      required this.parentPhone,
      required this.departmentId,
      required this.mentorId,
      required this.sectionId,
      required this.sectionName,
      required this.userType});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token']?.toString() ?? "",
      id: json['id']?.toString() ?? "", 
      name: json['name']?.toString() ?? "Unknown",
      rollNo: json['roll_no']?.toString() ?? "",
      registerNo: json['register_no']?.toString() ?? "",
      email: json['email']?.toString() ?? "No Email",
      phone: json['phone']?.toString() ?? "No Phone",
      parentPhone: json['parent_phone']?.toString() ?? "No Parent Phone",
      departmentId: json['departmentId']?.toString() ?? "",
      mentorId: json['mentorId']?.toString() ?? "",
      batchId: json['batchId']?.toString() ?? "",
      sectionId: json['sectionId']?.toString() ?? "",
      sectionName: json['section_name']?.toString() ?? "",
      userType: json['userType']?.toString() ?? "Unknown",
    );
  }
}
