Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121F12B171
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720729468; cv=none; b=P3gQsBq0dimo84MeiYRpYzlIQNDZ8g9tvNfZMASDXQ2YN+1W/C/UMUgPZ3KAHKYacuSgx9upFbEzIUuqrHSouPWjDYC0uQZBQezzG225AJbh5QeVfveNbIUukvicREn/8AIm37xMHEHSeXlaUw5zGhdk1f7TZzDcTJ5hjJMwUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720729468; c=relaxed/simple;
	bh=dO5ojiy/hXaZ9sXVKUED+1aD1iHapEUOy4/dSM7nYp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iBq3pdAbxVq83jyS3bldYLec57nFxsimtqM7djzh0t9VhQs/yoAl2wfd2oYbVLFxh1x0VKWQCXbGqora0Ans0X2KiC75neodHWZgTgoKxGFob17JTuaqeBKnOpPCZG86ZnZh8wRkYl5EKcVmN1ZsmGKiL8BIjTAaOIqC6Ev5UtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+/DPfI1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+/DPfI1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso1571166e87.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 13:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720729465; x=1721334265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEbWi/Mz9XookuA6bgaeP5RCCjNlx6kyP9umCEGP24c=;
        b=L+/DPfI196oa7OwCA5VL4pJMwPTUa8qt47CnoULB5LZPSWRzDonvtV8dLwHq3qCRej
         K9fsXP/ZR1NwW9WRUNXSu9fsSpwkWo3x7/fdmFQuuqC2XZrDRmqnK+vfROEApB8ov4x3
         Ux4LaRzH2KnL7/LT2PHrdEJUm6cfa/oVphL/6/UllZFX4ytUKM32t5I3dPvX6FJwhMKC
         OMizVDtj8a1O4hORLDy455I7SmIkoan0ZaB46M1k1znnWzoSPtG3/+M5we1Hfkb9zJAd
         Q7ja9ea5wYkSEtMVLheIpD1Im9TKN55NADYtIsq9BqURGdeu/b3vmUW7zN0DazN2+ZYz
         DEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720729465; x=1721334265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEbWi/Mz9XookuA6bgaeP5RCCjNlx6kyP9umCEGP24c=;
        b=kUQa5zR+Ol0Q8WQ+/Z63QP1QxZeHj1E/NyL89FdbiElQ8OcgnShZB32uYvhimPNnJn
         I/aEmKkxT4eXoUl6+NZnH/yhoHxZac2cKVL39AwzdNvQyiPmzxrq+5xx2NaCXd6NwZfT
         EEKVvceNAGwc2hUqOCFPBW0R5eRJIO5SKrOXXKaMjTlTLqcZmedESn8lQDsPoTsxV9Ki
         0vKgvWee6XOI6O1Ju60JwccNvb4zhuNIkiovypDUY17KH7OOAsnYoEwarEoMZdu9sL3p
         1yG+06SPgIjJkWWrjXBL58K+2uEHe+xBcofUfLp1WiKnJPufrCr8dONJtelBmVgibQ72
         9SKA==
X-Gm-Message-State: AOJu0Yy+C934rQXLKmlhtSXiogi9doc7QljKA/VeNRXK8DodkvKZep0M
	WVEZSOIIEBP0P9VvHseTKeSOzaRTHZUh3+QUHA6GAerQsylebx0nWZPS5knKKl0=
X-Google-Smtp-Source: AGHT+IEsEIeDfkc3imQV3DIizcozvd+6dZOLEa5T5Ae/RH0T50H9wz/49yYtxVpseW6lDp2UHRU2uA==
X-Received: by 2002:a05:6512:110e:b0:52d:b1e4:b337 with SMTP id 2adb3069b0e04-52eb999165cmr7722677e87.21.1720729464558;
        Thu, 11 Jul 2024 13:24:24 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a854368sm279595666b.155.2024.07.11.13.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 13:24:24 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: [GIT PULL virtio 00/40] virtio master branch with fixes and admin commands
Date: Thu, 11 Jul 2024 23:23:52 +0300
Message-Id: <20240711202352.3228345-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michael, Cornelia,

The following changes since commit 37c6a406678a5ee891fdf5671298cb4fcfa517f2:

  sound: add sampling rates 12000Hz and 24000Hz (2024-02-16 11:55:25 +0100)

