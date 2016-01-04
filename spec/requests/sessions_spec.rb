require "spec_helper"

describe "Sessions" do
  describe "POST /sessions" do
    let(:password) { 'password' }
    let(:user)   { FactoryGirl.create(:user, email: 'user@example.com', password: password) }

    context "with all required params" do
      let(:params) { {
          email: user.email,
          password: password
        }
      }

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

    context 'without a password' do
      let(:params) { {
          email: user.email,
          password: nil
        }
      }

      it "creates a new session" do
        expect{ post sessions_path, params }.not_to change{
          Session.count
        }
      end

      context 'returns' do
        before  { post sessions_path, params }
        subject { response.status }
        it { is_expected.to be 404 }
      end
    end

    context 'when a user can not be found' do
      let(:params) { {
          email: 'bad.email@example.com',
          password: password
        }
      }
      before  { post sessions_path, params }
      subject { response.status }
      it { is_expected.to be 404 }
    end
  end
end
