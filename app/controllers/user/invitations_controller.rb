class User::InvitationsController < Devise::InvitationsController
  prepend_before_action :change_schema, only: [:edit]

  private

    def change_schema
      Apartment::Tenant.switch!(request.subdomain)
    end

end