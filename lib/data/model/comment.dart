class CommentModel {
  final String id;
  final String userName;
  final String userProfile;
  final String comment;
  final int stars;

  CommentModel({
    required this.id,
    required this.userName,
    required this.userProfile,
    required this.comment,
    required this.stars,
  });
  factory CommentModel.fromMap(Map<String, dynamic> mapJson) {
    return CommentModel(
      id: mapJson['id'],
      userName: mapJson['userName'],
      userProfile: mapJson['userProfile'],
      comment: mapJson['comment'],
      stars: mapJson['stars'],
    );
  }
}
