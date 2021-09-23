require 'date'
require "clip_calendar/version"

module ClipCalendar

  class DateFormat < Date
    
    def self.parse(str)
      case str
      when /\A(\d{1,2})([\-\/])(\d{1,2})\z/
        str= "%d%s%s%s%s" % [Date.today.year, $2, $1, $2, $3]
      end
      super(str)
    end

    def to_s(format= nil)
      dw = ["日", "月", "火", "水", "木", "金", "土"]
      self.strftime("%Y/%m/%d(#{dw[wday]})")
    end

  end

end
