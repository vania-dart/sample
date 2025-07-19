import 'package:vania/authentication.dart';
import 'package:vania/http/controller.dart';
import 'package:vania/http/request.dart';
import 'package:vania/http/response.dart';
import 'package:vania/vania.dart';
import 'package:vania_template_project/app/models/user.dart';

class AuthController extends Controller {
  Future<Response> login(Request request) async {
    // 1. Validate input fields (email and password)
    await request.validate({
      'email': 'required|email',
      'password': 'required|min_length:8'
    }, {
      'email.required': 'Email is required.',
      'email.email': 'Email is invalid.',
      'password.email': 'Password is required.',
      'password.min_length': 'Password must be at least 8 characters long',
    });

    // 2. Extract email and password from the request
    String email = request.string('email');
    String password = request.string('password');

    // 3. Look up the user by email
    final user = await User()
        .query
        .whereEqualTo('email', email)
        .first();

    // 4. If no user found or password doesn't match, return 400
    if (user == null) {
      return Response.json({'messages': 'Invalid credentials'}, 400);
    }
    if (!Hash().verify(password, user['password'])) {
      return Response.json({'messages': 'Invalid credentials'}, 400);
    }

    // 5.Delete old tokens and Generate a new `JWT` access token (expires in 30 days) + a refresh token
    await Auth().deleteTokens(user['id']);
    user.remove('password');
    final token = await Auth().login(user).createToken(
          expiresIn: Duration(days: 30),
          withRefreshToken: true,
        );

    // 6. Include user data in the response
    token['user'] = user;

    // 7. Return the token payload as JSON
    return Response.json(token);
  }

  // Custom validation rule to ensure the email address is unique.
  CustomValidationRule customValidationRule() {
    return CustomValidationRule(
        ruleName: 'unique_email',
        message: 'This email already exists.',
        fn: (
          Map<String, dynamic> data,
          dynamic email,
          String? arguments,
        ) async {
          // Look up a user by the provided email.
          final user = await User()
              .query
              .select(['email'])
              .whereEqualTo('email', email)
              .first();
          // Return true if no user was found (validation passes);
          // false if a user exists (validation fails and shows the message).
          return user == null;
        });
  }

  Future<Response> register(Request request) async {
    // 1. Register the custom rule and validate input fields.
    await request.setCustomRule([customValidationRule()]).validate({
      'email': 'required|email|unique_email',
      'password': 'required|min_length:8'
    }, {
      'email.required': 'Email is required.',
      'email.email': 'Email is invalid.',
      'password.email': 'Password is required.',
      'password.min_length': 'Password must be at least 8 characters long',
    });

    // 2. Extract email and password from the request.
    String email = request.string('email');
    String password = request.string('password');

    // 3. Hash the password before storing.
    String hashedPassword = Hash().make(password);

    // 4. Create the new user record.
    final user =
        await User().query.create({'email': email, 'password': hashedPassword});

    // 5. Generate a JWT access token (expires in 30 days) with a refresh token.
    final token = await Auth().login(user).createToken(
          expiresIn: Duration(days: 30),
          withRefreshToken: true,
        );

    // 6. Attach the user data to the token payload.
    token['user'] = user;

    // 7. Return the token (and user) as a JSON response.
    return Response.json(token);
  }
}

final AuthController authController = AuthController();
