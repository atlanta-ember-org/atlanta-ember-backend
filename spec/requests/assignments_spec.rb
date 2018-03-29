  require "spec_helper"

describe "Assignments" do

  describe "POST /assignments" do
    let(:user) { FactoryGirl.create(:user) }
    let(:topic) { FactoryGirl.create(:topic) }
    let(:params) { {
        assignment: {
          user_id: user.id,
          topic_id: topic.id
        }
      }
    }

    context "with all required params" do

      it "adds creates a new assignment" do
        expect{ post assignments_path, :params => params }.to change{
          Assignment.count
        }.by 1
      end

      context "after the request if made" do
        before do
          post assignments_path, :params => params
        end

        it "is successful" do
          expect(response.status).to eql 200
        end

        it "created an assignment with the correct user" do
          expect(Assignment.last.user).to eql user
        end
      end
    end
  end
end
