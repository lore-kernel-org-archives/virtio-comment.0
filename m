Received: from xvfrnhpk.outbound-mail.sendgrid.net (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98263C8
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.245.32.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720968028; cv=none; b=Cu7rWMv5LVeStTr6MauRW+bxy/Htkmge8AfWo9hwcOK4p3slbnAleuah4Ji6ckFHaursiYwxSfzDzL8k1VWC/UYt2r83gHSvk/QrSn2uBP3Q49vXpim/ITwEast3u8v+R/YlXnfngWNO0HvdSxIEVrGtR2lV2vkkbgSLOk94vI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720968028; c=relaxed/simple;
	bh=rAL/K0P8D1u1RVuCEHrSq+6CporzFQKTpHdAYbWREQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=G4CSzB43xF2t/VwtPH7RXsMOuDBXAJXbr9KOA+/A3smM6RrqFl+R5S/skRReeQyvfggn+ALY9/c/io/fLuNwEg5x0gU8zUOgLkgC2aAzWAicpNqEmrS8iiMIaAtNTF11DWqxkqHnGDh0lWHfugF5MKYX2BYzDbHvk0IJ5bF40yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=pass smtp.mailfrom=sendgridstats.nvidia.com; dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b=qVpogKFm; arc=none smtp.client-ip=168.245.32.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sendgridstats.nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qVpogKFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
	h=from:subject:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:from:subject:to;
	s=s1; bh=4JCBPtfumxefsxMLu2bFALgp1Q33s4aGQ2WPqCThdNI=;
	b=qVpogKFmqvcCk7fE0mXYd2WW/nwhK/C19hqF1YCcO2I5Nj9z1aQGojOSZIyIFMDq4+K5
	U8QFlyYDfykFPUfmIF6IlevziLCuIcJ3PYGZARcMrTch1ztkfa30aa49tJKVkSaE3M2HZK
	9njqrck+7SD7/dORIlwHZ/x2AEqFJDWsNHnzNRNczYZ08dN9qw7dmRI2s4Rvk3G/GXQ9N6
	O4LjTllAjmCzWcgZZS8hdiBuOjVSfS1LPvl6E94d4eJ4NFUJErFn0XefHOIFEO3mB54qsA
	F4WT+3MRbjQXoiIWdzW9z4WOQTNRVfN2wRbALulhVkPbWa4Ak/jLC7/l9+go1KyQ==
Received: by recvd-789cf85659-zfrlz with SMTP id recvd-789cf85659-zfrlz-1-6693E358-63
	2024-07-14 14:40:24.970366645 +0000 UTC m=+1459956.080352200
Received: from mtl123.mtl.labs.mlnx (unknown)
	by geopod-ismtpd-11 (SG)
	with ESMTP
	id mHzn1kP9Q3mYgWmuR482iA
	Sun, 14 Jul 2024 14:40:24.791 +0000 (UTC)
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [10.245.43.40])
	by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 46EEeOLk026228;
	Sun, 14 Jul 2024 17:40:24 +0300
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [127.0.0.1])
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 46EEeO6e3291814;
	Sun, 14 Jul 2024 17:40:24 +0300
Received: (from parav@localhost)
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Submit) id 46EEeOgr3291813;
	Sun, 14 Jul 2024 17:40:24 +0300
From: Parav Pandit <parav@nvidia.com>
Subject: [PATCH v4] editorial: replace hyperref with ref
Date: Sun, 14 Jul 2024 14:40:25 +0000 (UTC)
Message-Id: <20240714144023.3291803-1-parav@vr-arch-host06.mtvr.labs.mlnx>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EGKIzaBmeMpQo8dENF3BKzHhooF+oMOnrwKqptdheemMEs2maYobIgHNSi?=
 =?us-ascii?Q?3HpuxQn0J1ksZ0bJ2Es9Y+grYdP1QriNLpbf5Vl?=
 =?us-ascii?Q?gBuBFm6xUT+fUmE8ga4Fjzr8ZZvwguMZzacrTf4?=
 =?us-ascii?Q?50EYe29hL1Ju8+nPGyfNj=2FZQjmqF7PO0N5g=2FCV8?=
 =?us-ascii?Q?FKC4MY72O4fQ4Fvf3W5p=2FWs4c77PIayvQ+916Hi?=
 =?us-ascii?Q?R16e5kREhrZNEiST+sNwiPhStVg1AXZTr54IQT=2F?= =?us-ascii?Q?pou0?=
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
X-Entity-ID: u001.9Nu+sJkq3f0LJ/tZbyfOWA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

