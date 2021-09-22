require 'clip_calendar/date_format'

module ClipCalendar

  class ArgumentNumberError < StandardError; end
  class ArgumentTypeError < StandardError; end

  class Core

    def initialize(argv)

      # 引数チェック
      begin
        case argv.count
        when 1
          start_date= DateFormat.parse(argv[0])
          @dates= start_date .. (start_date+5)
        when 2
          @dates= DateFormat.parse(argv[0])..DateFormat.parse(argv[1])
        else
          raise ArgumentNumberError, "### Wrong numbers of input (expected: 2, actual: #{argv.count})"
        end
      rescue ArgumentError
        raise ArgumentTypeError, "### invalid argment type: "
      end

    end

    def output
      @dates.map { |date| date.to_s }.join("\n")
    end

  end

end
