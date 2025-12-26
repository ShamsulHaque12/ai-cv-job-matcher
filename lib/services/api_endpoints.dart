class Urls {

  /// k3qbhc8f77@illubd.com pass: 123456

  static const String url='https://api.dmvjobs.cloud/';
  static const String baseUrl = 'https://api.dmvjobs.cloud/api/v1';

  /// Individual
  static const String registerIndividual = "$baseUrl/users/register";
  static const String verifyIndividual = "$baseUrl/auth/email-verify";
  static const String resendOtpIndividual = "$baseUrl/auth/resend-otp";
  static const String resendOtpVerifyIndividual = "$baseUrl/auth/verify-reset-password-otp";

  /// Enterprise
  static const String registerEnterprise = "$baseUrl/users/register";
  static const String verifyEnterprise = "$baseUrl/auth/email-verify";
  static const String resendOtpEnterPrise = "$baseUrl/auth/resend-otp";
  static const String resendOtpVerifyEnterprise = "$baseUrl/auth/verify-reset-password-otp";

  /// Job Seekers
  static const String registerSeekers = "$baseUrl/users/register";
  static const String verifySeekers = "$baseUrl/auth/email-verify";
  static const String resendOtpSeekers = "$baseUrl/auth/resend-otp";
  static const String resendOtpVerifySeekers = "$baseUrl/auth/verify-reset-password-otp";

  /// Forgot Password
  static const String forgotPassword = "$baseUrl/auth/forgot-password";
  static const String resetPassword = "$baseUrl/auth/reset-password";

  /// Login
  static const String login = "$baseUrl/auth/login";

  /// Change Password
  static const String changePassword = "$baseUrl/auth/change-password";

  /// DashBoard
  static const String dashboard = "$baseUrl/statistics/employee-dashboard";
  static const String getMyProfile = "$baseUrl/profiles/";


  /// Company and Contract
  static const String company = "$baseUrl/companies/create";
  static const String updateCompany = "$baseUrl/companies/update";
  static const String getMycompany = "$baseUrl/companies/my-company";
  static const String editProfile = "$baseUrl/users/update";
  static const String authMe = "$baseUrl/auth/me";
  static const String logo = "$baseUrl/companies/upload-logo";

  /// My Job Post
  static const String creatJob = "$baseUrl/jobs/create-job-post";
  static const String getMyJob = "$baseUrl/jobs/my-job-posts";
  static const String getUpdateJob = "$baseUrl/jobs/";
  static const String deleteJob = "$baseUrl/jobs/";

  /// Applied Jobs
  static const String getAppliedJobs = "$baseUrl/apply/my-candidates";
  static const String sendApplication = "$baseUrl/interviews/create-schedule";
  static const String regectedApplication = "$baseUrl/apply/";

  /// Job Seekers
  static const String recommendedJobs = "$baseUrl/jobs/recommended-jobs/";
  static const String updateProfile = "$baseUrl/users/update";
  static const String profileCreate = "$baseUrl/profiles/create";
  static const String jobApply = "$baseUrl/apply/apply-job";
  static const String saveJobs = "$baseUrl/save-jobs/save";
  static const String getSaveJobs = "$baseUrl/save-jobs";
  static String deleteSaveJobs(String id)  => "$baseUrl/save-jobs/delete/$id";
  static const String jobApplication = "$baseUrl/apply/my-applied-jobs";
  static const String getMyJobSeekerProfile = "$baseUrl/profiles/get-my-profile";
  static String updateResume(String id)  => "$baseUrl/profiles/resume/$id";
  static const String searchFilterData = "$baseUrl/jobs/search";
  static String singleJob(String id)  => "$baseUrl/jobs/$id";
  static const String allJobCategoriesFind = "$baseUrl/jobs/filters/all";
  static const String gmailLogin = "$baseUrl/auth/google-login";
  static const String rollSelected = "$baseUrl/auth/google-register-update-role";

}