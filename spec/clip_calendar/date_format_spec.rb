RSpec.describe ClipCalendar::DateFormat do
  describe "#parse" do
    subject{ ClipCalendar::DateFormat.parse(input) }

    context "年月日" do
      context("「-」区切り"){ let(:input){ "2020-05-18" }; it { is_expected.to eq Date.new(2020,5,18) } }
      context("「/」区切り"){ let(:input){ "2020/05/18" }; it { is_expected.to eq Date.new(2020,5,18) } }
    end

    context "年の省略" do
      context("「-」区切り"){ let(:input){ "05-18" }; it { is_expected.to eq Date.new(Date.today.year,5,18) } }
      context("「/」区切り"){ let(:input){ "05/18" }; it { is_expected.to eq Date.new(Date.today.year,5,18) } }
    end
  end

  describe "#to_s" do
    subject{
      date= ClipCalendar::DateFormat.parse("2020-05-18")
      date.to_s(format)
    }

    context("書式なし"){ let(:format){ nil }; it { is_expected.to eq "2020/05/18(月)" } }
    # stftimeの書式を踏襲するが、日本語の曜日だけ独自に「%wjp」を追加する
    context("既定の書式"){ let(:format){ "%Y/%m/%d(%wjp)" }; it { is_expected.to eq "2020/05/18(月)" } }
    context("課題の例"){ let(:format){ "%m月%d日" }; it { is_expected.to eq "05月18日" } }
  end
end
