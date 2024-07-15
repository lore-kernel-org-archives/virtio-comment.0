Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F91CF92
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062218; cv=none; b=h5G6tloGB9PgFl6PmvLucnVscIiuR/GfJ/CU7DT5KlMrZO6OL9s3NN0C9410KqaO0imfhSH9NSGNxxnJ2Z6sbT7IMNJUKl5Yw6Assux948Nv5yaKZeRIoiCsOent18VGAsgEFkmPy4LerC2/1mZxwZ6wwotaMhEqZTDcbm6FZm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062218; c=relaxed/simple;
	bh=F95yXaWIQra2E75XT4e5GBt+Op3N38Ru/XKfwkNpGxk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DjA7PNV6qddfVxiFfl4WO9ZVLdrrlhRy7Q3U1cuQ+Cwagw6hIGJP3oPH0fHFpX2jVmMDBmKX+PjOXJwAsSE9TfaMYJeaMSwQNWQuPSPI1w+VPRFcHOOZ8n47lHVltocmyPB2n0bM2i/V1JX6VTZoK6HGkWZe8/pGqMl6q3CpIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dnW8j4Qz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dnW8j4Qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/fm2eqcQr/dEH+LXJOniYDNHl+PTiisyomi/U2tvTE=;
	b=dnW8j4Qzmbn4Px4Eqi8nxIPmuRzFFNSfrgXobT2jprfBsSLuhNNJaYn25F61jZwQWus5vx
	4keoe+Kxqarr+fme4LSxyIQvR+9djsQlftbLd5QS3D/HWI0yrCctp3Fkbhj8o2QKs08CdJ
	0F7oYu0pDe1ts8JbwcOH5zpV+gBXIxo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-g_EyhN1uPJ-FULFhp-rhZw-1; Mon, 15 Jul 2024 12:50:12 -0400
X-MC-Unique: g_EyhN1uPJ-FULFhp-rhZw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e9557e312so3748358e87.0
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062210; x=1721667010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/fm2eqcQr/dEH+LXJOniYDNHl+PTiisyomi/U2tvTE=;
        b=LTQLR5dNUUMD7JRHFCEsiV2TLqungvU88tqTbeqC1nKRdGzaTJZpom3DpxhwqPTrtJ
         xDVbZEfbEQxhNbEdAjuR7dOGY8L+bh0hCxxmwQDuDiYz/X/RaDQnuEYQVZIexQZ40GcX
         kAfj1xkHE0Pf3yJn2G6hxPhboD741WKbfNbD6zhPXZNrZH3n1tl7E77pbYgC7vZA6vxU
         meuVAUe7pGShfh31sDbItB+o9KQbmXUFPQx40S0RCPKLOoHt639oxEJfbheEkFxa7iUp
         L3RE50yFScyceQS3C3AF66MSr0fq0Zt35w6U/5rcEFfFRbqekMQUD95eU6HCxprTlBeP
         rfEg==
X-Gm-Message-State: AOJu0Yx7cvi05rneXVpFuGwqSZe+RzYdpzaOJsuu8rp2MXHCw0ONbraS
	PkROzgMOFXrYECi1QQgh5uIcoRbzH4BTAsk1eI4XPLcYQnM+TmD9rHGVL4SeZ75LAynPyddbPQe
	0BKD7HyxuesFwDUe6Abqxe+12A5UxRFEvb/p2IzLCkMeqthvVMO91cjpbLv4wJdQSww4wBcgArJ
	Zl35ydaHK2mtqvftu0TzbI4gzlJiG0OBpYETom05n5BQ==
X-Received: by 2002:a05:6512:3981:b0:52c:c9ce:be8d with SMTP id 2adb3069b0e04-52ede1d3161mr57373e87.57.1721062210018;
        Mon, 15 Jul 2024 09:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBuU9WC6hQY5/4aS0REn9rZOkoXJ69aymjASq2bgTsFEItjzAm2+YxWGbOvwaSdgUBuTWC5Q==
X-Received: by 2002:a05:6512:3981:b0:52c:c9ce:be8d with SMTP id 2adb3069b0e04-52ede1d3161mr57325e87.57.1721062208553;
        Mon, 15 Jul 2024 09:50:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc2efsm130612975e9.36.2024.07.15.09.50.07
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:50:08 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:50:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 9/9] admin: get rid of _ in labels
Message-ID: <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.mst@redhat.com>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

