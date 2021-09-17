require 'clipboard'
require 'clip_calendar/core'

module ClipCalendar
  class Cli
    def initialize
      begin
        clip_calendar= ClipCalendar::Core.new(ARGV)
      rescue
        puts $!.message
        exit (1)
      end
    
      Clipboard.copy clip_calendar.output
    end
  end
end
