module GroupsHelper

def is_group_leader(leader_id,student_id)
  leader_id == student_id ? true : false
end

end
