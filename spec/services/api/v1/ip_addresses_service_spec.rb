require 'rails_helper'

describe Api::V1::IpAddressesService do

  Given { @user_1 = create :user, login: 'michael' }
  Given { @user_2 = create :user, login: 'john' }
  Given { @user_3 = create :user, login: 'sara' }

  Given { @post_1 = create :post, user: @user_1, author_ip: '111.111.111.11' }
  Given { @post_2 = create :post, user: @user_2, author_ip: '222.222.222.22' }
  Given { @post_3 = create :post, user: @user_2, author_ip: '111.111.111.11' }
  Given { @post_4 = create :post, user: @user_3, author_ip: '111.111.111.11' }
  Given { @post_5 = create :post, user: @user_2, author_ip: '333.333.333.33' }
  Given { @post_5 = create :post, user: @user_3, author_ip: '333.333.333.33' }

  context 'when get all the ip addresses and appropriate users used them' do
    Then { expect(described_class.used_ip_addresses).to eq([{ '111.111.111.11' => ['michael', 'john', 'sara'] },
                                                            { '222.222.222.22' => ['john'] },
                                                            { '333.333.333.33' => ['john', 'sara'] }]) }
  end
end
