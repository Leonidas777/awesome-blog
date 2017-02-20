class Api::V1::UserIpAddressesController < Api::V1::BaseController

  def index
    @ip_addresses = Api::V1::IpAddressesService.used_ip_addresses

    render 'api/v1/user_ip_addresses/index', status: 200
  end
end
