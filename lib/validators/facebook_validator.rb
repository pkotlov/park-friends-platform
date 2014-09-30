class FacebookValidator < ActiveModel::Validator
  def validate(record)
    if record.facebook_id.blank? && record.password.blank?
      record.errors[:base] << "Either facabook_id or password are not suposed to be blank."
    end
  end
end