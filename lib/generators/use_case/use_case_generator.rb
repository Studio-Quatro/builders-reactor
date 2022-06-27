# frozen_string_literal: true

require 'fileutils'

# Generator for use cases.
class UseCaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :methods, type: :array, default: [], banner: 'method method ...'
  class_option :modules, type: :array, default: [], banner: 'module submodule subsubmodule ... '

  def create_use_case_file
    @modules = options[:modules]
    generator_folder = 'app/use_cases'
    specs_folder = 'spec/use_cases'
    use_spec_subfolder = ''
    @modules_path = ''
    @modules.each do |m|
      use_spec_subfolder += "/#{m}"
      @modules_path += "#{m.camelize}::"
    end

    class_generator_path = "#{generator_folder}#{use_spec_subfolder}/#{file_name}_use_case.rb"
    specs_generator_path = "#{specs_folder}#{use_spec_subfolder}/#{file_name}_use_case_spec.rb"
    FileUtils.mkpath(generator_folder) unless File.exist?(generator_folder)
    template('use_case_template.erb', class_generator_path)
    template('use_case_spec_template.erb', specs_generator_path)
  end
end