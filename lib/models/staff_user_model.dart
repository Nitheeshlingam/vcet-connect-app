class StaffModel {
  final String? staffId;
  final String? staffName;
  final String? staffMail;
  final String? staffPhone;
  final String? staffHandleDept;
  final String? staffHandleBatch;
  final String? staffHandleSection;
  final String? staffRole;
  final bool isMentor;
  final bool isHod;
  final String? classInchargeBatchId;
  final String? classInchargeSectionId;
  final int? numberOfClassesHandledAsMentor;
  List<MentorHandlingData>? mentorHandlingData;
  final String password;
  final String userType;

  StaffModel(
      {required this.staffId,
      required this.staffName,
      required this.staffMail,
      required this.staffPhone,
      required this.staffHandleBatch,
      required this.staffHandleSection,
      required this.staffHandleDept,
      required this.staffRole,
      required this.isHod,
      required this.isMentor,
      required this.classInchargeBatchId,
      required this.classInchargeSectionId,
      required this.numberOfClassesHandledAsMentor,
      required this.mentorHandlingData,
      required this.password,
      required this.userType});

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      staffId: json['staffId']?.toString(),
      staffName: json['staffName']?.toString(),
      staffMail: json['staffMail']?.toString(),
      staffPhone: json['staffPhone']?.toString(),
      staffHandleBatch: json['staffHandleBatch']?.toString(),
      staffHandleSection: json['staffHandleSection']?.toString(),
      staffHandleDept: json['staffHandleDept']?.toString(),
      staffRole: json['staffRole']?.toString(),
      isHod: json['isHod'] ?? false, 
      isMentor: json['isMentor'] ?? false, 
      classInchargeBatchId: json['classInchargeBatchId']?.toString(),
      classInchargeSectionId: json['classInchargeSectionId']?.toString(),
      numberOfClassesHandledAsMentor: json['numberOfClassesHandledAsMentor'] as int? ?? 0,  
      mentorHandlingData: (json['mentorHandlingData'] as List<dynamic>?)
          ?.map((data) => MentorHandlingData.fromJson(data))
          .toList() ?? [],  
      password: json['password'].toString(),  
      userType: json['userType']?.toString() ?? 'staff',  
    );
  }
}

class MentorHandlingData {
  final String? handlingBatchId;
  final String? handlingSectionId;

  MentorHandlingData(
      {required this.handlingBatchId, required this.handlingSectionId});

  factory MentorHandlingData.fromJson(Map<String, dynamic> json) {
    return MentorHandlingData(
        handlingBatchId: json['handlingBatchId']?.toString(),
        handlingSectionId: json['handlingSectionId']?.toString());
  }
}
