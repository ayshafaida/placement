class JobModel {
    final String id;
    final String companyName;
    final String contactNo;
    final String companyMail;
    final String location;
    final String image;
    final String jobName;
    final String salary;
    final String jobDetails;
    final String CompanyID;


    JobModel({
        required this.id,
        required this.companyName,
        required this.contactNo,
        required this.companyMail,
        required this.location,
        required this.image,
        required this.jobName,
        required this.salary,
        required this.jobDetails,
        required this.CompanyID,
    });

    factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        companyName: json["company_name"],
        contactNo: json["contact_no"],
        companyMail: json["company_mail"],
        location: json["location"],
        image: json["image"],
        jobName: json["job_name"],
        salary: json["salary"],
        jobDetails: json["job_details"],
        CompanyID: json["CompanyID"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "contact_no": contactNo,
        "company_mail": companyMail,
        "location": location,
        "image": image,
        "job_name": jobName,
        "salary": salary,
        "job_details": jobDetails,
        "CompanyID": CompanyID,
    };
}
