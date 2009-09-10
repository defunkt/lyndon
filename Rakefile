begin
  require 'jeweler'

  # We're not putting VERSION or VERSION.yml in the root,
  # so we have to help Jeweler find our version.
  $LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'
  require 'lyndon/version'

  Lyndon::Version.instance_eval do
    def refresh
    end
  end

  class Jeweler
    def version_helper
      Lyndon::Version
    end

    def version_exists?
      true
    end
  end

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "lyndon"
    gemspec.summary = "Lyndon wraps JavaScript in a loving MacRuby embrace."
    gemspec.email = "chris@ozmm.org"
    gemspec.homepage = "http://github.com/defunkt/lyndon"
    gemspec.description = "Lyndon wraps JavaScript in a loving MacRuby embrace."
    gemspec.authors = ["Chris Wanstrath"]
    gemspec.has_rdoc = false
  end
rescue LoadError
  puts "Jeweler not available."
  puts "Install it with: gem install technicalpickles-jeweler"
end
