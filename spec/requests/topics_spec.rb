require "spec_helper"

describe "Topics" do
  let(:event) { FactoryGirl.create(:event) }

  describe "POST /topics" do
    before do
      post topics_path, params
    end

    context "with good params" do
      let(:params) { {
          topic: {
            name: 'great_name',
            description: 'really great description!',
            event: event.id
          }
        }
      }
      it "is successful" do
        expect(response.status).to eql(200)
      end
    end

    context "with a failing validation (no name parameter)" do
      let(:params) { {
          topic: {
            description: 'really great description!',
            event: event.id
          }
        }
      }
      it "is not successful" do
        expect(response.status).to eql(400)
      end
    end
  end

  describe "GET /topics" do
    let!(:topic_1) { FactoryGirl.create(:topic) }
    let!(:topic_2) { FactoryGirl.create(:topic) }
    let!(:topic_3) { FactoryGirl.create(:topic) }
    let(:topics) { JSON.parse(response.body) }

    before do
      get topics_path
    end

    it "is successful" do
      expect(response.status).to eql(200)
    end

    it "returns all the topics in a topics hash" do
      expect(topics["topics"].count).to eql 3
    end
  end
end
