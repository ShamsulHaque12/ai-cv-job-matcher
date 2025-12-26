import 'package:get/get.dart';

import '../features/auth/forgot_password_email_screen/bindings/auth_forgot_password_email_screen_binding.dart';
import '../features/auth/forgot_password_email_screen/views/auth_forgot_password_email_screen_view.dart';
import '../features/auth/forgot_password_otp_screen/bindings/auth_forgot_password_otp_screen_binding.dart';
import '../features/auth/forgot_password_otp_screen/views/auth_forgot_password_otp_screen_view.dart';
import '../features/auth/forgot_password_screen/bindings/auth_forgot_password_screen_binding.dart';
import '../features/auth/forgot_password_screen/views/auth_forgot_password_screen_view.dart';
import '../features/auth/gmail_sign_up_option/binding/gmail_sign_in_binding.dart';
import '../features/auth/gmail_sign_up_option/ui/gmail_sign_up_option.dart';
import '../features/auth/login_screen/bindings/auth_login_screen_binding.dart';
import '../features/auth/login_screen/views/auth_login_screen_view.dart';
import '../features/auth/sign_up_otp_verify/bindings/auth_sign_up_otp_verify_binding.dart';
import '../features/auth/sign_up_otp_verify/views/auth_sign_up_otp_verify_view.dart';
import '../features/auth/sign_up_screen/bindings/auth_sign_up_screen_binding.dart';
import '../features/auth/sign_up_screen/views/auth_sign_up_screen_view.dart';
import '../features/auth/upload_resume/bindings/auth_upload_resume_binding.dart';
import '../features/auth/upload_resume/views/auth_upload_resume_view.dart';
import '../features/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../features/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../features/choose_sign_up_option/bindings/choose_sign_up_option_binding.dart';
import '../features/choose_sign_up_option/views/choose_sign_up_option_view.dart';
import '../features/employer_auth/auth/company_information/bindings/employer_auth_company_information_binding.dart';
import '../features/employer_auth/auth/company_information/views/employer_auth_company_information_view.dart';
import '../features/employer_auth/auth/contact_information/bindings/employer_auth_contact_information_binding.dart';
import '../features/employer_auth/auth/contact_information/views/employer_auth_contact_information_view.dart';
import '../features/employer_auth/auth/enterprise_sign_up_screen/bindings/employer_auth_enterprise_sign_up_screen_binding.dart';
import '../features/employer_auth/auth/enterprise_sign_up_screen/views/employer_auth_enterprise_sign_up_screen_view.dart';
import '../features/employer_auth/auth/individual_sign_up_screen/bindings/employer_individual_sign_up_screen_binding.dart';
import '../features/employer_auth/auth/individual_sign_up_screen/views/employer_individual_sign_up_screen_view.dart';
import '../features/job_employer_home/add_new_vacancy/bindings/add_new_vacancy_binding.dart';
import '../features/job_employer_home/add_new_vacancy/views/add_new_vacancy_view.dart';
import '../features/job_employer_home/all_active_screen/bindings/all_active_screen_binding.dart';
import '../features/job_employer_home/all_active_screen/views/all_active_screen_view.dart';
import '../features/job_employer_home/all_inactive_screen/bindings/all_inactive_screen_binding.dart';
import '../features/job_employer_home/all_inactive_screen/views/all_inactive_screen_view.dart';
import '../features/job_employer_home/all_post_screen/bindings/all_post_screen_binding.dart';
import '../features/job_employer_home/all_post_screen/views/all_post_screen_view.dart';
import '../features/job_employer_home/applicatios_screen/bindings/applicatios_screen_binding.dart';
import '../features/job_employer_home/applicatios_screen/views/applicatios_screen_view.dart';
import '../features/job_employer_home/change_password/bindings/change_password_binding.dart';
import '../features/job_employer_home/change_password/views/change_password_view.dart';
import '../features/job_employer_home/creat_requirment_screen/bindings/creat_requirment_screen_binding.dart';
import '../features/job_employer_home/creat_requirment_screen/views/creat_requirment_screen_view.dart';
import '../features/job_employer_home/edit_employer_profile/bindings/edit_employer_profile_binding.dart';
import '../features/job_employer_home/edit_employer_profile/views/edit_employer_profile_view.dart';
import '../features/job_employer_home/edit_post_screen/bindings/edit_post_screen_binding.dart';
import '../features/job_employer_home/edit_post_screen/views/edit_post_screen_view.dart';
import '../features/job_employer_home/edit_requirment_screen/bindings/edit_requirment_screen_binding.dart';
import '../features/job_employer_home/edit_requirment_screen/views/edit_requirment_screen_view.dart';
import '../features/job_employer_home/employer_profile_screen/bindings/employer_profile_screen_binding.dart';
import '../features/job_employer_home/employer_profile_screen/views/employer_profile_screen_view.dart';
import '../features/job_employer_home/job_home_employer_screen/bindings/job_home_seker_screen_binding.dart';
import '../features/job_employer_home/job_home_employer_screen/views/job_home_seker_screen_view.dart';
import '../features/job_employer_home/join_membar_screen/bindings/join_membar_screen_binding.dart';
import '../features/job_employer_home/join_membar_screen/views/join_membar_screen_view.dart';
import '../features/job_employer_home/notification_screen/bindings/notification_screen_binding.dart';
import '../features/job_employer_home/notification_screen/views/notification_screen_view.dart';
import '../features/job_employer_home/resume_details_screen/bindings/resume_details_screen_binding.dart';
import '../features/job_employer_home/resume_details_screen/views/resume_details_screen_view.dart';
import '../features/job_employer_home/see_all_applied_post/bindings/see_all_applied_post_binding.dart';
import '../features/job_employer_home/see_all_applied_post/views/see_all_applied_post_view.dart';
import '../features/job_employer_home/see_all_my_job_screen/bindings/see_all_my_job_screen_binding.dart';
import '../features/job_employer_home/see_all_my_job_screen/views/see_all_my_job_screen_view.dart';
import '../features/job_employer_home/show_resume_screen/bindings/show_resume_screen_binding.dart';
import '../features/job_employer_home/show_resume_screen/views/show_resume_screen_view.dart';
import '../features/job_seekers/application_detail_screens/bindings/application_detail_screens_binding.dart';
import '../features/job_seekers/application_detail_screens/views/application_detail_screens_view.dart';
import '../features/job_seekers/bottom_navbar_screen/bindings/job_seekers_bottom_navbar_screen_binding.dart';
import '../features/job_seekers/bottom_navbar_screen/views/job_seekers_bottom_navbar_screen_view.dart';
import '../features/job_seekers/home_screen/bindings/job_seekers_home_screen_binding.dart';
import '../features/job_seekers/home_screen/views/job_seekers_home_screen_view.dart';
import '../features/job_seekers/job_filter_screen/bindings/job_seekers_job_filter_screen_binding.dart';
import '../features/job_seekers/job_filter_screen/views/job_seekers_job_filter_screen_view.dart';
import '../features/job_seekers/notification/bindings/job_seekers_notification_binding.dart';
import '../features/job_seekers/notification/views/job_seekers_notification_view.dart';
import '../features/job_seekers/search/bindings/job_seekers_search_binding.dart';
import '../features/job_seekers/search/views/job_seekers_search_view.dart';
import '../features/job_seekers/seekers_applications_screen/bindings/seekers_applications_screen_binding.dart';
import '../features/job_seekers/seekers_applications_screen/views/seekers_applications_screen_view.dart';
import '../features/job_seekers/seekers_apply_screen/bindings/seekers_apply_screen_binding.dart';
import '../features/job_seekers/seekers_apply_screen/views/seekers_apply_screen_view.dart';
import '../features/job_seekers/seekers_edit_profile_screen/bindings/seekers_edit_profile_screen_binding.dart';
import '../features/job_seekers/seekers_edit_profile_screen/views/seekers_edit_profile_screen_view.dart';
import '../features/job_seekers/seekers_job_details_screen/bindings/seekers_job_details_screen_binding.dart';
import '../features/job_seekers/seekers_job_details_screen/views/seekers_job_details_screen_view.dart';
import '../features/job_seekers/seekers_notification_screen/bindings/seekers_notification_screen_binding.dart';
import '../features/job_seekers/seekers_notification_screen/views/seekers_notification_screen_view.dart';
import '../features/job_seekers/seekers_profile_screen/bindings/seekers_profile_screen_binding.dart';
import '../features/job_seekers/seekers_profile_screen/views/seekers_profile_screen_view.dart';
import '../features/job_seekers/seekers_saved_jobs/bindings/seekers_saved_jobs_binding.dart';
import '../features/job_seekers/seekers_saved_jobs/views/seekers_saved_jobs_view.dart';
import '../features/job_seekers/tips_for_you/bindings/job_seekers_tips_for_you_binding.dart';
import '../features/job_seekers/tips_for_you/views/job_seekers_tips_for_you_view.dart';
import '../features/job_seekers/tips_for_you_description/bindings/job_seekers_tips_for_you_description_binding.dart';
import '../features/job_seekers/tips_for_you_description/views/job_seekers_tips_for_you_description_view.dart';
import '../features/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../features/onboarding_screen/views/onboarding_screen_view.dart';
import '../features/sign_up_Option/bindings/sign_up_option_binding.dart';
import '../features/sign_up_Option/views/sign_up_option_view.dart';
import '../features/splash_screen/bindings/splash_screen_binding.dart';
import '../features/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_LOGIN_SCREEN,
      page: () => AuthLoginScreenView(),
      binding: AuthLoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SIGN_UP_SCREEN,
      page: () => const AuthSignUpScreenView(),
      binding: AuthSignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_OPTION,
      page: () => const SignUpOptionView(),
      binding: SignUpOptionBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_SIGN_UP_OPTION,
      page: () => const ChooseSignUpOptionView(),
      binding: ChooseSignUpOptionBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SIGN_UP_OTP_VERIFY,
      page: () => AuthSignUpOtpVerifyView(),
      binding: AuthSignUpOtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_UPLOAD_RESUME,
      page: () => const AuthUploadResumeView(),
      binding: AuthUploadResumeBinding(),
    ),
    GetPage(
      name: _Paths.JOB_EMPLOYER_NOTIFICATION_SCREEN,
      page: () => const NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOB_HOME_EMPLOYER_SCREEN,
      page: () => JobHomeSekerScreenView(),
      binding: JobSekerJobHomeSekerScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEE_ALL_MY_JOB_SCREEN,
      page: () => SeeAllMyJobScreenView(),
      binding: SeeAllMyJobScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEE_ALL_APPLIED_POST,
      page: () => SeeAllAppliedPostView(),
      binding: SeeAllAppliedPostBinding(),
    ),
    GetPage(
      name: _Paths.APPLICATIOS_SCREEN,
      page: () => ApplicatiosScreenView(),
      binding: ApplicatiosScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_VACANCY,
      page: () => AddNewVacancyView(),
      binding: AddNewVacancyBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGOT_PASSWORD_EMAIL_SCREEN,
      page: () => const AuthForgotPasswordEmailScreenView(),
      binding: AuthForgotPasswordEmailScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGOT_PASSWORD_OTP_SCREEN,
      page: () => AuthForgotPasswordOtpScreenView(),
      binding: AuthForgotPasswordOtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGOT_PASSWORD_SCREEN,
      page: () => AuthForgotPasswordScreenView(),
      binding: AuthForgotPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREAT_REQUIRMENT_SCREEN,
      page: () => CreatRequirmentScreenView(),
      binding: CreatRequirmentScreenBinding(),
    ),
    GetPage(
      name: _Paths.ALL_POST_SCREEN,
      page: () => AllPostScreenView(),
      binding: AllPostScreenBinding(),
    ),
    GetPage(
      name: _Paths.ALL_ACTIVE_SCREEN,
      page: () => AllActiveScreenView(),
      binding: AllActiveScreenBinding(),
    ),
    GetPage(
      name: _Paths.ALL_INACTIVE_SCREEN,
      page: () => AllInactiveScreenView(),
      binding: AllInactiveScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_POST_SCREEN,
      page: () => EditPostScreenView(),
      binding: EditPostScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_REQUIRMENT_SCREEN,
      page: () => EditRequirmentScreenView(),
      binding: EditRequirmentScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOIN_MEMBAR_SCREEN,
      page: () => JoinMembarScreenView(),
      binding: JoinMembarScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_INDIVIDUAL_SIGN_UP_SCREEN,
      page: () => EmployerIndividualSignUpScreenView(),
      binding: EmployerIndividualSignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_AUTH_ENTERPRISE_SIGN_UP_SCREEN,
      page: () => EmployerAuthEnterpriseSignUpScreenView(),
      binding: EmployerAuthEnterpriseSignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_AUTH_COMPANY_INFORMATION,
      page: () => EmployerAuthCompanyInformationView(),
      binding: EmployerAuthCompanyInformationBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_AUTH_CONTACT_INFORMATION,
      page: () => EmployerAuthContactInformationView(),
      binding: EmployerAuthContactInformationBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_RESUME_SCREEN,
      page: () => ShowResumeScreenView(),
      binding: ShowResumeScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESUME_DETAILS_SCREEN,
      page: () => ResumeDetailsScreenView(),
      binding: ResumeDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_HOME_SCREEN,
      page: () => JobSeekersHomeScreenView(),
      binding: JobSeekersHomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN,
      page: () => const JobSeekersBottomNavbarScreenView(),
      binding: JobSeekersBottomNavbarScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_PROFILE_SCREEN,
      page: () => EmployerProfileScreenView(),
      binding: EmployerProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMPLOYER_PROFILE,
      page: () => EditEmployerProfileView(),
      binding: EditEmployerProfileBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_NOTIFICATION,
      page: () => const JobSeekersNotificationView(),
      binding: JobSeekersNotificationBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_SEARCH,
      page: () => JobSeekersSearchView(),
      binding: JobSeekersSearchBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_JOB_FILTER_SCREEN,
      page: () => JobFilterView(),
      binding: JobSeekersJobFilterScreenBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_TIPS_FOR_YOU,
      page: () => const JobSeekersTipsForYouView(),
      binding: JobSeekersTipsForYouBinding(),
    ),
    GetPage(
      name: _Paths.JOB_SEEKERS_TIPS_FOR_YOU_DESCRIPTION,
      page: () => const JobSeekersTipsForYouDescriptionView(),
      binding: JobSeekersTipsForYouDescriptionBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_APPLICATIONS_SCREEN,
      page: () => SeekersApplicationsScreenView(),
      binding: SeekersApplicationsScreenBinding(),
    ),
    GetPage(
      name: _Paths.APPLICATION_DETAIL_SCREENS,
      page: () => ApplicationDetailScreensView(),
      binding: ApplicationDetailScreensBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_PROFILE_SCREEN,
      page: () => SeekersProfileScreenView(),
      binding: SeekersProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_EDIT_PROFILE_SCREEN,
      page: () => SeekersEditProfileScreenView(),
      binding: SeekersEditProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_SAVED_JOBS,
      page: () => SeekersSavedJobsView(),
      binding: SeekersSavedJobsBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_NOTIFICATION_SCREEN,
      page: () => SeekersNotificationScreenView(),
      binding: SeekersNotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_JOB_DETAILS_SCREEN,
      page: () => SeekersJobDetailsScreenView(),
      binding: SeekersJobDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEEKERS_APPLY_SCREEN,
      page: () => SeekersApplyScreenView(),
      binding: SeekersApplyScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.GMAIL_SIGNIN_OPTION,
      page: () => GmailSignUpOptionView(),
      binding: GmailSignInBinding(),
    ),
  ];
}
