require 'spec_helper'
require 'ami_manager/destroyer'
require 'ami_manager/terraform'

describe AmiManager::Destroyer do
  describe '#destroy' do
    let(:logger) { instance_double(Logger) }
    let(:ami_manager_destroyer) { AmiManager::Destroyer.new(logger) }
    let(:terraform) { instance_double(AmiManager::Terraform) }

    before { allow(AmiManager::Terraform).to receive(:new).and_return(terraform) }

    it 'deletes all the AWS resources, via Terraform' do
      expect(terraform).to receive(:force_destroy).with(
          {
            aws_ami_id: 'an-ami-id',
            access_key: 'an-access-key',
            secret_key: 'a-secret-key',
            key_name: 'a-key-name',
            key_path: 'a-key-path',
          }
        )

      ami_manager_destroyer.destroy(
        aws_ami_id: 'an-ami-id',
        aws_access_key: 'an-access-key',
        aws_secret_key: 'a-secret-key',
        ssh_key_name: 'a-key-name',
        ssh_key_path: 'a-key-path',
      )
    end
  end
end
