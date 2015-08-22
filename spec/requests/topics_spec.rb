require "spec_helper"

describe "Topics" do

  describe "POST /topics" do
    let(:params) { {
        topic: {
          name: 'great_name',
          description: 'really great description!'
        }
      }
    }

    before do
      post topics_path, params
    end

    context "with good params" do
      it "is successful" do
        expect(response.status).to eql(200)
      end
    end

    context "with a failing validation (no name parameter)" do
      let(:params) { {
          topic: {
            description: 'really great description!'
          }
        }
      }
      it "is not successful" do
        expect(response.status).to eql(400)
      end
    end
  end
end
