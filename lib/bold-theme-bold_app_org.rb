require 'font-awesome-rails'

module Bold
  module Themes
    module BoldAppOrg
      class Engine < ::Rails::Engine

        config.to_prepare do

          # Registers the theme under the given id.
          #
          # All view templates for this theme are located in
          # "app/views/themes/<id>", in this case: 'app/views/themes/bold_app_org'
          Bold::Theme.register :bold_app_org do

            # pretty name to be shown in UI
            name 'bold-app.org'

            template :homepage, fields: %w(heading description)
            template :default

            # Declare the main stylesheet and Javascript files of the theme.
            #
            # These can also be sprockets manifest files, which in turn
            # include files from
            # assets/javascripts/{stylesheets,javascripts}/casper/
            #
            assets 'bold_app_org.css', 'bold_app_org.js'

            image_version :bold_app_org_content_full, width: 1200, quality: 60
            image_version :bold_app_org_content_inline, width: 600, quality: 60

          end
        end

      end
    end
  end
end

