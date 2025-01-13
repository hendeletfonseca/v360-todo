class Todo < ApplicationRecord
    validates :title, presence: true

    after_initialize :set_default_done, if: :new_record?

    private

    def set_default_done
        self.done ||= false
    end
end
