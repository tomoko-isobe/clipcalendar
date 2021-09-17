require 'clip_calendar/date_format'

module ClipCalendar

  class ArgumentNumberError < ArgumentError; end
  class ArgumentTypeError < ArgumentError; end

  class Core

    def initialize(argv)

      # 引数チェック
      raise ArgumentNumberError, "### Wrong numbers of input (expected: 2, actual: #{argv.count})"  unless argv.count == 2
      begin
        @dates= DateFormat.parse(argv[0])..DateFormat.parse(argv[1])
      rescue ArgumentError
        raise ArgumentTypeError, "### invalid argment type: "
      end

    end

    def output
      @dates.map { |date| date.to_s }.join("\n")
    end

  end

end
