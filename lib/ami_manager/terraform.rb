require 'ami_manager'

module AmiManager
  class Terraform
    CONFIG_DIR = File.join(AmiManager::ROOT, 'config', 'terraform')

    def apply(vars)
      command_string = [
        'terraform apply',
        vars_to_string(vars),
        CONFIG_DIR
      ].compact.join(' ')

      system(command_string)
    end

    def force_destroy(vars)
      command_string = [
        'terraform destroy -force',
        vars_to_string(vars),
        CONFIG_DIR
      ].compact.join(' ')

      system(command_string)
    end

    private

    def vars_to_string(vars)
      vars.empty? ? nil : vars.map { |k,v| "-var '#{k}=#{v}'"}.join(' ')
    end
  end
end
