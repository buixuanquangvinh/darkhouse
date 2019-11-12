class Appointment < ApplicationRecord
    paginates_per 10
    validates :customer_name,:customer_phone,:description, presence: {message: "phải điền"}
end
