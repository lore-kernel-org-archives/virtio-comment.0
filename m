Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB08C10A3E
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720757714; cv=none; b=tvItnD6Dcnk1X9NW0lcLwefC/S84pG3sWUnZ9bPVeZVLuKimQH+EfCNMBVSXmYTZsCWucOJO8ik1XQdf0Hu23lX7oNKtZrTE3CLUh2kGKFUYwyswxngpYWL2kT0/+zEpTh9HVs8PdZa+yQMHvkHDfw9dsOMCD4WJyC4D8Hif95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720757714; c=relaxed/simple;
	bh=KX1Gc4TRu2wOVGiVT/P4da0TmvFzgmhdyuKeHFCFBYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyYUATozmhhE85SrGVUOVhdvn8qCGH03lIJdsfxTgY78aS+RxJWx+At9FWZ/p1KMpxl17gZLGqWLP/PnrUzgjMbZwiHfBZ1N+HM5yNu2CCMHGG1ndpEUYpkBs3TN5p47bkI6jKXK4mCeFt5mtcipFmFe2xsZmnQyHg0BjY5909o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NENHjzeg; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NENHjzeg"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77bf336171so279185766b.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720757710; x=1721362510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AcN7nX1oTMxlxr0ntLYzRpHMiQvD7sc0gwTBGxmoH0=;
        b=NENHjzegJyO1SfZWS6RDyyGFcudbFcjEItxD1fnSBs3N/Y5/nuzyHfB0RdnbYXzq3H
         F3vIEvdy6gW+Kx8nsalznRswGg+Ldg4FXn8KzuAznt/Om64w9wQEdrrOuPEWQzvsDpZq
         Eg5r72vzwC31XotEP928rsIRGOk/lf+EpN6CkJA51kCj43M6JBE4tmaUZ0ozIyDWjU/t
         4eDM808dhbreOygRpSLTYkN6iK+Rg0/Jc6ghwhqox+ophqR051YVyZzFyPD0G6JVzrfE
         hT4LLKNST2/HPuy/66zrvV+KqGU2NVBDxw2PPs9RLx6cpjP3qO1qz495SLpXZaXMucR2
         ylBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720757710; x=1721362510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AcN7nX1oTMxlxr0ntLYzRpHMiQvD7sc0gwTBGxmoH0=;
        b=exhB7qrWQ+B0UA/t5Vj/Gnd3/XKPazthLZh01JLxizY4CoLz+lHJORJKYzbqZUj7nP
         KJbnyY/zTOI3d5Qx+ESZVTk0Fk3L4Lrg82yaXNF/mcaSRe4xxmVBHPT4U1sGJS9LauE+
         u/t6dGpWGRt0A0TtbznDhDH8P5m1pnqpB0yo0h285PjoT093NHHVrlCYYKrXmsAG7M/4
         S+LDRh+2mxKGuc0q2c7FaqSAnmCstzGpBMR6EGoGf91gnYD2WWChw8BjAwLzHv1p3ESo
         eAh4uZBmM8Mn+Xg3lYdRYvzfDqn+ens8clNdtPRGBrqp/eR0CorllVHzSa8QlqtwOsje
         Ykww==
X-Gm-Message-State: AOJu0YyQ4t/Hstsk+xiaAJ+yLX0z4SKPlE4AfEB2tut6cZGNhuT4E4Wl
	5y7GwV593e8W0jS4HS0FFc6xIfRmPioda/N+p19co+2ubj/40Wa0NEb+3tyT
X-Google-Smtp-Source: AGHT+IGSarBkxVAqq8g0uJo62Lp+/X9qRlfj968lrZyRnE5K1/Mee3CORe/WXvWyQJTnVgbmUCke3A==
X-Received: by 2002:a17:906:478b:b0:a77:afd5:62aa with SMTP id a640c23a62f3a-a799cd00b6bmr116330666b.23.1720757710025;
        Thu, 11 Jul 2024 21:15:10 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dfb19sm309226966b.66.2024.07.11.21.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 21:15:09 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] editorial: replace hyperref with ref
Date: Fri, 12 Jul 2024 07:14:33 +0300
Message-Id: <20240712041433.3246718-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hyperreference with the reference.
Fix the broken link refernce for the DEVICE_STATUS part.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-parts.tex     |  6 +++---
 admin-cmds-resource-objects.tex |  2 +-
 device-parts.tex                | 19 ++++++++++---------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index ab6e83b..4aa1464 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 Before performing any get or set operation for the device parts, the driver
 creates the device parts resource object
 VIRTIO_RESOURCE_OBJ_DEV_PARTS using the administration command
-\hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
+\ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
 The driver indicates the intended purpose (get or set) at the time of creating the
 device parts resource object.
 For the device parts resource object, both \field{resource_obj_specific_data} and
@@ -337,7 +337,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When there are multiple device parts in the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the device parts in the
 same order as listed in the table
-\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+\ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
 
 The device SHOULD respond with an error status for the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
@@ -455,7 +455,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When there are multiple device parts in the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver MUST set the device parts in the same
 order as listed in the table
-\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+\ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order}.
 
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
index 7384408..47ad06d 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -70,7 +70,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
 \field{part_type} values.
 
 \field{selector.pci_common_cfg.offset} is the offset of the
-field in the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout]{Virtio PCI common config space}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
+field in the \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}. It is valid only when the \field{part_type} is set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
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

