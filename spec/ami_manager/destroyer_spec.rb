require 'spec_helper'

describe AmiManager::Destroyer do
  describe '#destroy' do
    let(:ami_manager_destroyer) { AmiManager::Destroyer.new }
    let(:terraform) { instance_double(AmiManager::Terraform) }

    before { allow(AmiManager::Terraform).to receive(:new).and_return(terraform) }

    it 'deletes all the AWS resources, via Terraform' do
      expect(terraform).to receive(:force_destroy).with(
          {
            aws_ami_id: nil,
            access_key: 'an-access-key',
            secret_key: 'a-secret-key',
            key_name: 'a-key-name',
          }
        )

      ami_manager_destroyer.destroy(
        aws_access_key: 'an-access-key',
        aws_secret_key: 'a-secret-key',
        ssh_key_name: 'a-key-name',
      )
    end
  end
end