it's not the 1st time we find out underscores in labels confuse
latexdiff machinery when generating html.
Errors look like this:

! Missing \endcsname inserted.
<to be read again>
                   \unhbox
....

?
! Emergency stop.
<to be read again>
                   \unhbox

To fix, convert underscores in labels to dashes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 admin-cmds-capabilities.tex      |  8 +++---
 admin-cmds-device-parts.tex      | 14 +++++-----
 admin-cmds-legacy-interface.tex  | 10 ++++----
 admin-cmds-resource-objects.tex  | 10 ++++----
 admin.tex                        | 32 +++++++++++------------
 device-parts.tex                 | 24 ++++++++---------
 device-types/can/description.tex |  6 ++---
 device-types/net/description.tex | 44 ++++++++++++++++----------------
 8 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
index 9865254..f917a0d 100644
--- a/admin-cmds-capabilities.tex
+++ b/admin-cmds-capabilities.tex
@@ -60,7 +60,7 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 \hline
 Id & Name & Description  \\
 \hline \hline
-0x0000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_DEV_PARTS_CAP]{VIRTIO_DEV_PARTS_CAP} & Device parts capability \\
+0x0000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO-DEV-PARTS-CAP]{VIRTIO_DEV_PARTS_CAP} & Device parts capability \\
 \hline
 0x0001-0x07ff & - & Generic capability for all device types \\
 \hline
@@ -79,7 +79,7 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 \item VIRTIO_ADMIN_CMD_DRIVER_CAP_SET
 \end{enumerate}
 
-\paragraph{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}
+\paragraph{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-CAP-ID-LIST-QUERY}
 
 This command queries the bitmap of capability ids
 listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
@@ -119,7 +119,7 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 The array is also allowed to be larger and to additionally include an arbitrary
 number of all-zero entries.
 
-\paragraph{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}
+\paragraph{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-DEVICE-CAP-GET}
 
 This command gets the device capability for the specified capability
 id \field{id}.
@@ -151,7 +151,7 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 by the device. Each capability uses different capability specific
 \field{cap_specific_data} and is described separately.
 
-\paragraph{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}
+\paragraph{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-DRIVER-CAP-SET}
 
 This command sets the driver capability, indicating to the device which capability
 the driver uses. The driver can set a resource object limit capability that is smaller
diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index e64b756..4c88045 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -37,7 +37,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 the device itself will not initiate any transport requests.
 
 \paragraph{VIRTIO_DEV_PARTS_CAP}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_DEV_PARTS_CAP}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO-DEV-PARTS-CAP}
 
 The capability VIRTIO_DEV_PARTS_CAP indicates the device parts resource objects limit.
 \field{cap_specific_data} is in the format \field{struct virtio_dev_parts_cap}.
@@ -54,13 +54,13 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 \field{set_parts_resource_objects_limit} indicates the supported device parts
 resource objects for restoring the device parts.
 
-\paragraph{VIRTIO_RESOURCE_OBJ_DEV_PARTS}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS}
+\paragraph{VIRTIO_RESOURCE_OBJ_DEV_PARTS}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO-RESOURCE-OBJ-DEV-PARTS}
 
 A device parts resource object is used to either get or set the device parts.
 Before performing any get or set operation for the device parts, the driver
 creates the device parts resource object
 VIRTIO_RESOURCE_OBJ_DEV_PARTS using the administration command
-\nameref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
+\nameref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-CREATE}.
 The driver indicates the intended purpose (get or set) at the time of creating the
 device parts resource object.
 For the device parts resource object, both \field{resource_obj_specific_data} and
@@ -96,7 +96,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 \end{enumerate}
 
 \subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-METADATA-GET}
 
 This command obtains the metadata of the device parts. This metadata includes
 the maximum size of the device parts, the count of device parts, and a list of
@@ -166,7 +166,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 for the response.
 
 \subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_GET}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_GET}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-GET}
 
 This command captures the device parts. For the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_GET, \field{opcode} is set to 0xf.
@@ -210,7 +210,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 If the requested device part does not exist, the device skips the device part
 without any error.
 
-\subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_SET}
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_PARTS_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-SET}
 
 This command sets one or multiple device parts. For the command
 VIRTIO_ADMIN_CMD_DEV_PARTS_SET, \field{opcode} is set to 0x10.
