import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Add your authentication logic here
    // For now, we'll allow all routes
    return null;
  }
  
  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }
}
