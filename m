Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4012E4D
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720758402; cv=none; b=hP2O41IENKd3nPYqZN8D7cYk8wJ5CQm6xCYJ0g6z6N1RqYtB3J7ZUf6IB8WkdenllUtUJ5OK9paGtrxg/kRKjIy/Qx+gUtJjArTthWElOPjJFe99VjQ9hZryWrKaBNqTfeM4Muhx4Z6ZCf2b/3DSR/CLSElSxoys8wB8a6WBMWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720758402; c=relaxed/simple;
	bh=CwQTgU/BPIPSaiy4ys1bSnA/IxDk/4UcyR05FPSv5Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cDv2STRlZHfVkFv8n1mxPQutmazkGbuDoReDI0PO6EJIXawuVwqL6xw941q4wVQOTbTeRPGgYg5MGHaZmmNgM24/ADxO0XbWACgTAJdK9gPZpOv9V7hrcFqqDlWNb0Y5Wi6Zw6SGtyM9Vhdy6XnIyGrxl14XicrPDeDD1JEwbv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc7oxaT8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc7oxaT8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77e85cb9b4so209634466b.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720758399; x=1721363199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEMUAtvtBnv4vh/TSa+fqUlNwC1tar33oGDBelBoogk=;
        b=kc7oxaT8PfqAnTfIoysScKnHH0zK5CpcrTq0mFmZ5B+m45TfKUj2ltYTH+//KeFrBV
         9cb+tLgF5HqOHvu+GHEzzeVwqcc5UoqJotbDFNYqGHaNGzlL86ZuGHU1VTuwIAltWZmF
         rpZD42jiMQ1/8BHQG8iEoR+nEFX6J/twxJCP0hu6ap6M0Dwf+nDLQUNkGJMnMrHe3ZHL
         /uKCkTDEQV3cp9tN4e9wj5s31+FblDH41J55TxcngYIeg4y9jBHn4dxnnquvfkRXpIyW
         Qz9kpBod4EgPcfXLZ2+rV52piXb1a5mvolJX81VEFJpjMgZtH5BGkAqpuUSDEOYnFdlu
         Euow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720758399; x=1721363199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEMUAtvtBnv4vh/TSa+fqUlNwC1tar33oGDBelBoogk=;
        b=lGCuM2No40/JMPFmyPOIWkODk/wyvjqRSAyBvGmTYiojoxReYl88eZ2pLyzsXf6NI3
         e2nqStNmid470mg0TeMskOY5l0TWJSxDEZH7AB+0Zz0WwK4ypFYXQKDZJpQjpLyKn+h9
         1i5JYRzhhVxGxbwJLnqqdXcoQ5WCwo9GyNIEy7n1/w2VMxrBEVKinWboaS6/VY90SM87
         tH8qPERGf3fFGyaZV9/24XKrtCbZ10KoCEdHVr5GuM2yQ2RGR4lbOzcHCIdJ5/984hw4
         CMOgdimwykfWsE9eUorYIVm1t6/oVTr8TDOBcbpS3COpUjRSmO16XkffAVikUhxYceJp
         HYVw==
X-Gm-Message-State: AOJu0YzxGNZ6I6IopF3WPtEgRKNHwCpwyScPbz+YrUuqimzRRwQlBPw4
	m+NFxLStEm47/lqYDwwzg5DUnSZASusTXrvg/4z86lPwu8lUBtut0g2PjYcU
X-Google-Smtp-Source: AGHT+IENSm6S+gf31O5UAqUUsXI96Awc5pwA6yqZf/N0CL+a0sRCQuQt8iTcgB6YQIQE/D4E250Hbg==
X-Received: by 2002:a17:907:ea1:b0:a75:110d:fa53 with SMTP id a640c23a62f3a-a780b885565mr868538066b.49.1720758398894;
        Thu, 11 Jul 2024 21:26:38 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a87204esm306826766b.222.2024.07.11.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 21:26:38 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: [PULL 0/6] administration commands for device parts
Date: Fri, 12 Jul 2024 07:26:28 +0300
Message-Id: <20240712042628.3247126-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michael, Cornelia,

The following changes since commit dce4079825ea073ec7e60832dcbfef9756e5842f:

  virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 18:30:17 -0400)

are available in the Git repository at:

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1

for you to fetch changes up to 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:

  editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)

----------------------------------------------------------------
This tag contains administration commands for device parts along
with the suggested editorial change to remove the hyperreference.

It resolves the editorial conflict of blank line at the of file newdevice.tex
in commit 761c87891d3d12d0f1ea5ae0bf88bc127d227346.

----------------------------------------------------------------
Parav Pandit (6):
      admin: Add theory of operation for device parts
      admin: Extend resource objects for sr-iov group type
      admin: Add admin commands for device parts
      admin: Define common device parts
      admin: Add requirements of device parts commands
      editorial: replace hyperref with ref

 admin-cmds-capabilities.tex     |  16 ++
 admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
 admin-cmds-resource-objects.tex |  29 ++-
 admin.tex                       |  12 +-
 conformance.tex                 |   2 +
 content.tex                     |   1 +
 device-parts.tex                | 232 ++++++++++++++++++++
 newdevice.tex                   |  24 +-
 8 files changed, 778 insertions(+), 7 deletions(-)
 create mode 100644 admin-cmds-device-parts.tex
 create mode 100644 device-parts.tex
The following changes since commit dce4079825ea073ec7e60832dcbfef9756e5842f:

  virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 18:30:17 -0400)

are available in the Git repository at:

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1

for you to fetch changes up to 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:

  editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)

----------------------------------------------------------------
This tag contains administration commands for device parts

----------------------------------------------------------------
Parav Pandit (6):
      admin: Add theory of operation for device parts
      admin: Extend resource objects for sr-iov group type
      admin: Add admin commands for device parts
      admin: Define common device parts
      admin: Add requirements of device parts commands
      editorial: replace hyperref with ref

 admin-cmds-capabilities.tex     |  16 ++
 admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
 admin-cmds-resource-objects.tex |  29 ++-
 admin.tex                       |  12 +-
 conformance.tex                 |   2 +
 content.tex                     |   1 +
 device-parts.tex                | 232 ++++++++++++++++++++
 newdevice.tex                   |  24 +-
 8 files changed, 778 insertions(+), 7 deletions(-)
 create mode 100644 admin-cmds-device-parts.tex
 create mode 100644 device-parts.tex
