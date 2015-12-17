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

	describe "get index" do
		it "lists all community resources" do
			CommunityResource.create!(title: 'A cool resource')
			CommunityResource.create!(title: 'Another cool one')
			get community_resources_path
			expect(response.status).to eq 200
			community_resources = JSON.parse(response.body)
			expect(community_resources['community_resources'].length).to be 2
		end
	end

	describe "destroy a resource" do
		it "destroys an existing record" do
			cr = CommunityResource.create!(title: 'A cool resource')
			expect{ delete community_resource_path(cr) }.to change{
				CommunityResource.count
			}.by -1
		end
	end
end
