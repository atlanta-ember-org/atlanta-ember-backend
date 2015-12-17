require "spec_helper"

describe "Community resources" do
	describe "post create" do
		it "creates a new community resource" do
			params = {
				community_resource: {
					title: 'A blog post',
					url: 'http://www.example.com/a/post',
					description: 'Super good info!',
					group: 'Tutorial'
				}
			}
			expect{ post community_resources_path, params }.to change{
          	CommunityResource.count
        	}.by 1
		end
	end
end
