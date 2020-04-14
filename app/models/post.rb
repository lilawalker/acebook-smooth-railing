# frozen_string_literal: true

class Post < ApplicationRecord
    belongs_to :user
    # delegate :name, :to => :user
end
