module BookUsersHelper
	def status_updatable
	status_automated = Status.where(name: ["Borrowed", "Overdue"]).pluck(:id)
	status_allowed = Status.where.not(id: status_automated)
	return status_allowed
	end
end
