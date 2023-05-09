import 'package:auth/models/response_model.dart';
import 'package:conduit/conduit.dart';

class AppAuthController extends ResourceController{
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);


  @Operation.post()
  Future<Response> signIn() async {
    return Response.ok(ResponseModel(
      data: {
      "id":"1",
      "refreshToken":"refreshToken",
      "accessToken":"accessToken",
    },
      message: "signIn Ok"
    ).toJson());
  }

  @Operation.put()
    Future<Response> signUp() async {
    return Response.ok(ResponseModel(
      data: {
      "id":"1",
      "refreshToken":"refreshToken",
      "accessToken":"accessToken",
    },
      message: "signUp Ok"
    ).toJson());
  }

  @Operation.post("refresh")
    Future<Response> refresh() async {
    return Response.unauthorized(
      body: ResponseModel(error: "token is not valid").toJson());
  }
}