ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :memo, :estimated_fee, :contract_amount, :charge_rate, :profit_rate
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu label: "Project", priority: 0

  sidebar "Project Details", only: [:show, :edit] do
    ul do
      li link_to "ChargeHour (#{resource.charge_hours.sum(:take_time)})",    admin_project_charge_hours_path(resource)
      
    end
  end

	index do
    selectable_column
    column :id
    column :title
    column '预期收入(k)' do |project|
      project.estimated_fee
    end
    column '预期利润/小时利润' do |project|
      profit = project.estimated_fee.to_i * project.profit_rate.to_i / 100
      per_hour = "%.2f" % (profit/(project.estimated_fee / project.charge_rate))
      "#{profit} / #{per_hour}"
    end
    column  '合同金额(k)' do |project|
      project.contract_amount
    end
    column '可用时间' do |project|
      "%.2f" % (project.estimated_fee / project.charge_rate - project.charge_hours.sum(:take_time))
    end
    column 'total_hours' do |l|
    	l.charge_hours.sum(:take_time)
    end

    column 'total_fee(k)' do |l|
    	color = 'green'
    	color = 'red' if l.charge_hours.sum(:take_time)* l.charge_rate*0.8 > l.estimated_fee
    	div(style: "color:#{color}") do
    		"#{l.charge_hours.sum(:take_time) * l.charge_rate}"
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
      f.input :profit_rate, as: :select, :collection =>[10,20,30,40,50,60,70,80,90], label: '% 利润率'
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end

end
