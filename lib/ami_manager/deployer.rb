module AmiManager
  class Deployer
    def deploy(ami_file, aws_access_key:, aws_secret_key:, ssh_key_name:, subnet_id:, security_group_id:)
      aws_ami_id = File.read(ami_file).strip
      terraform.apply(
        {
          aws_ami_id: aws_ami_id,
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
