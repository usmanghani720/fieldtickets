# This concern works with the 'ar-audit-tracer' gem.
# It creates relations for created_by and updated_by

module CreatedBy
  extend ActiveSupport::Concern
  
  included do
    belongs_to :creator, class_name: '::Employee', foreign_key: :created_by
    belongs_to :updater, class_name: '::Employee', foreign_key: :created_by
  end
end