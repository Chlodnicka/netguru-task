class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  #  if subject_item.subject_item_notes.nil?
   #   0.00
    #else
     # subject_item.subject_item_notes.inject{ |sum, el| sum + el }.to_f / subject_item.subject_item_notes.size
    #end
  end
end
