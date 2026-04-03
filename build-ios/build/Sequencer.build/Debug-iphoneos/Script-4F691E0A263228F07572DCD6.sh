#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/admin/legion-stage-2-ios-port/build-ios
  /Users/admin/legion-stage-2-ios-port/build-ios/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/Custom/juceaide pkginfo App /Users/admin/legion-stage-2-ios-port/build-ios/Sequencer_artefacts/JuceLibraryCode/Sequencer/PkgInfo
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/admin/legion-stage-2-ios-port/build-ios
  /Users/admin/legion-stage-2-ios-port/build-ios/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/Custom/juceaide pkginfo App /Users/admin/legion-stage-2-ios-port/build-ios/Sequencer_artefacts/JuceLibraryCode/Sequencer/PkgInfo
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/admin/legion-stage-2-ios-port/build-ios
  /Users/admin/legion-stage-2-ios-port/build-ios/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/Custom/juceaide pkginfo App /Users/admin/legion-stage-2-ios-port/build-ios/Sequencer_artefacts/JuceLibraryCode/Sequencer/PkgInfo
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/admin/legion-stage-2-ios-port/build-ios
  /Users/admin/legion-stage-2-ios-port/build-ios/libs/JUCE/tools/extras/Build/juceaide/juceaide_artefacts/Custom/juceaide pkginfo App /Users/admin/legion-stage-2-ios-port/build-ios/Sequencer_artefacts/JuceLibraryCode/Sequencer/PkgInfo
fi

