module TestPapersHelper
  def list_answer_record(record)
    content = ""
    if !record.select_record_1.blank?
      content = content + "1. " + record.select_record_1 + " <br>"
    end

    if !record.select_record_2.blank?
      content = content + " 2. " + record.select_record_2 + " <br>"
    end

    if !record.select_record_3.blank?
      content = content + " 3. " + record.select_record_3 + " <br>"
    end
    if !record.select_record_4.blank?
      content = content + " 4. " + record.select_record_4 + " <br>"
    end
    if !record.select_record_5.blank?
      content = content + " 5. " + record.select_record_5 + " <br>"
    end
    
    return content
  end
end
