require 'spec_helper'

describe JsonapiErrorsResponse do
  let(:model) { double('Model', errors: errors)}
  subject(:response) { described_class.new(model) }

  describe '#to_json' do
    subject { response.to_json }

    context 'with a simple errors hash' do
      let(:errors) {{ attribute_one: 'error one' }}
      it { is_expected.to eq({ errors:
        [
          {
            detail: 'error one',
            source: {
              pointer: "data/attributes/attribute_one"
            }
          }
        ]
      })}
    end

    context 'with a complex errors hash' do
      let(:errors) { { name: [
          "is too short (minimum is 2 characters)",
          "can't be blank"],
        description:["has already been taken"]}
      }

      it { is_expected.to eq({ errors:
        [
          {
            detail: ["is too short (minimum is 2 characters)", "can't be blank"],
            source: {
              pointer: "data/attributes/name"
            }
          }, {
            detail: ["has already been taken"],
            source: {
              pointer: "data/attributes/description"
            }
          }
        ]
      })}
    end
  end
end
