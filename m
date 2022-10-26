Return-Path: <zouqian4@huawei.com>
From: "zouqian (D)" <zouqian4@huawei.com>
Subject: [Resend][PATCH] content: reserve virtio device ID for QingTian Box
 (virtio-qtbox) devices
Date: Wed, 26 Oct 2022 14:53:31 +0000
Message-ID: <f28fbe7ab3884771803f343102e7b683@huawei.com>
MIME-Version: 1.0
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, "Longpeng (Mike, Cloud Infrastructure Service
 Product Dept.)" <longpeng2@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Huawei Cloud is one of the famous public cloud providers, and its hyperviso=
r is named QingTian. We plan to support the QingTian Box (virtio-qtbox) tha=
t provides some guest-aware features ( for high performance, security, etc.=
 ) in the future, and at least one of them is already in development. The d=
ata transmission is based on the Virtio, so we want to reserve a device id =
( 43 ) for the virtio-qtbox.

virtio-qtbox can help user carve out some resources (e.g. vcpu, mem, pci_de=
v) from the VM and then use these resources to start a sandbox for the user=
. The usage quite likes the software enclave which Nitro already supported,=
 but we have much wider usage, for example, running unikernel + app (e.g. O=
SV + Redis) in the sandbox, it would provide much better performance than t=
he traditional os.

Since virtio-qtbox is developed for virtualization scenarios to isolate res=
ources, it supports live migration and crashes recovery. virtio-qtbox lower=
s the technical threshold for implementing resource isolation in VMs and he=
lps users have a more efficient and secure development platform based on cl=
oud services.

Signed-off-by: Longpeng <longpeng2@huawei.com>
Signed-off-by: zouqian <zouqian4@huawei.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 899df5f..2a6f9de 100644
--- a/content.tex
+++ b/content.tex
@@ -2893,6 +2893,8 @@ \chapter{Device Types}\label{sec:Device Types}  \hlin=
e
 42         &   RDMA device \\
 \hline
+43         &   QingtianBox \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--
1.8.3.1