@@ -242,7 +242,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 When the command fails with a status other than VIRTIO_ADMIN_STATUS_OK, the
 device does not have any side effects.
 
-\subparagraph{VIRTIO_ADMIN_CMD_DEV_MODE_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_MODE_SET}
+\subparagraph{VIRTIO_ADMIN_CMD_DEV_MODE_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-MODE-SET}
 
 This command either stops the device from initiating any transport requests or
 resumes the device operation. For the command VIRTIO_ADMIN_CMD_DEV_MODE_SET,
diff --git a/admin-cmds-legacy-interface.tex b/admin-cmds-legacy-interface.tex
index 7b1ce4e..56142aa 100644
--- a/admin-cmds-legacy-interface.tex
+++ b/admin-cmds-legacy-interface.tex
@@ -30,7 +30,7 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 that little-endian format is assumed unconditionally.
 
 \paragraph{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-COMMON-CFG-WRITE}
 
 This command has the same effect as writing into the virtio common configuration
 structure through the legacy interface. The \field{command_specific_data} is in
@@ -60,7 +60,7 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 This command has no command specific result.
 
 \paragraph{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-COMMON-CFG-READ}
 
 This command has the same effect as reading from the virtio common configuration
 structure through the legacy interface. The \field{command_specific_data} is in
@@ -96,7 +96,7 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 \field{data}.
 
 \paragraph{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-DEV-CFG-WRITE}
 
 This command has the same effect as writing into the virtio device-specific
 configuration through the legacy interface. The \field{command_specific_data} is in
@@ -126,7 +126,7 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 This command has no command specific result.
 
 \paragraph{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-DEV-CFG-READ}
 
 This command has the same effect as reading from the virtio device-specific
 configuration through the legacy interface. The \field{command_specific_data} is in
@@ -163,7 +163,7 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 The length of the data read is simply the length of \field{data}.
 
 \paragraph{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-NOTIFY-INFO}
 
 The driver of the owner device can send a driver notification to the member
 device operated using the legacy interface by executing
diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index e0bbb4a..68f5862 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -69,7 +69,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 \hline
 Resource object type & Name & Description \\
 \hline \hline
-0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see \ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_RESOURCE_OBJ_DEV_PARTS} \\
+0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see \ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO-RESOURCE-OBJ-DEV-PARTS} \\
 \hline
 0x001-0x1ff & - & Generic resource object range reserved \\
 \hline
@@ -109,7 +109,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 \field{id} uniquely identifies the resource object of a specified \field{type}.
 
 \paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-CREATE}
 
 This command creates the specified resource object of \field{type} identified by the
 resource id \field{id}. The valid range of \field{id} is defined by the
@@ -142,7 +142,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 This command has no command specific result.
 
 \paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-MODIFY}
 
 This command modifies the attributes of an existing device resource object.
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, \field{opcode} is set to 0xb.
@@ -167,7 +167,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 set to the values supplied in \field{resource_obj_specific_data}.
 
 \paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-QUERY}
 
 This command queries attributes of the existing resource object.
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY, \field{opcode} is set to 0xc.
@@ -198,7 +198,7 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 resource object are are set in \field{resource_obj_specific_data}.
 
 \paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
-\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-DESTROY}
 
 This command destroys the previously created device resource object.
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY, \field{opcode} is set to 0xd.
diff --git a/admin.tex b/admin.tex
index 35d614c..39fc072 100644
--- a/admin.tex
+++ b/admin.tex
@@ -126,37 +126,37 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0001 & VIRTIO_ADMIN_CMD_LIST_USE & Provides to device list of commands used for this group type \\
 \hline
-0x0002 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE} & Writes into the legacy common configuration structure \\
+0x0002 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-COMMON-CFG-WRITE]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE} & Writes into the legacy common configuration structure \\
 \hline
-0x0003 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ} & Reads from the legacy common configuration structure  \\
+0x0003 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-COMMON-CFG-READ]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ} & Reads from the legacy common configuration structure  \\
 \hline
-0x0004 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE} & Writes into the legacy device configuration structure \\
+0x0004 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-DEV-CFG-WRITE]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE} & Writes into the legacy device configuration structure \\
 \hline
-0x0005 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ} & Reads into the legacy device configuration structure \\
+0x0005 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-DEV-CFG-READ]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ} & Reads into the legacy device configuration structure \\
 \hline
