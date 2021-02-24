class Empresa < ApplicationRecord
  belongs_to :user
  belongs_to :caracteristica
end
