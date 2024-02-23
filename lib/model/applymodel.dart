class ApplyModel {
    final int companyId;
    final DateTime date;
    final String jobName;
    final String salary;
    final String jobDetails;
    final String companyname;
    final String location;

    ApplyModel({
        required this.companyId,
        required this.date,
        required this.jobName,
        required this.salary,
        required this.jobDetails,
        required this.companyname,
        required this.location,
    });

    factory ApplyModel.fromJson(Map<String, dynamic> json) => ApplyModel(
        companyId: json["company_id"],
        date: DateTime.parse(json["date"]),
        jobName: json["jobName"],
        salary: json["salary"],
        jobDetails: json["jobDetails"],
        companyname: json["companyname"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "jobName": jobName,
        "salary": salary,
        "jobDetails": jobDetails,
        "companyname": companyname,
        "location": location,
    };
}
