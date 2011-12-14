
module Fletcher
  # This class extends string functions
  module String
    def sanitize
      self.strip
    end
  end
end

::String.send(:include, ::Fletcher::String)
