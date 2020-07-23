# BLINK_TOOLS_PATH=~/tmp/blink_tools bash lighthouse-core/scripts/chromium-web-tests/download-blink-tools.sh
# BLINK_TOOLS_PATH=~/tmp/blink_tools bash lighthouse-core/scripts/chromium-web-tests/run-web-tests.sh

if [ x"$BLINK_TOOLS_PATH" == x ]; then
  echo "Error: Environment variable BLINK_TOOLS_PATH not set"
  exit 1
fi

# Add typ to python path. The regular method assumes there is a chromium checkout.
# See https://source.chromium.org/chromium/chromium/src/+/master:third_party/blink/tools/blinkpy/common/path_finder.py;l=35;drc=61e88d0e7fa9217a8f5395edd0e03b1c1991257c
PYTHONPATH="${PYTHONPATH}:$BLINK_TOOLS_PATH/third_party/typ" python \
  "$BLINK_TOOLS_PATH/third_party/blink/tools/run_web_tests.py" \
  --layout-tests-directory="$HOME/src/devtools/devtools-frontend/test/webtests" \
  --build-directory="$HOME/src/lighthouse/.test_cache/791019/out" \
  http/tests/devtools/lighthouse