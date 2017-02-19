class Api::V1::IpAddressesService
  
  def self.used_ip_addresses
    Post.all.includes(:user).group_by(&:author_ip).map do |ip, posts|
      { ip => posts.map { |post| post.user.login } }
    end
  end
end
