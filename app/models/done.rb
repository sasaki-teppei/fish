class Done < ApplicationRecord
    belongs_to :topic
    belongs_to :reply
end