From: Parav Pandit <parav@nvidia.com>

Replace hyperreference with the name reference.
Fix the broken reference link for the DEVICE_STATUS part.

Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
Fixes: 617aa2d62a88 ("admin: Define common device parts")
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v3->v4:
- removed stale message-id from the commit log
v2->v3:
- fixed comment from Michael to add fixes tag to commit log
v1->v2:
- converted to named reference
v0->v1:
- this is a fixup patch to fix the editorial changes to
  drop hyper reference and fix one broken link.
- This is based on virtio-1.4 branch + admin parts patches
- fixed comments from Michael
- fixed typo of reference
- replaced table reference as named reference for better reading
  and direct reference
---
 admin-cmds-device-parts.tex     |  6 +++---
 admin-cmds-resource-objects.tex |  2 +-
 device-parts.tex                | 21 +++++++++++----------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index ab6e83b..ad3f8e3 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 Before performing any get or set operation for the device parts, the driver
 creates the device parts resource object
 VIRTIO_RESOURCE_OBJ_DEV_PARTS using the administration command
-\hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
+\nameref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
 The driver indicates the intended purpose (get or set) at the time of creating the
 device parts resource object.
 For the device parts resource object, both \field{resource_obj_specific_data} and
@@ -337,7 +337,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When there are multiple device parts in the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the device parts in the
 same order as listed in the table
-\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+\nameref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
 
 The device SHOULD respond with an error status for the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
@@ -455,7 +455,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When there are multiple device parts in the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver MUST set the device parts in the same
 order as listed in the table
-\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+\nameref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
 
 For the SR-IOV group type, the driver SHOULD NOT access the device configuration
 space described in section
diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index 388aa69..d0a6647 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -69,7 +69,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 \hline
 Resource object type & Name & Description \\
 \hline \hline
-0x000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS]{VIRTIO_RESOURCE_OBJ_DEV_PARTS} & Device parts object \\
+0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see \ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS} \\
 \hline
 0x001-0x1ff & - & Generic resource object range reserved \\
 \hline
diff --git a/device-parts.tex b/device-parts.tex
index 7384408..e6047db 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -70,7 +70,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
 \field{part_type} values.
 
 \field{selector.pci_common_cfg.offset} is the offset of the
-field in the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common config space}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
+field in the \nameref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
 otherwise it is reserved and set to 0.
 
 \field{selector.vq_index.index} is the index of the virtqueue. It is valid
@@ -89,17 +89,17 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
 \hline
 Type & Name & Description \\
 \hline \hline
-0x100 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES]{VIRTIO_DEV_PART_DEV_FEATURES} & Device features \\
+0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES} \\
 \hline
-0x101 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES]{VIRTIO_DEV_PART_DRV_FEATURES} & Driver features \\
+0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features, \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES} \\
 \hline
-0x102 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG]{VIRTIO_DEV_PART_PCI_COMMON_CFG} & PCI common configuration \\
+0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG} \\
 \hline
-0x103 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS]{VIRTIO_DEV_PART_DEVICE_STATUS} & Device status \\
+0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS} \\
 \hline
-0x104 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG]{VIRTIO_DEV_PART_VQ_CFG} & Virtqueue configuration \\
+0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG} \\
 \hline
-0x105 & \hyperref[sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG]{VIRTIO_DEV_PART_VQ_NOTIFY_CFG} & Virtqueue notification configuration \\
+0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG} \\
 \hline
 0x106 - 0x2FF & - & Common device parts range reserved for future \\
 \hline
@@ -157,7 +157,8 @@ \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
 One or multiple VIRTIO_DEV_PART_PCI_COMMON_CFG parts may exist in the
 get or set commands; each such part corresponds to a unique \field{offset}.
 
-\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}\label{par:VIRTIO_DEV_PART_DEVICE_STATUS}
+\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS}
 
 For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
 The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status as listed in
@@ -214,8 +215,8 @@ \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
 \end{lstlisting}
 
 \field{queue_notify_off} and \field{queue_notif_config_data} corresponds to the
-fields in \field{struct virtio_pci_common_cfg} described in
-\hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common configuration space}.
+fields in \field{struct virtio_pci_common_cfg} described in the
+\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
 
 One or multiple instance of the device part VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist
 in the get and set commands, each such device part corresponds to a unique
-- 
2.34.1

