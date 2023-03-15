class Api {
  /// api config
  static const String _protocol = "https://";
  static const String _domain = "barber.amarsolution.com/";
  static const String _apiEndPath = "api/";
  static const String _apiVersion = "v1/";

  static const String _baseUrl = '$_protocol$_domain$_apiEndPath$_apiVersion';

  static String getImageURL(endPoint) => '$_protocol$_domain$endPoint';

  static String get login => '${_baseUrl}login';
  static String get register => '${_baseUrl}register';
  static String get logout => '${_baseUrl}logout';
  static String get deleteAccount => '${_baseUrl}parmanently-delete-account';
  static String get changePassword => '${_baseUrl}reset-password';
  static String get getUser => '${_baseUrl}user';
  static String get updateUserProfile => '${_baseUrl}profile-update';
  static String get holidays => '${_baseUrl}holidays';
  static String get getCountryCodeList => '${_baseUrl}countries';

  static String get addCustomer => '${_baseUrl}customer/store';
  static String get customerList => '${_baseUrl}customer/index';
  static String get customerListLite => '${_baseUrl}customer/index/lite';

  static String get forgotPassword => '${_baseUrl}forgot-password';
  static String get forgotPasswordUpdate => '${_baseUrl}forgot-password-update';

  static String get sliderList => '${_baseUrl}slider-list';
  static String get serviceList => '${_baseUrl}service-list';
  static String get newsList => '${_baseUrl}news-list';
  static String get shopDetails => '${_baseUrl}shop-details';
  static String get barberList => '${_baseUrl}barber-list';
  static String get timeSlotList => '${_baseUrl}time-slot-list';

  static String get bookAppointment => '${_baseUrl}customer/appointment/store';
  static String get appointmentList => '${_baseUrl}customer/appointment/index';
  static String get changeAppointmentStatus =>
      '${_baseUrl}customer/appointment/status-change';

  static String get barberAppointmentList =>
      '${_baseUrl}barber/appointment/index';
  static String get changeBarberAppointmentStatus =>
      '${_baseUrl}barber/appointment/status-change';
  static String get bookAppointmentForBarber =>
      '${_baseUrl}barber/appointment/store';

  static String get adminAppointmentList =>
      '${_baseUrl}admin/appointment/index';
  static String get changeAdminAppointmentStatus =>
      '${_baseUrl}admin/appointment/status-change';

  static String get remainder => '${_baseUrl}admin/reminder/appointments';
  static String get bookAppointmentForAdmin =>
      '${_baseUrl}admin/appointment/store';
}
