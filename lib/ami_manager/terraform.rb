module AmiManager
  class Terraform
    CONFIG_DIR = File.join(AmiManager::ROOT, 'config', 'terraform')

    def apply(vars)
      command_string =
        terraform_command('apply', vars)

      system(command_string)
    end

    def output(variable_name)
      command_string =
        terraform_command("output #{variable_name}", [])

      `#{command_string}`.strip
    end

    def force_destroy(vars)
      command_string =
        terraform_command('destroy -force', vars)

      system(command_string)
    end

    private

    def vars_to_string(vars)
      vars.empty? ? nil : vars.map { |k, v| "-var '#{k}=#{v}'" }.join(' ')
    end

    def terraform_command(command, vars)
      [
        'terraform',
        command,
        vars_to_string(vars),
        CONFIG_DIR
      ].compact.join(' ')
    end
  end
end
