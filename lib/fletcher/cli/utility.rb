
module Fletcher
  module CLI
    class Utility < Thor
      include Thor::Actions

      method_option :format, :aliases => "-f", :type => :string, :default => :yaml
      method_option :only, :aliases => "-o", :type => :string, :desc => "Fetch a single attribute [name|description|image|price]", :banner => "ATTRIBUTE"
      method_option :debug, :aliases => "-d", :type => :bool, :desc => "Print debug information: http response, etc."

      desc 'fetch [URL]', "Fetch Product information\n\n" + 
                          "Example:\n\s\sfletcher fetch 'http://www.amazon.com/gp/product/B004HZYA6E/'"
      def fetch(url)
        product = Fletcher.fetch url

        if options[:debug]
        end

        # Prep output
        output_hash = Hash.new
        output_hash["name"] = product.name
        output_hash["description"] = product.description if product.description
        output_hash["price"] = product.price.format if product.price
        if product.image
          output_hash["image"] = Hash.new 
          output_hash["image"]["src"] = product.image.src 
        end 
        output_hash["url"] = product.url

        # Get single attribute
        if options[:only]
          case options[:only]
          when "image"
            value = output_hash["image"]["src"]
          else
            value = output_hash[options[:only]]
          end 
          value ? say(value.to_s) : say("Unknown attribute: #{options[:only]}")
        else 
          say output_hash.to_yaml
        end
      end

      desc "websites", "Get a list of supported websites"
      def websites
        say "Supported Websites:"
        for model in Fletcher.models.sort
          say "\t#{model.to_s.capitalize}"
        end 
      end 

      map '-v' => :version
      desc "version", "Get VERSION"
      def version
        say Fletcher.version
      end
    end
  end
end
