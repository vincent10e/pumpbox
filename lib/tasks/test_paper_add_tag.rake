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
      t.save
    end
  end
end
