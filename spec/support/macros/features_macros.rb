module Macros
  module FeaturesMacros
    extend ActiveSupport::Concern

    def expect_have_provider_with_requests(provider, requests = nil)
      expect_have_provider(provider)

      requests ||= provider.requests
      requests.each { |request| expect_have_request(request) }
    end

    def expect_have_provider(provider)
      expect(page).to have_content(provider.name)
      expect(page).to have_content(provider.text)
    end

    def expect_have_request(request)
      expect(page).to have_content("#{request.user.email} requested")
      expect(page).to have_content(request.text)
    end
  end
end

