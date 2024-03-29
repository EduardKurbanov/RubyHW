ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :image, :category_id

  includes :category
  includes :image_attachment

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
      f.input :category_id
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
