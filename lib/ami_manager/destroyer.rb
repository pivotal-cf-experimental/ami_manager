require 'logger'

module AmiManager
  class Destroyer
    def initialize(logger)
      @logger = logger
    end

    def destroy(aws_ami_id:, aws_access_key:, aws_secret_key:, ssh_key_path:, ssh_key_name:)
      terraform.force_destroy(
        {
          aws_ami_id: aws_ami_id,
          access_key: aws_access_key,
          secret_key: aws_secret_key,
          key_name: ssh_key_name,
          key_path: ssh_key_path,
        }
      )
    end

    private

    attr_reader :logger

    def terraform
      AmiManager::Terraform.new
    end
  end
end
