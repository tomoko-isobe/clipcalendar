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

    def to_s(format= "%Y/%m/%d(%wjp)")
      format ||= "%Y/%m/%d(%wjp)"
      dw = ["日", "月", "火", "水", "木", "金", "土"]
      format.gsub!(/\%wjp/, dw[self.wday])
      self.strftime(format)
    end

  end

end
