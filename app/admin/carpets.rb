ActiveAdmin.register Carpet do
  form do |f|
    f.inputs "Carpet" do
      f.input :carpet_range_id, :as => :select, :collection => CarpetRange.all
      f.input :name
      f.input :price
      f.input :available_colours_raw, :as => :text
    end
    f.buttons
  end
end
