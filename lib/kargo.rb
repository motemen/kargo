require 'kargo/version'
require 'pathname'
require 'uri'
require 'term/ansicolor'

module Kargo
  class Item
    attr_reader :path, :url

    def self.create(path, url)
      path = Pathname.new(path)
      url  = URI.parse(url)

      item_class = case url.scheme
        when 'git'
          Item::Git
        else
          raise "Unknown protocol: #{url.scheme}"
        end

      item_class.new(path, url)
    end

    def initialize(path, url)
      @path = path
      @url  = url
    end

    def check
      @path.exist?
    end

    def download!
      raise 'Not implemented'
    end

    def to_s
      "#{path} (#{url})"
    end

    class Item::Git < Item
      def download!
        path.mkpath

        system 'git', 'clone', url.to_s, path.to_s
      end
    end
  end

  class Core
    def items
      File.read('Kargofile').each_line.map do |line|
        path, url, _ = line.chomp.split(/\s+/)
        Kargo::Item.create(path, url)
      end
    end

    def update!
      items.each do |item|
        if item.check
          STDERR.puts "#{Term::ANSIColor::green  '  exists'} #{item}"
        else
          STDERR.puts "#{Term::ANSIColor::yellow 'download'} #{item}"
          item.download!
        end
      end
    end
  end
end
