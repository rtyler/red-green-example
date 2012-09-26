require 'spec_helper'

describe 'apache' do
  it { should contain_package('apache2') }
  it {
    should contain_service('apache2').with(
      'ensure'  => 'running',
      'require' => 'Package[apache2]'
    )
  }
end
