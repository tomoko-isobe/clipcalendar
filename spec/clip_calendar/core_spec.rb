RSpec.describe ClipCalendar::Core do
  describe "#output" do
    context "正しい入力" do
      subject{ ClipCalendar::Core.new(input).output }

      context "READMEの例" do
        let(:input){ ["2020-05-18","2020-05-22"] }
        it{ is_expected.to eq("2020/05/18(月)\n2020/05/19(火)\n2020/05/20(水)\n2020/05/21(木)\n2020/05/22(金)") }
      end

      context "同日を指定" do
        let(:input){ ["2020-05-18","2020-05-18"] }
        it{ is_expected.to eq("2020/05/18(月)") }
      end
    end

    context "誤った入力" do
      subject{ -> { ClipCalendar::Core.new(input) } }

      context("引数が0個"){ let(:input){ [] }; it{ is_expected.to raise_error ClipCalendar::ArgumentNumberError } }
      context("引数が1個"){ let(:input){ ["2020-05-18"] }; it{ is_expected.to raise_error ClipCalendar::ArgumentNumberError } }
      context("引数が3個"){ let(:input){ ["2020-05-18","2020-05-22","2020-05-27"] }; it{ is_expected.to raise_error ClipCalendar::ArgumentNumberError } }

      context("日付形式が異なる"){ let(:input){ ["2020年05月18日","2020年05月22日"] }; it{ is_expected.to raise_error ClipCalendar::ArgumentTypeError } }
    end
  end
end
