module CoursesHelper

	# show test_attemp or test_paper last retry_time
	def show_retry_time(concept, user_id) 
    if !concept.test_attempts.where(user: user_id).last.nil? 
    	link_to customized_concept_student_detail_path(concept, user_id) do
    		content_tag(:div, concept.test_attempts.where(user: user_id).last.retry_time)
    	end
		elsif !concept.test_papers.where(user: user_id).last.nil?
			link_to customized_concept_student_detail_path(concept, user_id) do
				content_tag(:div, concept.test_papers.where(user: user_id).last.retry_time)
			end
		else
			0
		end
	end

  def join_group_button(courses, collect_course, group)
    
    if courses.where(title: collect_course.title, overview: collect_course.overview).count != 0
      link_to "已加入到此群組", collect_course_join_group_path(collect_course, @group), class: "btn btn-default disabled"
    else
      link_to "加入到此群組", collect_course_join_group_path(collect_course, group), class: "btn btn-default"
    end
  end

  def render_course_right_info(course, customized_concepts, group)
    if current_user.has_role? :student
      render  partial: "courses/list_customized_concept", locals: {customized_concepts: customized_concepts, group: group}
    else
      if current_user.teacher.id == course.teacher_id
        # TEACHER CAN EDIT, DELETE
        render  partial: "courses/course_concept_list", locals: {customized_concepts: customized_concepts, group: group}
      else
        # ONLY SHOW CONCEPT MAP
        render  partial: "courses/list_customized_concept", locals: {customized_concepts: customized_concepts, group: group}
      end
    end
  end

  def test_total_count(concept)
    if concept.test_paper_questions.first != nil
      concept.test_paper_questions.first.test_paper_options.count
    else
      concept.tests.count
    end
  end

  def build_test(concept, group, tests)
    if concept.test_paper_questions.first == nil
      link_to '建立考題', new_customized_concept_test_paper_question_path(concept, group: group), class: "btn btn-default"
    else
      link_to('移除考題', customized_concept_test_paper_question_path(concept, tests.last.id), method: :delete ,class: "btn btn-danger")
    end
  end

  def build_test_from_database(concept)
    if concept.test_paper_questions.first == nil
      link_to '題庫出題', build_by_database_path(concept), class: "btn btn-default"
    end
  end


end

