class JsonapiErrorsResponse

  def initialize(model)
    @errors = model.errors
  end

  def to_json
    { errors: parsed_errors }.to_json
  end

  private

  def parsed_errors
    @parsed_errors ||= @errors.map { |attribute, errors|
      {
        detail: errors,
        source: {
          pointer: "data/attributes/#{attribute}"
        }
      }
    }
  end
end
