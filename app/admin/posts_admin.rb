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
    editor :msg

    concat content_tag(:div, nil, class: "panel panel-default"){
      concat content_tag(:div, '編輯紀錄', class: "panel-heading")
      concat(content_tag(:div, class: "panel-body") { 
        content_tag(:table, nil){
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
            }
          end
        }
      })
    }


  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  end

  # controller do 
  #   def new
  #     @value = "aaaa"
  #   end
  # end

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