-0x0006 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO]{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO} & Query the notification region information \\
+0x0006 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO-ADMIN-CMD-LEGACY-NOTIFY-INFO]{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO} & Query the notification region information \\
 \hline
-0x0007 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY]{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY} & Query the supported device capabilities bitmap \\
+0x0007 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-CAP-ID-LIST-QUERY]{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY} & Query the supported device capabilities bitmap \\
 \hline
-0x0008 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET]{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET} & Get the device capabilities \\
+0x0008 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-DEVICE-CAP-GET]{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET} & Get the device capabilities \\
 \hline
-0x0009 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET]{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET} & Set the driver capabilities \\
+0x0009 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO-ADMIN-CMD-DRIVER-CAP-SET]{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET} & Set the driver capabilities \\
 \hline
-0x000a & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE} & Create a device resource object \\
+0x000a & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE} & Create a device resource object \\
 \hline
-0x000c & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY} & Modify a device resource object \\
+0x000c & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-MODIFY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY} & Modify a device resource object \\
 \hline
-0x000b & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY} & Query a device resource object \\
+0x000b & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-QUERY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY} & Query a device resource object \\
 \hline
-0x000d & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY} & Destroy a device resource object \\
+0x000d & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO-ADMIN-CMD-RESOURCE-OBJ-DESTROY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY} & Destroy a device resource object \\
 \hline
-0x000e & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET} & Get the metadata of the device parts \\
+0x000e & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts /  Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-METADATA-GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET} & Get the metadata of the device parts \\
 \hline
-0x000f & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_GET} & Get the device parts \\
+0x000f & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-GET]{VIRTIO_ADMIN_CMD_DEV_PARTS_GET} & Get the device parts \\
 \hline
-0x0010 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_PARTS_SET]{VIRTIO_ADMIN_CMD_DEV_PARTS_SET} & Set the device parts \\
+0x0010 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-PARTS-SET]{VIRTIO_ADMIN_CMD_DEV_PARTS_SET} & Set the device parts \\
 \hline
-0x0011 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO_ADMIN_CMD_DEV_MODE_SET]{VIRTIO_ADMIN_CMD_DEV_MODE_SET} & Stop or resume the device \\
+0x0011 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts handling commands / VIRTIO-ADMIN-CMD-DEV-MODE-SET]{VIRTIO_ADMIN_CMD_DEV_MODE_SET} & Stop or resume the device \\
 \hline
 \hline
 0x0013 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
diff --git a/device-parts.tex b/device-parts.tex
index 92b65f4..7197929 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -89,17 +89,17 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
 \hline
 Type & Name & Description \\
 \hline \hline
-0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES} \\
+0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DEV-FEATURES} \\
 \hline
-0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features, \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES} \\
+0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features, \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DRV-FEATURES} \\
 \hline
-0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG} \\
+0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-PCI-COMMON-CFG} \\
 \hline
-0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS} \\
+0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DEVICE-STATUS} \\
 \hline
-0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG} \\
+0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-VQ-CFG} \\
 \hline
-0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG} \\
+0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification configuration, see \ref{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-VQ-NOTIFY-CFG} \\
 \hline
 0x106 - 0x2FF & - & Common device parts range reserved for future \\
 \hline
@@ -108,7 +108,7 @@ \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device /
 \end{table}
 
 \subsubsection{VIRTIO_DEV_PART_DEV_FEATURES}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEV_FEATURES}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DEV-FEATURES}
 
 For VIRTIO_DEV_PART_DEV_FEATURES, \field{part_type} is set to 0x100.
 The VIRTIO_DEV_PART_DEV_FEATURES field indicates features offered by the device.
@@ -130,7 +130,7 @@ \subsubsection{VIRTIO_DEV_PART_DEV_FEATURES}
 \end{lstlisting}
 
 \subsubsection{VIRTIO_DEV_PART_DRV_FEATURES}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DRV_FEATURES}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DRV-FEATURES}
 
 For VIRTIO_DEV_PART_DRV_FEATURES, \field{part_type} is set to 0x101.
 The VIRTIO_DEV_PART_DRV_FEATURES field indicates features set by the driver.
