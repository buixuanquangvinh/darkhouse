class Appointment < ApplicationRecord
    has_paper_trail
    paginates_per 10
    validates :customer_name,:customer_phone,:description, presence: {message: "phải điền"}
end
