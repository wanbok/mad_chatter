module MadChatter
  class Message < ActiveRecord::Base

    if Rails::VERSION::MAJOR == 3
      attr_accessible :html, :text
    end
    
    belongs_to :room
    belongs_to :author, class_name: 'User'

    validates_presence_of :room, :text, :author

    def html
      text unless @html
    end

    def as_json(options={})
      json = super(options)
      json[:author_username] = author.username
      json
    end

  end
end
