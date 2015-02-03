module AmiManager
  ROOT = File.expand_path(File.join(__dir__, '..')).freeze
end

require 'ami_manager/deployer'
require 'ami_manager/destroyer'
require 'ami_manager/terraform'
