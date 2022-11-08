module CmAdmin::EducationalDetail
  extend ActiveSupport::Concern
  included do
    cm_admin  do
      actions only: [:index]
      cm_index do 
        page_title 'Educational details'
        page_description 'Manage educational details here'
        
        column :id, header: 'ID'
        column :description, header: 'Description'
      end
    end
  end
end