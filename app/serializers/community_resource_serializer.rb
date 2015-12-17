class CommunityResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :group, :created_date,
             :modified_date, :is_approved, :approved_date

  

end
