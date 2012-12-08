class Ban
	include DataMapper::Resource

	property :id,									String,
	property :reason,							String
	property :due,								Time
	property :created_at,					Time
	property :updated_at,					Time
	property :revoke,							Boolean
	property :offender_id,				String
	property :enforcer_id,				String
	property :jurisdiction_id,		String
	property :jurisdiction_type, 	String
	property :has_expired,				Boolean
	property :is_active,					Boolean
	property :is_transient,				Boolean

end