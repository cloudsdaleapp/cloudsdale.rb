module Cloudsdale; end

module Cloudsdale::Models
	class Ban < Base
		property :reason
		property :due
		property :created_at
		property :updated_at
		property :revoke
		property :offender_id
		property :enforcer_id
		property :jurisdiction_id
		property :jurisdiction_type
		property :has_expired
		property :is_active
		property :is_transient

	end
end