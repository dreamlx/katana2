ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :memo, :estimated_fee, :contract_amount
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	index do
    selectable_column
    column :title
    column :estimated_fee
    column :contract_amount
    column 'total_hours' do |l|
    	l.charge_hours.sum(:take_time)
    end

    column 'total_fee' do |l|
    	color = 'green'
    	color = 'red' if l.charge_hours.sum(:take_time)*2 > l.estimated_fee
    	div(title: '每小时2k, 依据 24万月公司/120小时工作时间/每月', style: "color:#{color}") do
    		"#{l.charge_hours.sum(:take_time)*2}"
    	end
    end

    actions
  end

end
