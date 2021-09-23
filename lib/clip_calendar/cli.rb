require 'clipboard'
require 'clip_calendar/core'
require 'optparse'

module ClipCalendar
  class Cli
    def initialize
      begin
        params= ARGV.getopts('f:')
        clip_calendar= ClipCalendar::Core.new(ARGV, params[:f])
      rescue
        puts $!.message
        exit (1)
      end
    
      Clipboard.copy clip_calendar.output
    end
  end
end
