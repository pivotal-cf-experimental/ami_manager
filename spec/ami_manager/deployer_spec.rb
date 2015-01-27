require 'spec_helper'
require 'ami_manager/deployer'

describe AmiManager::Deployer do
  describe '#deploy' do
    it 'responds to it' do
      AmiManager::Deployer.new.deploy
    end
  end
end
