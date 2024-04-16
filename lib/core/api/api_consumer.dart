abstract class ApiConsumer {

  Future <dynamic> get(String path,
      {
        Object? data,
        Map<String, dynamic> queryParams,

      });

  Future <dynamic> post(String path,
      {
        dynamic data,
        Map<String, dynamic> queryParams,
        bool isFormData = false,

      });

  Future <dynamic> patch(String path,
      {
        dynamic data,
        Map<String, dynamic> queryParams,
        bool isFormData = false,


      });

  Future <dynamic> delete(String path,
      {
        dynamic data,
        Map<String, dynamic> queryParams,
        bool isFormData = false,


      });
}