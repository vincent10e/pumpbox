namespace :pumpbox do

  desc "test paper question add tag"
  task :add_tag do
    tests = TestPaperQuestion.all

    tests.each do | t |
      if t.customized_concept.title
        t.tag_list.add(t.customized_concept.title)
      end

      if t.customized_concept.course.title
        t.tag_list.add(t.customized_concept.course.title)
      end

      if t.customized_concept.course.education_level.title
        t.tag_list.add(t.customized_concept.course.education_level.title)
      end

      if Subject.find(t.customized_concept.course.subject_id)
        t.tag_list.add(Subject.find(t.customized_concept.course.subject_id).title)
      end

      t.save
    end
  end
end
