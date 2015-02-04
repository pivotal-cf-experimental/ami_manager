module AmiManager
  class Destroyer
    def destroy(aws_access_key:, aws_secret_key:, ssh_key_name:, subnet_id:, security_group_id:)
      terraform.force_destroy(
        {
          aws_ami_id: nil,
          access_key: aws_access_key,
          secret_key: aws_secret_key,
          key_name: ssh_key_name,
          subnet_id: subnet_id,
          security_group_id: security_group_id,
        }
      )
    end

    private

    def terraform
      AmiManager::Terraform.new
    end
  end
end
