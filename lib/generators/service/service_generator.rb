# frozen_string_literal: true

require 'fileutils'

# Generator for use cases.
class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :methods, type: :array, default: [], banner: 'method method ...'
  class_option :modules, type: :array, default: [], banner: 'module submodule subsubmodule ... '

  def create_use_case_file
    @modules = options[:modules]
    generator_folder = 'app/services'
    specs_folder = 'spec/services'
    use_spec_subfolder = ''
    @modules_path = ''
    @modules.each do |m|
      use_spec_subfolder += "/#{m}"
      @modules_path += "#{m.camelize}::"
    end

    class_generator_path = "#{generator_folder}#{use_spec_subfolder}/#{file_name}.rb"
    specs_generator_path = "#{specs_folder}#{use_spec_subfolder}/#{file_name}_spec.rb"
    FileUtils.mkdir_p(generator_folder)
    template('service_template.erb', class_generator_path)
    template('service_spec_template.erb', specs_generator_path)
  end
end
