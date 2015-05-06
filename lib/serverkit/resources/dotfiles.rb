require "serverkit/resources/base"

module Serverkit
  module Resources
    # A resource class for Mac OS X user defaults system.
    class Dotfiles < Base
      attribute :directory, required: true, type: String

      def apply
        dotfiles.each do |file|
          run_command("rm -rf #{::File.join(ENV["HOME"], file)}")
          run_command("ln -s #{::File.join(directory, file)} #{::File.join(ENV["HOME"], file)}")
        end
      end

      # @note Override
      # @return [true, false]
      def check
        dotfiles.all? do |file|
          check_command_from_identifier(
            :check_file_is_linked_to,
            ::File.join(ENV["HOME"], file),
            ::File.join(directory, file),
          )
        end
      end

      private

      def directory
        ::File.expand_path(attributes["directory"])
      end

      def dotfiles
        @dotfiles ||= run_command("ls -A #{directory}").stdout.split("\n")
      end
    end
  end
end
