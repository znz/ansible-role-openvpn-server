require 'spec_helper'

describe package('openvpn') do
  it { should be_installed }
end

describe port(1194) do
  it { should be_listening.with('udp') }
end