are available in the Git repository at:

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4

for you to fetch changes up to 74bf759aef3bf10447aadcb841c66dc5e6a578d6:

  virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 20:54:20 +0300)

----------------------------------------------------------------
This tag contains virtio master branch and set of patches of administration commands, pci fix, blk config fix, and net description fixes

- editorial changes froom master branch
- virtio blk and pci capabilities data type fixes
- virtio net header description update
- adminstration commands for flow filters
- administration commands for device parts

Generated PDF and also the diff pdf were verified using makepdf.sh, makediffall.sh and makediffpdf.sh.

----------------------------------------------------------------
Cornelia Huck (12):
      edit: remove old changelog
      edit: add changelog for 1.3
      acknowledgements: update for 1.3
      editorial: update copyright date in PDF footer to 2023
      change revisions: diff from v1.2, current v1.3
      title: note that 1.3 supercedes 1.2
      revision: update date
      remove enumerate usage that makes the tool unhappy
      Revert "remove enumerate usage that makes the tool unhappy"
      editorial: various fixes for 1.3-csd01
      editorial: update "Computer Language Definitions" URL
      makediff: update list of cherry-picks

Kröning (1):
      virtio_pci_cap64: specify offset_hi, length_hi endianness

Michael S. Tsirkin (5):
      changelog: tweak column width
      changelog: formatting fixes
      work around extra row
      html: add missing enumitem package
      README.md: update mailing list info

Parav Pandit (22):
      virtio-blk: Fix data type of num_queues field
      virtio-net: Fix receive buffer size calculation text
      virtio-net: Clarify the size of the struct virtio_net_hdr for tx
      virtio-net: Annotate virtio_net_hdr as field
      admin: Introduce self group
      admin: Use already defined names for the legacy commands
      admin: Add theory of operation for capability admin commands
      admin: Prepare table for multipage listing
      admin: Add capability admin commands
      admin: Add theory of operation for device resource objects
      admin: Add device resource objects admin commands
      virtio-net: Add theory of operation for flow filter
      virtio-net: Add flow filter capability
      virtio-net: Add flow filter group, classifier and rule resource objects
      virtio-net: Add flow filter device and driver requirements
      newdevice: Improve the appendix chapter heading to reflect the content
      newdevice: Extend informative guidance on capability, resource objects
      admin: Add theory of operation for device parts
      admin: Extend resource objects for sr-iov group type
      admin: Add admin commands for device parts
      admin: Define common device parts
      admin: Add requirements of device parts commands

 CONTRIBUTING.md                         |    2 +-
 DIFFVERSION                             |    2 +-
 README.md                               |   80 +-
 REVISION                                |    2 +-
 REVISION-DATE                           |    2 +-
 acknowledgements.tex                    |  124 +-
 admin-cmds-capabilities.tex             |  249 +++
 admin-cmds-device-parts.tex             |  469 +++++
 admin-cmds-legacy-interface.tex         |   24 +-
 admin-cmds-resource-objects.tex         |  287 +++
 admin.tex                               |   61 +-
 changelog.tex                           |    6 +-
 cl-cs02-12.tex                          | 2593 +++++++++++++++++++++++++++
 cl-os.tex                               | 2897 +++++++++++++------------------
 conformance.tex                         |    6 +
 content.tex                             |    1 +
 device-parts.tex                        |  231 +++
 device-types/blk/description.tex        |    2 +-
 device-types/net/description.tex        |  646 ++++++-
 device-types/net/device-conformance.tex |    1 +
 device-types/net/driver-conformance.tex |    1 +
 introduction.tex                        |   32 +-
 makediff.sh                             |    3 +-
 newdevice.tex                           |   62 +-
 specvars.tex                            |    2 +-
 title.tex                               |   15 +-
 transport-pci.tex                       |    4 +-
 virtio-html.tex                         |    1 +
 virtio.tex                              |    3 +
 29 files changed, 6001 insertions(+), 1807 deletions(-)
 create mode 100644 admin-cmds-capabilities.tex
 create mode 100644 admin-cmds-device-parts.tex
 create mode 100644 admin-cmds-resource-objects.tex
 create mode 100644 cl-cs02-12.tex
 create mode 100644 device-parts.tex
