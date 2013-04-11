require 'rails/generators/active_record'

module ApiBootstraper
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Api Bootstraper and generates the necessary migrations"
      # argument :name, :type => :string, :default => "User"

      hook_for :users, :default => "devise", :desc => "User generator to run. Skip with --skip-users"

      def self.source_root
        @_api_bootstraper_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def copy_initializer
        @underscored_user_name = name.underscore
        template 'api_bootstraper.rb.erb', 'config/initializers/api_bootstraper.rb'
      end

      # TODO create an example of route
      # def setup_routes
      #   if ARGV.include? "--skip-users"
      #     route "ActiveAdmin.routes(self)"
      #   else # Ensure Active Admin routes occur after Devise routes so that Devise has higher priority
      #     inject_into_file "config/routes.rb", "\n  ActiveAdmin.routes(self)", :after => /devise_for.*/
      #   end
      # end

      def copy_config_file
        template 'config.yml.erb', 'config/config.yml'
      end

      def create_migrations
        Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
          name = File.basename(filepath)
          migration_template "migrations/#{name}", "db/migrate/#{name.gsub(/^\d+_/,'')}"
          sleep 1
        end
      end
    end
  end
end