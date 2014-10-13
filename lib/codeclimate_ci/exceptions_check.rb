module CodeclimateCi
  class ExceptionsCheck
    attr_accessor :api_requester, :branch_name

    def initialize(options)
      @api_requester = options[:api_requester]
      @branch_name = options[:branch_name]
    end

    def perform
      check_if_invalid_credentials!
      check_if_branch_not_found!
    end

    private

    def branch_gpa
      GetGpa.new(api_requester, branch_name)
    end

    def check_if_invalid_credentials!
      return if api_requester.connection_established?
      Report.invalid_credentials
      exit(1)
    end

    def check_if_branch_not_found!
      return unless branch_gpa.not_found?
      Report.branch_not_found(branch_name)
      exit(1)
    end
  end
end