@@ -143,7 +143,7 @@ \subsubsection{VIRTIO_DEV_PART_DRV_FEATURES}
 one instance of it in the get or set commands.
 
 \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-PCI-COMMON-CFG}
 
 For VIRTIO_DEV_PART_PCI_COMMON_CFG, \field{part_type} is set to 0x102.
 VIRTIO_DEV_PART_PCI_COMMON_CFG refers to the common device configuration
@@ -158,7 +158,7 @@ \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
 get or set commands; each such part corresponds to a unique \field{offset}.
 
 \subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-DEVICE-STATUS}
 
 For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
 The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status as listed in
@@ -173,7 +173,7 @@ \subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
 commands.
 
 \subsubsection{VIRTIO_DEV_PART_VQ_CFG}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-VQ-CFG}
 
 For VIRTIO_DEV_PART_VQ_CFG, \field{part_type} is set to 0x104.
 \field{value} is in the format \field{struct virtio_dev_part_vq_cfg}.
@@ -200,7 +200,7 @@ \subsubsection{VIRTIO_DEV_PART_VQ_CFG}
 by the \field{vq_index.index}.
 
 \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
-\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
+\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts / VIRTIO-DEV-PART-VQ-NOTIFY-CFG}
 
 For VIRTIO_DEV_PART_VQ_NOTIFY_CFG, \field{part_type} is set to 0x105.
 \field{value} is in the format \field{struct virtio_dev_part_vq_notify_data}.
diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..f1bb101 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -89,7 +89,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / CAN Device / D
 
 The driver MUST populate the \field{Rxq} with empty device-writeable
 buffers of at least the size of struct virtio_can_rx, see section
-\ref{struct virtio_can_rx}.
+\ref{struct virtio-can-rx}.
 
 \subsection{Device Operation}\label{sec:Device Types / CAN Device / Device Operation}
 
@@ -152,7 +152,7 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 The driver transmits messages by placing outgoing CAN messages in the
 \field{Txq} virtqueue.
 
-\label{struct virtio_can_tx_out}
+\label{struct virtio-can-tx-out}
 \begin{lstlisting}
 struct virtio_can_tx_out {
 #define VIRTIO_CAN_TX 0x0001
@@ -207,7 +207,7 @@ \subsubsection{CAN Message Reception}\label{sec:Device Types / CAN Device / Devi
 Messages can be received by providing empty incoming buffers to the
 virtqueue \field{Rxq}.
 
-\label{struct virtio_can_rx}
+\label{struct virtio-can-rx}
 \begin{lstlisting}
 struct virtio_can_rx {
 #define VIRTIO_CAN_RX 0x0101
diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 29f1ee8..b2a0d39 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -409,11 +409,11 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 Identifier & Name & Description \\
 \hline \hline
-0x0800 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP]{VIRTIO_NET_FF_RESOURCE_CAP} & Flow filter resource capability \\
+0x0800 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-RESOURCE-CAP]{VIRTIO_NET_FF_RESOURCE_CAP} & Flow filter resource capability \\
 \hline
-0x0801 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP]{VIRTIO_NET_FF_SELECTOR_CAP} & Flow filter classifier capability \\
+0x0801 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP]{VIRTIO_NET_FF_SELECTOR_CAP} & Flow filter classifier capability \\
 \hline
-0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
+0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
 \hline
 \end{tabularx}
 
@@ -425,11 +425,11 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 type & Name & Description \\
 \hline \hline
-0x0200 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_GROUP]{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP} & Flow filter group resource object \\
+0x0200 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-GROUP]{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP} & Flow filter group resource object \\
 \hline
-0x0201 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER]{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER} & Flow filter mask object \\
+0x0201 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-CLASSIFIER]{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER} & Flow filter mask object \\
 \hline
-0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
+0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
 \hline
 \end{tabularx}
 
@@ -2475,12 +2475,12 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 are ignored, the group with the next highest priority is selected, and so on.
 
 The device and the driver indicates flow filter resource limits using the capability
-\ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP} specifying the limits on the number of flow filter rule,
-group and classifier resource objects. The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP} specifies which selectors the device supports.
+\ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-RESOURCE-CAP} specifying the limits on the number of flow filter rule,
+group and classifier resource objects. The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP} specifies which selectors the device supports.
 The driver indicates the selectors it is using by setting the flow
 filter selector capability, prior to adding any resource objects.
 
