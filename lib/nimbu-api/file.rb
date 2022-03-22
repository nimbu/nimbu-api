# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  class File
    def self.new(filename)
      require "marcel"

      mime_type = Marcel::MimeType.for(::File.open(filename))
      Faraday::UploadIO.new(filename, mime_type)
    end
  end # File
end # Nimbu
