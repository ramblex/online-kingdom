module GroupsHelper
  def add_team_link
    link_to_function "Add another team" do |page|
      page.insert_html :bottom, :group, :partial => 'team', :object => GroupTeam.new
    end
  end
end