-The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP} specifies which actions the device supports.
+The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP} specifies which actions the device supports.
 
 The driver controls the flow filter rule, classifier and group resource objects using
 administration commands described in
@@ -2523,7 +2523,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities}
 
 \subparagraph{VIRTIO_NET_FF_RESOURCE_CAP}
-\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-RESOURCE-CAP}
 
 The capability VIRTIO_NET_FF_RESOURCE_CAP indicates the flow filter resource limits.
 \field{cap_specific_data} is in the format
@@ -2554,13 +2554,13 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 that a classifier can have.
 
 \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
-\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP}
 
 The capability VIRTIO_NET_FF_SELECTOR_CAP lists the supported selectors and the
 supported packet header fields for each selector.
 \field{cap_specific_data} is in the format \field{struct virtio_net_ff_cap_mask_data}.
 
-\begin{lstlisting}[label={lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}]
+\begin{lstlisting}[label={lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP / virtio-net-ff-selector}]
 struct virtio_net_ff_selector {
         u8 type;
         u8 flags;
@@ -2582,11 +2582,11 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \field{count} indicates number of valid entries in the \field{selectors} array.
 \field{selectors[]} is an array of supported selectors. Within each array entry:
 \field{type} specifies the type of the packet header, as defined in table
-\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}. \field{mask} specifies which fields of the
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP / flow filter selector types}. \field{mask} specifies which fields of the
 packet header can be matched in a flow filter rule.
 
 Each \field{type} is also listed in table
-\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}. \field{mask} is a byte array
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP / flow filter selector types}. \field{mask} is a byte array
 in network byte order. For example, when \field{type} is VIRTIO_NET_FF_MASK_TYPE_IPV6,
 the \field{mask} is in the format \hyperref[intro:IPv6-Header-Format]{IPv6 Header Format}.
 
@@ -2607,7 +2607,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 \begin{table}[H]
 \caption{Flow filter selector types}
-\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}
+\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP / flow filter selector types}
 \begin{tabularx}{\textwidth}{ |l|X|X| }
 \hline
 Type & Name & Description \\
@@ -2653,7 +2653,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \field{Control bits} does not depend on the partial mask support.
 
 \subparagraph{VIRTIO_NET_FF_ACTION_CAP}
-\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP}
 
 The capability VIRTIO_NET_FF_ACTION_CAP lists the supported actions in a rule.
 \field{cap_specific_data} is in the format \field{struct virtio_net_ff_cap_actions}.
@@ -2673,7 +2673,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 \begin{table}[H]
 \caption{Flow filter rule actions}
-\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP / flow filter rule actions}
+\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP / flow filter rule actions}
 \begin{tabularx}{\textwidth}{ |l|X|X| }
 \hline
 Action & Name & Description \\
@@ -2692,7 +2692,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \paragraph{Resource objects}
 \label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects}
 
-\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_GROUP}
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-GROUP}
 
 A flow filter group contains between 0 and \field{rules_limit} rules, as specified by the
 capability VIRTIO_NET_FF_RESOURCE_CAP. For the flow filter group object both
@@ -2711,7 +2711,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 from groups from higher \field{group_priority} value to lower, until either a
 rule matches the packet or all groups have been tried.
 
-\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER}
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-CLASSIFIER}
 
 A classifier is used to match a flow filter key against a packet. The
 classifier defines the desired packet fields to match, and is represented by
@@ -2732,7 +2732,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 A classifier is an array of \field{selectors}. The number of selectors in the
 array is indicated by \field{count}. The selector has a type that specifies
 the header fields to be matched against, and a mask.
-See \ref{lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}
+See \ref{lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP / virtio-net-ff-selector}
 for details about selectors.
 
 The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
@@ -2765,7 +2765,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 field size. For example, a partial mask for the Ethernet header source mac
 address can be of 1-bit for multicast detection instead of 48-bits.
 
-\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_RULE}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_RULE}
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_RULE}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE}
 
 Each flow filter rule resource object comprises a key, a priority, and an action.
 For the flow filter rule object,
@@ -2837,7 +2837,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 \field{action} is the action to take when a packet matches the
 \field{key} using the \field{classifier_id}. Supported actions are described in
-\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP / flow filter rule actions}.
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP / flow filter rule actions}.
 
 \field{vq_index} specifies a receive virtqueue. When the \field{action} is set
 to VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ, and the packet matches the \field{key},
-- 
MST

