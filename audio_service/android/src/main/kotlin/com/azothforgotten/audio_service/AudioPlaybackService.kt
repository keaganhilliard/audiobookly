//package com.azothforgotten.audio_service
//
//
//private const val MY_MEDIA_ROOT_ID = "media_root_id"
//private const val MY_EMPTY_MEDIA_ROOT_ID = "empty_root_id"
//
//class MediaPlaybackService : MediaBrowserServiceCompat() {
//
//    private var mediaSession: MediaSessionCompat? = null
//    private lateinit var stateBuilder: PlaybackStateCompat.Builder
//
//    override fun onCreate() {
//        super.onCreate()
//
//        // Create a MediaSessionCompat
//        mediaSession = MediaSessionCompat(baseContext, LOG_TAG).apply {
//
//            // Enable callbacks from MediaButtons and TransportControls
//            setFlags(MediaSessionCompat.FLAG_HANDLES_MEDIA_BUTTONS
//                    or MediaSessionCompat.FLAG_HANDLES_TRANSPORT_CONTROLS
//            )
//
//            // Set an initial PlaybackState with ACTION_PLAY, so media buttons can start the player
//            stateBuilder = PlaybackStateCompat.Builder()
//                    .setActions(PlaybackStateCompat.ACTION_PLAY
//                            or PlaybackStateCompat.ACTION_PLAY_PAUSE
//                    )
//            setPlaybackState(stateBuilder.build())
//
//            // MySessionCallback() has methods that handle callbacks from a media controller
//            setCallback(MySessionCallback())
//
//            // Set the session's token so that client activities can communicate with it.
//            setSessionToken(sessionToken)
//        }
//    }
//}