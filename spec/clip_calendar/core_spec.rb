RSpec.describe ClipCalendar::Core do
  describe "#output" do
    context "正しい入力" do
      subject{ ClipCalendar::Core.new(input).output }

      context "開始日・終了日を入力" do
        context "READMEの例" do
          let(:input){ ["2020-05-18","2020-05-22"] }
          it{ is_expected.to eq("2020/05/18(月)\n2020/05/19(火)\n2020/05/20(水)\n2020/05/21(木)\n2020/05/22(金)") }
        end

        context "同日を指定" do
          let(:input){ ["2020-05-18","2020-05-18"] }
          it{ is_expected.to eq("2020/05/18(月)") }
        end
      end

      context "終了日を省略" do
        let(:input){ ["2020-05-18"] }
        it{ is_expected.to eq("2020/05/18(月)\n2020/05/19(火)\n2020/05/20(水)\n2020/05/21(木)\n2020/05/22(金)\n2020/05/23(土)") }
      end

      context "開始日・終了日を省略" do
        let(:input){ [] }
        let(:expected){
          today= Date.today
          dates= today .. (today+5)
          wdays= "日月火水木金土".split(//)
          dates.map{|d| d.strftime("%Y/%m/%d")+ "("+ wdays[d.wday]+ ")"}.join("\n")
        }
        it{ is_expected.to eq(expected) }
      end
    end

    context "書式付き" do
      subject{ ClipCalendar::Core.new(["2020-05-18","2020-05-18"], format).output }

      context("既定の書式"){ let(:format){ "%Y/%m/%d(%wjp)" }; it { is_expected.to eq("2020/05/18(月)") } }
      context("課題の書式"){ let(:format){ "%m月%d日" }; it { is_expected.to eq("05月18日") } }
    end

    context "誤った入力" do
      subject{ -> { ClipCalendar::Core.new(input) } }

      context("引数が3個"){ let(:input){ ["2020-05-18","2020-05-22","2020-05-27"] }; it{ is_expected.to raise_error ClipCalendar::ArgumentNumberError } }

      context("日付形式が異なる"){ let(:input){ ["2020年05月18日","2020年05月22日"] }; it{ is_expected.to raise_error ClipCalendar::ArgumentTypeError } }
    end
  end
end
