require 'spec_helper'
require 'ami_manager/deployer'
require 'ami_manager/terraform'

describe AmiManager::Deployer do
  describe '#deploy' do
    let(:logger) { instance_double(Logger) }
    let(:ami_manager_deployer) { AmiManager::Deployer.new(logger) }
    let(:terraform) { instance_double(AmiManager::Terraform) }

    before { allow(AmiManager::Terraform).to receive(:new).and_return(terraform) }

    it 'deploys the AMI as an EC2 instance, via Terraform' do
      expect(terraform).to receive(:apply).with(
          {
            aws_ami_id: 'an-ami-id',
            access_key: 'an-access-key',
            secret_key: 'a-secret-key',
            key_name: 'a-key-name',
            key_path: 'a-key-path',
          }
        )

      ami_manager_deployer.deploy(
        aws_ami_id: 'an-ami-id',
        aws_access_key: 'an-access-key',
        aws_secret_key: 'a-secret-key',
        ssh_key_name: 'a-key-name',
        ssh_key_path: 'a-key-path',
      )
    end
  end
end
