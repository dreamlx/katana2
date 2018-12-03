ActiveAdmin.register ChargeHour do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :take_time, :project_id
menu label: "ChargeHour", priority: 1
#navigation_menu :project
belongs_to :project, optional: true
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
