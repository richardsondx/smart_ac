class HealthStatus < ApplicationRecord
  belongs_to :device

  STATUS_LIST = %w(
    needs_service
    needs_new_filter
    gas_leak
  )
end
