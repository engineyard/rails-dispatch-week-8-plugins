class ContactForm < MailForm::Base
  attribute :name
  attribute :email
  attribute :author_id
  attribute :message

  validates :name, :email, :author_id, :message, :presence => true

  def headers
    { :to => Author.find(author_id).email }
  end
end