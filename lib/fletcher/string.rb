module Fletcher
  # This class extends string functions
  module String
    def sanitize
      self.strip
    end

    def camelize(first_letter_in_uppercase = true)
      lower_case_and_underscored_word = self.dup.underscore
      if first_letter_in_uppercase
        lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
      else
        lower_case_and_underscored_word.first + camelize(lower_case_and_underscored_word)[1..-1]
      end
    end

    def underscore
      word = self.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end
  end
end

::String.send(:include, ::Fletcher::String)
