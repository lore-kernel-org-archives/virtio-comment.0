Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74901EAC7
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791239; cv=none; b=mkBkilbwb0/zD+AkZUiVEF6FZZPTILD8WoBEQWPeDSrgveEDPd2EJGNm2lgpoM7dryj9Yx88MGF8F/Yij+bt3d/i5+IglI4Vxks9f8Ab2R+eeX9cJbDGR79VUNf91PeLNDQS4XdtC7YyFRlwv83Bcx45eBvDVHfgTHxnEk4FUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791239; c=relaxed/simple;
	bh=FoQo606NoQyfRS028S1J+0DMh6smGTVV8u+ONQDkVtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Na9vVL7rgZnvtLneEQJtX99GnEv4RDueze72JRKSJGjg8xHjM8LlsgsgEtNNY5nx+iM8hgreeIa+JhFiNNlezf8ch9GMI35FKPf7+f/jFSPSaO7bQjgaXR5fTupUgAoCf+j9i3iWcQM3qY4YxIx6gsx8lZsrwSUSM49dHoQlzss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoSKpFu6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoSKpFu6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6fd513f18bso273225466b.3
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720791235; x=1721396035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sr3vulOY7DySFP6SAEPHsC2me1xa+toH/cKzSsjI2kY=;
        b=WoSKpFu6mssoNFuSw8uKBiKGXcd3UTlU+wj5VSTLZRvBLYLH+I0arHwXx2KDjPxUzL
         wOZiqLh0ACphVMIXHnigwxJR0UYUK+Es3eRWjR+lVrrRQ9OONtI+WGv3uBVKH3CQKW70
         rJqmnqXAHxnqjPRS6mV1+CSmZZl1EPW/Wy1uwnwj1La4Ufip/eX3ybppyXBI8R7yqAS6
         BijDE1760h+ROj/eRGcEsjbK3rGZrge64Uz5LqH6uBwHjniunl0z9wIFeSP//Iz0FBA4
         uXASF5RmaVmsqgcYIJu6ISHlk60eW2KkE6eiV+Dymr98/25crwTgQbhFfDeknXKYA70F
         pt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720791235; x=1721396035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sr3vulOY7DySFP6SAEPHsC2me1xa+toH/cKzSsjI2kY=;
        b=TzW+TK/Ug+JRusO9/1rv+CHocklCIIgKOg4DIvkH3VVLXZ8I5R0zrzQekS+P4GEAxZ
         WswpsBP4BT6QzkLXsAcY0dWbfgnJNgnKhZYeHXjmOl0m8yCsNxdVCOXxo1t1ZsB3i2Co
         n6zuYzWgUJ5xCPcz5KSbVJpEMAJxIrPRD99FkM90N5h+eboMt18WrkbkDpimTydVmPT2
         n5a9tEvSiDT3W5jq0YlM1jUhjrwpRxnCCSOYLTiN8nCgJRHrgxJEmCb9EK/yTqkBDszs
         b4hy0ckoNwOO2rYgdH/apKcVnxokbrQCZsP5YJkMXatPU7urP40QYdgzxQNLjoGOnyMD
         X59w==
X-Gm-Message-State: AOJu0YygcFnS+5o0ijoSwybcJmlAz0Q7L8XBNlus+T4OzePMu6do1V/T
	VdBX5VXEWteAD9mNJDcczBG2nPAf1PLasMeRsEmwOkv1Qf3K9Q7gICdMaT1q
X-Google-Smtp-Source: AGHT+IFQNiYIRZpGLK0QvEZsPMZ1kz9Am6z8zfLXNPMFxhox7yDb+4ClWrBc9QrnjchxAhS+9IIjrw==
X-Received: by 2002:a17:907:868e:b0:a72:4d91:6223 with SMTP id a640c23a62f3a-a780b8849cbmr898359566b.62.1720791235080;
        Fri, 12 Jul 2024 06:33:55 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc6c0sm346084266b.44.2024.07.12.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:33:54 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <pandit.parav@gmail.com>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1] editorial: replace hyperref with ref
Date: Fri, 12 Jul 2024 16:33:42 +0300
Message-Id: <20240712133342.3271710-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parav Pandit <pandit.parav@gmail.com>

Replace hyperreference with the name reference.
Fix the broken reference link for the DEVICE_STATUS part.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
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
 device-parts.tex                | 19 ++++++++++---------
 3 files changed, 14 insertions(+), 13 deletions(-)

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
index 7384408..3b9cb44 100644
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
@@ -215,7 +216,7 @@ \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
 
 \field{queue_notify_off} and \field{queue_notif_config_data} corresponds to the
 fields in \field{struct virtio_pci_common_cfg} described in
-\hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common configuration space}.
+\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
 
 One or multiple instance of the device part VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist
 in the get and set commands, each such device part corresponds to a unique
-- 
2.34.1

