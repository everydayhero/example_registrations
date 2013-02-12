module FundraiserClient
  class Connection
    def initialize config
      @config = config
    end

    def schemes
      {'http' => NonSSL, 'https' => SSL}
    end

    def http
      @http ||= schemes.fetch(@config.base_uri.scheme).new @config.base_uri
    end

    def post url, payload = {}
      net_http = Net::HTTP::Post.new build_uri(url)
      net_http.body         = payload.to_json
      net_http.content_type = 'application/x-www-form-urlencoded'
      request net_http
    end

    def get url, params = {}
      net_http = Net::HTTP::Get.new build_uri(url, params)
      request net_http
    end

    private

    def build_uri url, params = {}
      endpoint = "/api/#{@config.version}"
      endpoint += url
      endpoint += "?#{params.to_query}" if params.any?
      endpoint
    end

    def request resource
      resource['User-Agent']    = 'Fundraiser Ruby Client'
      resource['Authorization'] = "Token token=#{@config.token}"
      resource.content_type     ||= 'application/json'
      parse http.request(resource)
    end

    def parse response
      ActiveSupport::JSON.decode response.body
    rescue ActiveSupport::JSON.parse_error
      {}
    end

    class NonSSL
      def initialize uri
        @uri = uri
      end

      def http
        @http ||= Net::HTTP.new @uri.host, @uri.port
      end

      def request resource
        http.request resource
      end
    end

    class SSL < NonSSL
      def http
        @http ||= begin
          http = Net::HTTP.new @uri.host, @uri.port
          http.use_ssl     = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          http
        end
      end
    end
  end
end
