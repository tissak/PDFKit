class PDFKit
  class Configuration
    attr_accessor :meta_tag_prefix, :wkhtmltopdf, :default_options

    def initialize
      @meta_tag_prefix = 'pdfkit-'
      @wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
      @default_options = {
        :disable_smart_shrinking => true,
        :page_size => 'A4',
        :margin_top => '10mm',
        :margin_right => '10mm',
        :margin_bottom => '10mm',
        :margin_left => '10mm'
      }
    end
  end

  class << self
    attr_accessor :configuration
  end

  # Configure PDFKit someplace sensible,
  # like config/initializers/pdfkit.rb
  #
  # @example
  #   PDFKit.configure do |config|
  #     config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
  #   end
  
  def self.configuration
    @configuration ||= Configuration.new
  end
  
  
  def self.configure
    self.configuration 
    yield(configuration)
  end
end