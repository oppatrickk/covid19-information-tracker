/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String date;
  String caseNo;
  String cumulativeCases;
  String activeCases;
  String previouslyReportedAndStillSickCases;
  String newlyReportedSickCases;

  FeedbackForm(
      this.date,
      this.caseNo,
      this.cumulativeCases,
      this.activeCases,
      this.previouslyReportedAndStillSickCases,
      this.newlyReportedSickCases
      );

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['date']}",
        "${json['caseNo']}",
        "${json['cumulativeCases']}",
        "${json['activeCases']}",
        "${json['previouslyReportedAndStillSickCases']}",
        "${json['newlyReportedSickCases']}"

    );
  }

  // Method to make GET parameters.
  Map toJson() => {
    'date': date,
    'caseNo': caseNo,
    'cumulativeCases': cumulativeCases,
    'activeCases': activeCases,
    'previouslyReportedAndStillSickCases': previouslyReportedAndStillSickCases,
    'newlyReportedSickCases': newlyReportedSickCases
  };
}