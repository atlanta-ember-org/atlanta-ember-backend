def fetch_required_env(key)
  ENV.fetch(key) { fail "Expected environment variable #{key} is not defined" }
end

MEETUP_API_KEY = fetch_required_env('MEETUP_API_KEY')
MEETUP_GROUP_ID = fetch_required_env('MEETUP_GROUP_ID')