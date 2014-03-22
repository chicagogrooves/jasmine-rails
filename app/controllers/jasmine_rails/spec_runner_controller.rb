module JasmineRails
  class SpecRunnerController < JasmineRails::ApplicationController
    def index
      JasmineRails.reload_jasmine_config
      @require_config_json = JSON.dump(Rails.application.config.requirejs.run_config).html_safe

      prereqs =  Rails.application.config.requirejs.user_config['load_with_specs']
      spec_list = Dir["#{Rails.root}/spec/javascripts/**/*.coffee"].map do |x|
        x.sub("#{Rails.root}/spec/javascripts/","").sub(/\.coffee/,"")
      end 

      @spec_modules_json = JSON.dump(prereqs+spec_list).html_safe
    end
  end
end
