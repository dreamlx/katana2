ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :memo, :estimated_fee, :contract_amount, :charge_rate, :profit_rate, :contract_memo, 
              :opportunity_amount, :opportunity_memo, :risk_rate
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

menu label: "Project", priority: 1

  sidebar "Project Details", only: [:show, :edit] do
    ul do
      li link_to "Add ChargeHour",    new_admin_project_charge_hour_path(resource)
      li link_to "累计耗时 (#{resource.charge_hours.sum(:take_time)})",    admin_project_charge_hours_path(resource)
      
    end
  end

	index do
    selectable_column
    column :id
    column :title
    column '预期收入' do |project|
      project.estimated_fee
    end
    column '预期利润' do |project|
      project.estimated_fee * project.profit_rate.to_i / 100
    end
    # column '单位价值' do |project|
    #   profit = project.estimated_fee.to_i * project.profit_rate.to_i / 100
    #   per_hour = "%.2f" % (profit/(project.estimated_fee / project.charge_rate))
    #   "#{profit} / #{per_hour}"
    # end
    column  '合同金额(k)' do |project|
      project.contract_amount
    end

    column '剩余时间' do |project|
      "%.2f" % (project.estimated_fee / project.charge_rate - project.charge_hours.sum(:take_time))
    end
    column '累计耗时' do |l|
    	"%.2f" % l.charge_hours.sum(:take_time)
    end

    column '整体风险率' do |l|
      "%.0f%" % l.risk_rate.to_i
    end

    # column 'total_fee(k)' do |l|
    # 	color = 'green'
    # 	color = 'red' if l.charge_hours.sum(:take_time)* l.charge_rate*0.8 > l.estimated_fee
    # 	div(style: "color:#{color}") do
    # 		"#{l.charge_hours.sum(:take_time) * l.charge_rate}"
    # 	end
    # end

    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      
      row '剩余时间' do |project|
        "%.2f" % (project.estimated_fee / project.charge_rate - project.charge_hours.sum(:take_time))
      end

      row '预期收入(k)' do |project|
        project.estimated_fee
      end

      row '预期利润' do |project|
        project.estimated_fee * project.profit_rate.to_i / 100
      end

      row  '预期合同金额(k)' do |project|
        project.contract_amount
      end
      row  '合同预期说明' do |project|
        project.contract_memo
      end

      row  '(k)未来机会收入' do |project|
        project.opportunity_amount
      end
      row  '(k)机会收入说明' do |project|
        project.opportunity_memo
      end

      row 'total_fee(k)' do |l|
        color = 'green'
        color = 'red' if l.charge_hours.sum(:take_time)* l.charge_rate*0.8 > l.estimated_fee
        div(style: "color:#{color}") do
          "#{l.charge_hours.sum(:take_time) * l.charge_rate}"
        end
      end

      row :charge_rate do |project|
        "%.2f K/hour" % project.charge_rate
      end
      row 'profit_rate' do |project|
        "%.0f%" % project.profit_rate
      end
      row 'risk_rate' do |project|
        "%.0f%" % project.risk_rate
      end

      row :memo
    end
  end

   form do |f|
  	f.semantic_errors # shows errors on :base
    f.label '(预期合同+机会收入)*利润率= 预期利润'
  	f.inputs do
  		f.input :title, label: '项目名'
  		#f.input :estimated_fee, label: '(k)预估收益, 机会收益'
  		f.input :contract_amount, label: '(k)预估合同金额'
      f.input :contract_memo, label: '合同预期说明'
      f.input :opportunity_amount, label: '(k)未来机会收入'
      f.input :opportunity_memo, label: '(k)机会收入说明'
      f.input :memo, label: '项目整体描述'
      f.input :charge_rate, label: '(k)小时机会成本'
      f.input :profit_rate, as: :select, :collection =>[10,20,30,40,50,60,70,80,90], label: '% 预期利润率'
      f.input :risk_rate, as: :select, :collection =>[10,20,30,40,50,60,70,80,90], label: '% 整体风险率'
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end

end
