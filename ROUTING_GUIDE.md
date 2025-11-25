# GetX Routing System Guide

## Overview
This project uses GetX for state management and routing with a centralized, maintainable architecture.

## Structure

### Core Routing Files
- **`lib/src/routes/app_routes.dart`** - Route constants and paths
- **`lib/src/routes/app_pages.dart`** - Page configurations with bindings
- **`lib/src/routes/route_manager.dart`** - Navigation utility methods
- **`lib/src/routes/middleware/`** - Route middleware for authentication, etc.

### Feature-Based Organization
Each feature has its own:
- **`presentation/pages/`** - UI screens
- **presentation/controllers/`** - GetX controllers
- **presentation/bindings/`** - Dependency injection bindings

## Available Routes

| Route | Path | Description |
|-------|------|-------------|
| Splash | `/splash` | App loading screen |
| Auth | `/auth` | Login/authentication |
| Home | `/home` | Main app screen |
| Profile | `/profile` | User profile |
| Settings | `/settings` | App settings |
| Unknown | `/unknown` | 404 page |

## Navigation Methods

### Using RouteManager
```dart
// Navigate to different screens
RouteManager.navigateToHome();
RouteManager.navigateToProfile();
RouteManager.navigateToSettings();

// Go back
RouteManager.goBack();

// Replace current route
RouteManager.replaceWith('/auth');

// Clear stack and navigate
RouteManager.offAllTo('/home');
```

### Using GetX Directly
```dart
// Navigate with named routes
Get.toNamed('/profile');
Get.offNamed('/home');
Get.offAllNamed('/auth');

// Navigate with transition
Get.to(() => ProfilePage(), transition: Transition.rightToLeft);

// Show dialogs and snackbars
RouteManager.showSnackbar('Title', 'Message');
RouteManager.showDialog('Title', 'Content');
```

## Controllers and Bindings

### Example: Auth Feature
```dart
// Binding
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

// Controller
class AuthController extends GetxController {
  final isLoggedIn = false.obs;
  
  void login() {
    isLoggedIn.value = true;
    Get.offAllNamed('/home');
  }
}
```

## Middleware

### Authentication Middleware
```dart
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Add authentication logic here
    return null; // Allow access
  }
}
```

## Usage in Pages

### Accessing Controllers
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    
    return Obx(() => Text(controller.userName.value));
  }
}
```

### Navigation from UI
```dart
ElevatedButton(
  onPressed: () => Get.toNamed('/profile'),
  child: Text('Go to Profile'),
)
```

## Best Practices

1. **Use RouteManager** for consistent navigation methods
2. **Keep routes centralized** in `app_pages.dart`
3. **Use bindings** for dependency injection
4. **Implement proper error handling** with unknown routes
5. **Use transitions** for smooth navigation experience
6. **Maintain route constants** in `app_routes.dart`

## Adding New Routes

1. Add route constant to `app_routes.dart`
2. Create page in appropriate feature folder
3. Create controller and binding
4. Add GetPage configuration to `app_pages.dart`
5. Add navigation methods to `route_manager.dart`

## Features Included

- ✅ Centralized route management
- ✅ Dependency injection with bindings
- ✅ Smooth transitions between screens
- ✅ Authentication middleware support
- ✅ Error handling with 404 page
- ✅ Theme switching (light/dark)
- ✅ Responsive UI components
- ✅ State management with GetX
