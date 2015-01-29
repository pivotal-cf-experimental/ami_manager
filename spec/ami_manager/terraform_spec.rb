require 'ami_manager/terraform'
require 'spec_helper'

module AmiManager
  describe Terraform do
    let(:terraform) { AmiManager::Terraform.new }
    let(:config_dir) { Terraform::CONFIG_DIR }

    describe 'configuration' do
      it 'invokes the terraform CLI with the correct config dir' do
        terraform_output = `terraform plan #{config_dir}`

        expect($?.exitstatus).to eq(1)
        expect(terraform_output).not_to match(/No Terraform configuration files found/)
        expect(terraform_output).to match(/Required variable not set/)
      end
    end

    describe '#apply' do
      context 'with vars' do
        let(:vars) { {some: 'var', another: 'var'} }

        it 'invokes `terraform apply` with the args as vars' do
          expect(terraform).to receive(:system).
              with("terraform apply -var 'some=var' -var 'another=var' #{config_dir}").
              and_return(true)

          terraform.apply(vars)
        end
      end

      context 'without vars' do
        let(:vars) { {} }
        it 'invokes `terraform apply`' do
          expect(terraform).to receive(:system).with("terraform apply #{config_dir}")

          terraform.apply(vars)
        end
      end
    end

    describe '#force_destroy' do
      context 'with vars' do
        let(:vars) { {some: 'var', another: 'var'} }

        it 'invokes `terraform destroy -force` with the args as vars' do
          expect(terraform).to receive(:system).
              with("terraform destroy -force -var 'some=var' -var 'another=var' #{config_dir}").
              and_return(true)

          terraform.force_destroy(vars)
        end
      end

      context 'without vars' do
        let(:vars) { {} }
        it 'invokes `terraform destroy -force`' do
          expect(terraform).to receive(:system).with("terraform destroy -force #{config_dir}")

          terraform.force_destroy(vars)
        end
      end
    end
  end
end
