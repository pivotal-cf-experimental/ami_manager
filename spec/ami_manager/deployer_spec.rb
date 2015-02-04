require 'spec_helper'
require 'tempfile'

describe AmiManager::Deployer do
  describe '#deploy' do
    let(:ami_manager_deployer) { AmiManager::Deployer.new }

    let(:terraform) { instance_double(AmiManager::Terraform) }
    let(:ami_file) { Tempfile.open('ami') { |file| file.write('an-ami-id'); file } }
    let(:ami_file_path) { ami_file.path }

    before do
      allow(AmiManager::Terraform).to receive(:new).and_return(terraform)
      allow(terraform).to receive(:apply)
      allow(terraform).to receive(:output)
    end

    it 'deploys the AMI as an EC2 instance, via Terraform' do
      expect(terraform).to receive(:apply).with(
          {
            aws_ami_id: 'an-ami-id',
            access_key: 'an-access-key',
            secret_key: 'a-secret-key',
            key_name: 'a-key-name',
            subnet_id: 'a-subnet-id',
            security_group_id: 'a-security-group-id',
          }
        )

      ami_manager_deployer.deploy(ami_file_path, {
          aws_access_key: 'an-access-key',
          aws_secret_key: 'a-secret-key',
          ssh_key_name: 'a-key-name',
          subnet_id: 'a-subnet-id',
          security_group_id: 'a-security-group-id',
        }
      )
    end

    it 'calls Terraform#output to retrieve the instance IP' do
      expect(terraform).to receive(:output).with('ops_manager_ip').and_return('FAKE_INSTANCE_IP')

      expect(ami_manager_deployer.deploy(ami_file_path, {
            aws_access_key: 'an-access-key',
            aws_secret_key: 'a-secret-key',
            ssh_key_name: 'a-key-name',
            subnet_id: 'a-subnet-id',
            security_group_id: 'a-security-group-id',
          }
        )).to eq('FAKE_INSTANCE_IP')
    end
  end
end
