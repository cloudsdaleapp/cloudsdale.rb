
class Cloudsdale::FayeClient
  attr_accessor :subscriptions

  def initialize
    @subscriptions = []
    @cli = Faye::Client.new('ws://push.cloudsdale.org/push')
  end

  def update_subscriptions(user, delegate)
    newsubs = []
    user[:clouds].each do |cloud|
      cloud_id = cloud[:id]
      newsubs << cloud_id
      next if has_subscription?(cloud_id)
      @cli.subscribe("/clouds/#{cloud_id}/chat/messages") do |msg|
        p msg
        delegate.message_received(cloud_id_for_channel(cloud_id), 
          Cloudsdale::Models::Message.new(msg))
      end
    end
  end

  def has_subscription?(cloud_id)
    subscriptions.each do |sub|
      return true if sub == cloud_id
    end
    false
  end

  def cloud_id_for_channel(channel)
    channel.split('/')[2]
  end
end
