class Api::V1::UserIpAddressesController < Api::V1::BaseController
  
  def index
    @ip_addresses = Api::V1::IpAddressesService.used_ip_addresses
  end

end
