class Todo < ApplicationRecord
    belongs_to :user

    validates :title, presence: true

    after_initialize :set_default_done, if: :new_record?

    private

    def set_default_done
        self.done ||= false
    end
end
