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
end
