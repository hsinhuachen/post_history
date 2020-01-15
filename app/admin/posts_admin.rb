Trestle.resource(:posts) do
  menu do
    item :posts, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |post|
    # concat content_tag :label, "網址", :for => "post_slug"
    concat content_tag(:div, nil, class: "flex"){
      concat content_tag :span, "http://localhost/posts/"
      text_field :slug, label: false, class: "short", "disabled": "disabled"
    }
      
    text_field :title
    text_area :msg, id: "editor"

    concat(custom_helper({state: 'danger',heading: 'Top Secret'}) do
      post.versions.each_with_index do |version, index|
        concat content_tag(:tr, nil){
          concat content_tag(:td, index + 1)
          concat content_tag(:td, nil){
            concat content_tag(:ul, nil){
              version.changeset.each do |key, value|
                concat content_tag(:li, "#{value[0]} 改成 #{value[1]}")
              end
            }
          }
          concat content_tag(:td, link_to("復原",  admin.path(:undo, id: version), method: :post, :data => { :confirm => "Are you sure?"}, :class => "btn btn-success"))
        }
      end
    end)

  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  end

  controller do 
    def undo
      @version = PaperTrail::Version.find(params[:id])
      @version.reify.save!
      flash[:message] = flash_message("published.success", title: "紀錄已復原", message: "") 
      redirect_to admin.path(:index)
    end
  end

  routes do
    post :undo, on: :member
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:post).permit(:name, ...)
  # end
end
