Return-Path: virtio-comment-return-876-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BE5F9860B3
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Oct 2019 10:22:44 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Thu, 24 Oct 2019 13:22:34 +0300
Message-Id: <20191024102234.41927-3-ybettan@redhat.com>
In-Reply-To: <20191024102234.41927-1-ybettan@redhat.com>
References: <20191024102234.41927-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] [PATCH-RFC 2/2] Added a guide for adding a new virtio device
To: virtio-comment@lists.oasis-open.org
Cc: Yoni Bettan <yonibettan@gmail.com>, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Yoni Bettan <yonibettan@gmail.com>

This guide should give a pattern to create and implement a new virtio devic=
e
in QEMU-KVM with example for each one of the 3 main parts:
    * the specification
    * the device
    * the linux driver

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 README.md | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/README.md b/README.md
index f2fa5d0..bf85e4f 100644
--- a/README.md
+++ b/README.md
@@ -146,6 +146,36 @@ Fixes: https://github.com/oasis-tcs/virtio-spec/issues=
/NNN
 and asking for a vote. </li>
 </ol>
=20
+
+## Steps to create a new virtio device
+
+When creating a new device there are some steps we should follow:
+
+1. write the device specification
+    * merge it into the official virtio specification (this repository) as=
 described
+      * `git clone git clone https://github.com/oasis-tcs/virtio-spec.git`
+      * add your device
+        * use [ybettan/virtio-spec/increment-edu branch][ybettan/virtio-sp=
ec/increment-edu branch] as reference
+      * send your patch to virtio-comment@lists.oasis-open.org (mailing li=
st) for review
+  =20
+2. write the device implementation
+    * you can look at the example device at  [ybettan/qemu/virtio branch][=
ybettan/qemu/virtio branch] located in my fork of the Qemu project
+    * make sure to follow the full commit to find all other files related
+    * once it=E2=80=99s done, check the [wiki-qemu][wiki-qemu] for the ful=
l =E2=80=9Chow to contribute=E2=80=9D to Qemu guide
+
+3. write the Linux driver for this device
+    * you can look at the example driver at  [ybettan/QemuDeviceDrivers-ma=
ster branch][ybettan/QemuDeviceDrivers-master branch]
+    * in this repository, you have a README.md files describing how to com=
pile the driver and use the device
+    * once it=E2=80=99s done, send the patch to this mailing list: virtual=
ization@lists.linux-foundation.org
+   =20
+   =20
+[ybettan/virtio-spec/increment-edu branch]: https://github.com/ybettan/vir=
tio-spec/tree/increment-edu
+[ybettan/qemu/virtio branch]: https://github.com/ybettan/qemu/tree/virtio/=
hw/virtio
+[ybettan/QemuDeviceDrivers-master branch]: https://github.com/ybettan/Qemu=
DeviceDrivers
+[wiki-qemu]: https://wiki.qemu.org/Contribute
+
+
+
 <h3>Contact</h3>
 <p>Please send questions or comments about <a href=3D"https://www.oasis-op=
en.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered=
-work">OASIS TC GitHub repositories</a> to <a href=3D"mailto:robin@oasis-op=
en.org">Robin Cover</a> and <a href=3D"mailto:chet.ensign@oasis-open.org">C=
het Ensign</a>.  For questions about content in this repository, please con=
tact the TC Chair or Co-Chairs as listed on the the virtio TC's <a href=3D"=
https://www.oasis-open.org/committees/virtio/">home page</a>.</p>
 </div>
--=20
2.21.0


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

