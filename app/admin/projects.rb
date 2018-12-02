ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :memo, :estimated_fee, :contract_amount, :charge_rate
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu label: "Project", priority: 0

	index do
    selectable_column
    column :title
    column '机会收益(k)' do |project|
      project.estimated_fee
    end
    column  '合同金额(k)' do |project|
      project.contract_amount
    end
    column 'total_hours' do |l|
    	l.charge_hours.sum(:take_time)
    end

    column 'total_fee(k)' do |l|
    	color = 'green'
    	color = 'red' if l.charge_hours.sum(:take_time)*2 > l.estimated_fee
    	div(style: "color:#{color}") do
    		"#{l.charge_hours.sum(:take_time)* l.charge_rate.to_i}"
    	end
    end

    actions
  end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :title, label: '项目名'
  		f.input :estimated_fee, label: '(k)预估收益, 机会收益'
  		f.input :contract_amount, label: '(k)合同金额'
      f.input :memo, label: '项目描述'
      f.input :charge_rate, label: '(k)项目费率: charge_rate*charge-hours'
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end

end
