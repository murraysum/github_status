#!/usr/bin/env ruby

require 'github_status'
require 'optparse'

module StatusPresenter
  def self.print(statuses)
    statuses.each { |s| puts "#{s.created_on.strftime('%F %H:%M')} #{s.status.capitalize} \"#{s.message}\"" }
  end
end

module StatusParser
  def self.parse!
    parser = OptionParser.new do |opts|
      opts.banner = "Usage: github_status [options]"

      opts.on('-l', '--last', 'List the last message') do
        status = GithubStatus::Status.last_message
        StatusPresenter.print([status])
      end

      opts.on('-m', '--messages', 'List all the messages') do
        statuses = GithubStatus::Status.messages
        StatusPresenter.print(statuses)
      end

      opts.on('-c', '--current', 'Show the current status') do
        status = GithubStatus::Status.current
        StatusPresenter.print([status])
      end
    end

    parser.parse!
  end
end

StatusParser.parse!