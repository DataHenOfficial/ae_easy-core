module AeEasy
  module Core
    module Plugin
      module SeederBehavior
        include AeEasy::Core::Plugin::ContextIntegrator

        # {AeEasy::Core::Plugin::ParserBehavior#enqueue}
        def enqueue pages
          pages = [pages] unless pages.is_a? Array
          save_pages pages
        end
      end
    end
  end
end