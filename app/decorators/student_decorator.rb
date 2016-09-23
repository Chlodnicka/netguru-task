class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    number = student.subject_item_notes.where(subject_item_id: subject_item.id).size
    sum = student.subject_item_notes.where(subject_item_id: subject_item.id).map { |x| x[:value] }.reduce(:+)

    if number == 0
      "0.00"
    else
      sprintf('%.2f', sum/number.to_f)
    end
  end
end
