ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :category_id

  includes :category
  includes image_attachment: :blob
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end
end
