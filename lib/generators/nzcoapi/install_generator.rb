module Nzcoapi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates application.yml for your application"
      class_option :orm

      def copy_initializer
        template '../templates/application.yml', 'config/application.yml'
      end

    end
  end
end