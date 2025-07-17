enum RouteNames {
  splash,
  login,
  signup,
  home,
  menu,
  error,
  forgetPassword,
  appointment,
  guestAppointment,
  successAppointment,
  successAppointmentStatfulShell,
  profile,
  onBoarding
}

extension AppPageExtension on RouteNames {
  String get toPath {
    switch (this) {
      case RouteNames.home:
        return "/a";
      case RouteNames.login:
        return "/login";
      case RouteNames.signup:
        return "/signup";
      case RouteNames.splash:
        return "/splash";
      case RouteNames.menu:
        return "/menu";
      case RouteNames.error:
        return "/error";
      case RouteNames.onBoarding:
        return "/start";
      case RouteNames.profile:
        return "/profile";
      case RouteNames.appointment:
        return "/appointment";
      case RouteNames.guestAppointment:
        return "/guestAppointment";
      case RouteNames.successAppointment:
        return "/successAppointment";
      case RouteNames.successAppointmentStatfulShell:
        return "/b/successAppointment";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case RouteNames.home:
        return "home";
      case RouteNames.login:
        return "login";
      case RouteNames.signup:
        return "signup";
      case RouteNames.splash:
        return "splash";
      case RouteNames.menu:
        return "menu";
      case RouteNames.error:
        return "error";
      case RouteNames.onBoarding:
        return "start";
      case RouteNames.profile:
        return "profile";
      case RouteNames.appointment:
        return "appointment";
      case RouteNames.guestAppointment:
        return "guestAppointment";
      case RouteNames.successAppointment:
        return "successAppointment";
      default:
        return "home";
    }
  }

  String get toTitle {
    switch (this) {
      case RouteNames.home:
        return "My App";
      case RouteNames.login:
        return "My App Log In";
      case RouteNames.signup:
        return "Sign up";
      case RouteNames.splash:
        return "My App Splash";
      case RouteNames.error:
        return "My App Error";
      case RouteNames.onBoarding:
        return "Welcome to My App";
      default:
        return "My App";
    } 
  }
}