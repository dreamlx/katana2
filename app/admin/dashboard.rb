ActiveAdmin.register_page "Dashboard" do

  menu priority: 0, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
        small "开项目+评估项目+项目记录时间= 项目耗时成本 1小时"
        small "2019年,预期年营业收入240万, 单位小时成本3k"
        small "2小时 * 3k = 216k, 20万以下全新领域项目应该减少"
        small "36小时 * 3k = 108k, 10万以下项目适用于复用现有项目"
        small "极限成本项目为50k, 5万以下项目只适用于完全产品化成品"

      end
    end
    columns do
        column do
            panel '项目评估' do 
                ul do
                    li '问题定义         2小时'
                    li '可行性分析       2小时'
                    li '需求分析        4小时'
                    li '总体设计        8小时'
                    li '详细设计        8小时'
                    li '开发和单元测试     16小时'
                    li '综合测试          8小时'
                    li '软件维护        8小时'
                    li '项目收款和客户关系维护 16小时'
                end
                h5 '合计72小时'
            end
        end
        column do
            panel '最小评估' do 
                ul do
                    li '问题定义         2小时'
                    li '可行性分析       0小时'
                    li '需求分析        1小时'
                    li '总体设计        0小时'
                    li '详细设计        1小时'
                    li '开发和单元测试     4小时'
                    li '综合测试          4小时'
                    li '软件维护        4小时'
                    li '项目收款和客户关系维护 16小时'
                end
                h5 '合计36小时'
            end
        end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
