__THIS_DIR=$(dirname "${BASH_SOURCE[0]}")
source $__THIS_DIR/factory_utils.sh


setup_staging_helper


echo "BASH_SOURCE = $BASH_SOURCE"
# Change directory into the staging copy and procede with the build
#echo "ATEMPTING TO CD"
#set +e

#cd "${_STAGED_REPO}"
set -e
REPO_DIR="${_STAGED_REPO}"
#REPO_DIR="."

source multibuild/common_utils.sh
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then export ARCH_FLAGS=" "; fi
source multibuild/travis_steps.sh


# I have no idea what this does
if [ -n "$IS_OSX" ]; then
    osx_stating_helper
fi

echo "=== END OF STAGE MULTIBUILD ==="
