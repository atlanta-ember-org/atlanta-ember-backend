require "spec_helper"

describe "Sessions" do
  describe "POST /sessions" do
    let(:user)   { FactoryGirl.create(:user, email: 'user@example.com') }
    let(:params) { {
        email: user.email,
        password: 'does not matter yet'
      }
    }

    context "with all required params" do

      it "creates a new session" do
        expect{ post sessions_path, params }.to change{
          Session.count
        }.by 1
      end

      context 'the return value' do
        before  { post sessions_path, params }

        it 'is expected to return the email and token' do
          expect(JSON.parse(response.body).keys).to eq ['email', 'token']
        end
      end
    end
  end
end
