# this class make requests to WB api
# now implemented only orders request
# TODO: implement other requests to api
class WbApiService
  class ErrorResponse < StandardError; end
  
  class << self
    def orders(params = {})
      request(path: 'supplier/orders', **params)
    end

    private

    def request(path: nil, **params)
      conn = Connection.new.init
      response = conn.get(path) do |req|
        req.params.merge!(params)
      end

      # TODO: Add handle http status codes

      check_response(response.body)
      response.body
    end

    def check_response(res)
      return if res.is_a? Array
      raise ErrorResponse, res['errors'].first, 'Ошибка при выполнении запроса к апи ВБ' if res['errors']
    end
  end
end