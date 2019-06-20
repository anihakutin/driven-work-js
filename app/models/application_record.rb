class ApplicationRecord < ActiveRecord::Base
  include ApplicationHelper
  include ActionView::Helpers::NumberHelper
  self.abstract_class = true

end
