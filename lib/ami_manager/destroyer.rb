module AmiManager
  class Destroyer
    def destroy(aws_access_key:, aws_secret_key:, ssh_key_path:, ssh_key_name:)
      terraform.force_destroy(
        {
          aws_ami_id: nil,
          access_key: aws_access_key,
          secret_key: aws_secret_key,
          key_name: ssh_key_name,
          key_path: ssh_key_path,
        }
      )
    end

    private

    def terraform
      AmiManager::Terraform.new
    end
  end
end
