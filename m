Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D1049628
	for <virtio-comment@lists.linux.dev>; Sat, 13 Jul 2024 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720894560; cv=none; b=OzjY/XQtHyVZsch3X0aBSvXWxMySX2cnuWaEZOZFPSCsNYprv15GXLTjce0LfJwOmXpJ+SGC7LDv7WbkQ0PLsREZT2FjITlKRFkBRVG96EPqDyUxLP0Mc0qtNx7JmKHPRjOaLWO+nRRVIL4aNE3PdM85NnkZkhqXQhwKi8dr3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720894560; c=relaxed/simple;
	bh=BRn1pUaqsRqaJnQe7BwfWLaMaepjZYszy9CmfL8Qz4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tdrfaasCO/iSjJidRUEPmznpQJjGGl6rMSP8B41dBWjQOsdj4F3Uo3/S5+HwhJZMFDccGurlwKoL4LmP3uoszoVBT7wn5WeYS04lPcNQOvZLiVc+ClY0dZFRj8aInrVItIKq9o7XoSQ2A2s2m23d/11jKqS9KGffqAKbU6aB9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIIYyZlP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIIYyZlP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eea7e2b073so38102751fa.0
        for <virtio-comment@lists.linux.dev>; Sat, 13 Jul 2024 11:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720894557; x=1721499357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzSozxX9buxJklC4DEEDlUqLrfjv/ynfdyamAzbGJOY=;
        b=lIIYyZlPu/q88xifP6h2wskQcRkED+Q5aIufQE1efiLltJggJetXr5fLW4aTg+CdVs
         ME4i9OeoyToe4spyyQzJmb+K0yylu/FxVt6udD7lmYJ2nsDQiLjq5EJE7iEhcyoYUNQb
         Lw6j9GrXIl5VEkQKQnTl0EOEI0Z5nph6oqPK0jnuwr88j8nZOYB+rNYx8xcd5WpJD2P9
         YHxC5IB2UyUwyye53L+0TUaZT1//rhyVDZzLbAbJtHXDkMZNDTAKnth2T2wwsIr5pSrm
         pygm1W+rSzEMnxBBwY1n6mZFJN5UGFh4EZim2gQc6QHZ/HcZ9bkDteeERebSL2ZOHFkH
         uRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894557; x=1721499357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzSozxX9buxJklC4DEEDlUqLrfjv/ynfdyamAzbGJOY=;
        b=mRjYHiYR6/Lsfqu6XDJ6jzEbRvwScwn8nErVQjBGZ3c6At9RI5kXg8yNb4SggY8zRJ
         gTMjEVkqo34fG5zCvJtxXpmPpmwENgqFOmPKc1R8WHvNuM18e7YawosOrJGggadAdSEa
         B2f3cmM65C20f8RqpmcipbBiSKikLN2VnilmNJUnl6eUsw19JWSt9YJvB9LWhw8FgQh+
         26KL3LWgrERGVV3wjfLxbt01LtnN4V84C7s9x9AzgLLqOb9nHGCK7qReXvjmeqNvH36i
         5RiCih1DfcM2Pxxpif5y/pRwk0PXswN5ONmpLrt7AVbB/G/Maa+DCH2Ad7PP5ovQb9Az
         59rQ==
X-Gm-Message-State: AOJu0YyDwlykZ+KZl7E6kY7r/Gh84Y4kK7g9K/VZu1MOZevs/gu8lr5g
	0uzv9eXcXl20B41ZAItv1RTwjze4NMvGKzrn7z3dIXTn9mJA0pp90nYGH/Yi
X-Google-Smtp-Source: AGHT+IHa2TQAeV2RDhMXLYd8t3A/lKoeKw+yDi4Lh8mcg18o0Ppl5ZlCMzd1rlIT73aotsV2mEuwCQ==
X-Received: by 2002:a05:6512:3f14:b0:52c:dea7:f22c with SMTP id 2adb3069b0e04-52eb9990e9dmr11152249e87.2.1720894556309;
        Sat, 13 Jul 2024 11:15:56 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b25528f79sm1022574a12.53.2024.07.13.11.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 11:15:56 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <pandit.parav@gmail.com>,
	Parav Pandit <parav@nvidia.com>
Subject: [PATCH v2] editorial: replace hyperref with ref
Date: Sat, 13 Jul 2024 21:15:40 +0300
Message-Id: <20240713181540.3284147-1-parav@nvidia.com>
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
v1->v2:
- used named reference instead plain one for common config layout
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

