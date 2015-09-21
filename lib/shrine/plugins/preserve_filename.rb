class Shrine
  module Plugins
    module PreserveFilename
      module InstanceMethods
        def generate_location(io, context)
          if (filename = extract_filename(io)) && !io.is_a?(Tempfile)
            directory = File.basename(super, ".*")
            File.join(directory, filename)
          else
            super
          end
        end
      end
    end

    register_plugin(:preserve_filename, PreserveFilename)
  end
end
