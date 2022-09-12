class Bookgenre < ActiveRecord::Base
    has_many :books
end