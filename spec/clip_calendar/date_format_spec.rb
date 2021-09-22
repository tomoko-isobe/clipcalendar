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
end
