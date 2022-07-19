class Book < ApplicationRecord
    has_many :borrowings

    enum status: %i[en_estante prestado]

end
