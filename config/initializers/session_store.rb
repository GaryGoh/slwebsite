# Be sure to restart your server when you modify this file.

Slwebsite::Application.config.session_store :cookie_store, {key: '_slwebsite_session',
                                                            :expire_after => 30.minutes}
