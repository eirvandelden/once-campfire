if Rails.env.production? && ENV["CAMPFIRE_SELF_WEBHOOK_URL"].present?
  ExceptionNotification::Once::Campfire.install!(
    webhook_url: ENV.fetch("CAMPFIRE_SELF_WEBHOOK_URL"),
    app_name: "Campfire",
    background: :active_job
  )
end
