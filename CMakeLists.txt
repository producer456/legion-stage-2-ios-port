cmake_minimum_required(VERSION 3.22)
project(Sequencer VERSION 1.0.0)

add_subdirectory(libs/JUCE)

juce_add_gui_app(Sequencer
    PRODUCT_NAME "Legion Stage 2"
    COMPANY_NAME "Dev"
    BUNDLE_ID "com.dev.legionstage2"
    IS_AU_PLUGIN_HOST TRUE
    BACKGROUND_AUDIO_ENABLED TRUE
    FILE_SHARING_ENABLED TRUE
    DOCUMENT_BROWSER_ENABLED TRUE
    REQUIRES_FULL_SCREEN TRUE
    PLIST_TO_MERGE "${CMAKE_CURRENT_SOURCE_DIR}/resources/LaunchScreen.plist"
    ICON_FILE "${CMAKE_CURRENT_SOURCE_DIR}/resources/icon_1024.png"
    CUSTOM_XCASSETS "${CMAKE_CURRENT_SOURCE_DIR}/resources/Images.xcassets"
    IPHONE_SCREEN_ORIENTATIONS UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight
    IPAD_SCREEN_ORIENTATIONS UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight
)

set_target_properties(Sequencer PROPERTIES JUCE_SHOULD_ADD_STORYBOARD FALSE)

set(XCASSETS "${CMAKE_CURRENT_SOURCE_DIR}/resources/Images.xcassets")
target_sources(Sequencer PRIVATE "${XCASSETS}")
set_source_files_properties("${XCASSETS}" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)

set_target_properties(Sequencer PROPERTIES
    XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
    XCODE_ATTRIBUTE_CODE_SIGN_ENTITLEMENTS "${CMAKE_CURRENT_SOURCE_DIR}/resources/Legion Stage.entitlements"
)

juce_generate_juce_header(Sequencer)

target_sources(Sequencer PRIVATE
    src/Main.cpp
    src/MainComponent.h
    src/MainComponent.cpp
    src/PluginHost.h
    src/PluginHost.cpp
    src/GainProcessor.h
    src/GainProcessor.cpp
    src/MidiClip.h
    src/ClipPlayerNode.h
    src/ClipPlayerNode.cpp
    src/SequencerEngine.h
    src/SequencerEngine.cpp
    src/PianoRollComponent.h
    src/PianoRollComponent.cpp
    src/Midi2Handler.h
    src/Midi2Handler.cpp
    src/QuickKeysHandler.h
    src/QuickKeysHandler.cpp
    src/AUScanner.h
    src/AUScanner.mm
    src/DawTheme.h
    src/DawLookAndFeel.h
    src/WalkmanLookAndFeel.h
    src/GlassLookAndFeel.h
    src/NoirLookAndFeel.h
    src/TerminalLookAndFeel.h
    src/JournalLookAndFeel.h
    src/LinenLookAndFeel.h
    src/IceLookAndFeel.h
    src/IndigoLookAndFeel.h
    src/FrostLookAndFeel.h
    src/KeystageLookAndFeel.h
    src/BlueprintLookAndFeel.h
    src/SpectrumComponent.h
    src/LissajousComponent.h
    src/GForceComponent.h
    src/GeissComponent.h
    src/ProjectMComponent.h
    src/TouchPianoComponent.h
    src/MixerComponent.h
    src/SplashComponent.h
    src/ThemeManager.h
    src/TimelineComponent.h
    src/TimelineComponent.cpp
    src/UpdateChecker.h
    src/UpdateChecker.cpp
    src/UpdateDialog.h
    src/UpdateDialog.cpp
    src/MidiCaptureBuffer.h
    src/GamepadHandler.h
    src/GamepadHandler.cpp
    src/GamepadOverlayComponent.h
)

target_compile_definitions(Sequencer PRIVATE
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_PLUGINHOST_AU=1
)

target_link_libraries(Sequencer PRIVATE
    juce::juce_audio_basics
    juce::juce_audio_devices
    juce::juce_audio_formats
    juce::juce_audio_plugin_client
    juce::juce_audio_processors
    juce::juce_audio_utils
    juce::juce_core
    juce::juce_data_structures
    juce::juce_events
    juce::juce_graphics
    juce::juce_gui_basics
    juce::juce_gui_extra
    juce::juce_dsp
)

# IOKit framework for USB HID (QuickKeys handler — macOS only)
if(APPLE AND NOT CMAKE_SYSTEM_NAME STREQUAL "iOS")
    find_library(IOKIT_FRAMEWORK IOKit)
    if(IOKIT_FRAMEWORK)
        target_link_libraries(Sequencer PRIVATE ${IOKIT_FRAMEWORK})
    endif()
endif()
