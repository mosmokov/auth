import 'package:auth/models/response_model.dart';
import 'package:conduit/conduit.dart';

import '../models/user.dart';

class AppAuthController extends ResourceController {
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);

  @Operation.post()
  Future<Response> signIn(@Bind.body() User user) async {
    if (user.password == null || user.username == null) {
      return Response.badRequest(
          body: ResponseModel(
              message: "Fields password and username are required"));
    }

    final User fetchedUser = User();
    // Connect to DB
    // Find User
    // check password
    // fetch user data

    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    }, message: "Successful autorization")
        .toJson());
  }

  @Operation.put()
  Future<Response> signUp(@Bind.body() User user) async {
    if (user.password == null || user.username == null || user.email == null) {
      return Response.badRequest(
          body: ResponseModel(
              message: "Fields password and username and email are required"));
    }

    final User fetchedUser = User();
    // Connect to DB
    // Create User
    // fetch user data

    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    }, message: "Successful registration")
        .toJson());
  }

  @Operation.post("refresh")
  Future<Response> refreshToken(
      @Bind.path("refresh") String refreshToken) async {
    final User fetchedUser = User();

    // connect to DB
    // find user
    // check token
    // fetch user

    return Response.ok(ResponseModel(data: {
      "id": fetchedUser.id,
      "refreshToken": fetchedUser.refreshToken,
      "accessToken": fetchedUser.accessToken,
    }, message: "The token has been successfully updated")
        .toJson());
  }
}
