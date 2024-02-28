# Nokia-Leo-device-tree
A Work-In-Progress AOSP (Marshmallow) device tree for the Nokia 6300 4G

### Help Wanted

#### currently working:
+ build

#### partially working:
+ Android recovery(wrong dpi setting, options go off screen)

#### Other tidbits:
+ extract-files.sh and setup-makefiles.sh need lineage's extract_utils.sh and its dependencies to work.
i updated the proprietary-files.txt to exclude anything from the b2g folder so it shouldn't throw any more errors.

#### Building in Docker:
+ use Googles Docker image to build old versions of AOSP for best chances of success: https://android.googlesource.com/platform/build/+/main/tools/docker/

+ **you have to use Googles repo tool to pull AOSP ouside of docker, because the docker image uses python 2.7.4 as default, which the repo tool does not support anymore**

+ If you have the problem, that jack-server uses the entire swap, you have to build without -jXX, this unfortunately also slows down the entire build process, but thats my best solution right now

remove line 14:
```
&& echo "d06f33115aea44e583c8669375b35aad397176a411de3461897444d247b6c220  /usr/local/bin/repo" | sha256sum --strict -c - \
```
from the dockerfile before using "docker build...",
this line checks the pulled Google repo tool for errors, but the checksum is very old so this check fails and the build stops.
