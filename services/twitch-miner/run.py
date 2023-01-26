from TwitchChannelPointsMiner import TwitchChannelPointsMiner
from TwitchChannelPointsMiner.classes.Chat import ChatPresence
from TwitchChannelPointsMiner.classes.Settings import FollowersOrder
from TwitchChannelPointsMiner.classes.entities.Streamer import StreamerSettings

twitch_miner = TwitchChannelPointsMiner(
    username="dhananjaipai",
    streamer_settings=StreamerSettings(
        follow_raid=True,                       # Follow raid to obtain more points
        claim_drops=True,                       # We can't filter rewards base on stream. Set to False for skip viewing counter increase and you will never obtain a drop reward from this script. Issue #21
        watch_streak=True,                      # If a streamer go online change the priority of streamers array and catch the watch screak. Issue #11
        chat=ChatPresence.ONLINE,               # Join irc chat to increase watch-time [ALWAYS, NEVER, ONLINE, OFFLINE]
    )
)
twitch_miner.analytics(host="127.0.0.1", port=5000, refresh=5, days_ago=7)   # Analytics web-server
twitch_miner.mine(
    [
        "itzu_gaming",
    ],
    followers=True,
    followers_order=FollowersOrder.DESC
)