class UsersSyncer

  def self.sync
    new.sync
  end

  def sync
    users_data.each do |user_datum|
      name_arr = user_datum['name'].split(' ')
      user = User.find_or_create_by(meetup_id: user_datum['id'].to_s)
      user.first_name = name_arr.first
      user.last_name = name_arr.last if name_arr.length > 1
      user.save
    end
  end

  private

  def users_data
    @users_data ||= Meetup.all_members
  end
end
