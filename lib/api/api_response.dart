import 'package:movies/api/api_status.dart';

//Para manejar los estados en mi Bloc
class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }


//Con este manejo para ver que me devolvio la API cuando hago un POST, UPDATE o DELETE.

  // static validateResponse({
  //   BuildContext? context,
  //   String? responseSystemErrorMessage,
  //   String? responseSuccessMessage,
  //   String? error400Message,
  //   Function? navigationWhenSuccess,
  //   dynamic response,
  // }) {
  //   if (response != ConnectivityResult.none) {
  //     switch (response.statusCode) {
  //       case 200:
  //         return MessagesDialogs.successMesssage(
  //           context,
  //           responseSuccessMessage,
  //           navigationWhenSuccess,
  //         );
  //         break;
  //       case 201:
  //         return MessagesDialogs.successMesssage(
  //           context,
  //           responseSuccessMessage,
  //           navigationWhenSuccess,
  //         );
  //         break;
  //       case 400:
  //         if (error400Message.isEmpty) {
  //           response = jsonDecode(response.body);
  //           error400Message = response['msg'];
  //         }
  //         Modular.to.pop();
  //         return MessagesDialogs.warningMessage(
  //           context,
  //           description: error400Message,
  //         );
  //         break;
  //       case 404:
  //         MessagesDialogs.errorMesssage(
  //           context,
  //           message: S.of(context).notFound,
  //           onTap: () {
  //             Modular.to.pop();
  //             Modular.to.pop();
  //           },
  //         );
  //         break;
  //       case 500:
  //         return MessagesDialogs.errorMesssage(
  //           context,
  //           message: responseSystemErrorMessage,
  //           onTap: () {
  //             Modular.to.pop();
  //             Modular.to.pop();
  //           },
  //         );
  //         break;
  //     }
  //   } else {
  //     return MessagesDialogs.errorMesssage(
  //       context,
  //       message: S.of(context).unableToCompleteYourRequest,
  //       onTap: () {
  //         Modular.to.pop();
  //         Modular.to.pop();
  //       },
  //     );
  //   }
  // }
}
