Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE7D27A
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720928655; cv=none; b=WOwQ8uXI7ARDaVCtycnbmhPcxR4rkOHF6asmPhoqzsV0oxXQCbIQWs/k9WWj0RjBy3PDcJ9HwNtArh2l29YcxmxBmuT6A/BrhN3/dVbXFIP+wdn7sxHR7uAVDmf/JbHPjnviVYhWCEfoj8LLc0lyJN48IE3cM5uQ0gryF7x9rA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720928655; c=relaxed/simple;
	bh=m0cKjZX3aY73QYzPYFwgJVxheOPH/FQo/soltANjPNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQHfMK50Bj1vKr0jmM3smpspzRaZk0hhhpnckuaeakGV447MtNTNjPDwekTc5Y2Z9gmwYzz/USc4/1gdA62ffI8YFMkG0pmbvoMkJ1iom6vTKeV1GYuE/7QaT7f/5kxiILQyYR4LEOZg7HfeTZJbYM0OPoWXF7BgEHDeoHLvFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT6ow49/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT6ow49/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa6b3so2054658a12.1
        for <virtio-comment@lists.linux.dev>; Sat, 13 Jul 2024 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720928651; x=1721533451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dJdxznGw2bRjOraewE7kC2vhFLVV7w5P9QDb/XtRw8=;
        b=lT6ow49/yMG7t3gIKyUd5dJoEIi3akf+/vKmICNPGKEmu/JUf/iMVBLVdxWsN/ugjF
         XV0Ayk4ayH4vYq495FzqfLeh8ep55jPpIZiTT0PvDUdpE688E2p1ABblaeMyiGFJgUo4
         s4IGLxloDXk8LUfQbD7m6+KDlfWZ1DFcqkLsCPvL4gHKDT/WlwwhmPybk1OYIWs9UhLe
         tUE+XqnS7UvtL5kJW/SKOqUMViQ4aJOM6uElkwwFwjKkk49Ads062dRvcLr7L/ArLkCr
         51YR0adLTWpy5nAsT3rh4dfDhe/YZfHnMRYilvOb3e29t+loOVdstZvaH4rtxw8pHlBQ
         UU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720928651; x=1721533451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dJdxznGw2bRjOraewE7kC2vhFLVV7w5P9QDb/XtRw8=;
        b=vFDRf1xgp8WccTVlLSJQ5PwZ528nRMoSN1lji28FE3aHdX1d14fqPSaBzulDtAJA8t
         tPnQ/qaiIshpu/fCf/O3tIatYd6dXhiisofM+cbHxD4xfOuE6zzdcFlXjwrpniXgY85S
         sK5PhPE2R4nDtHYNeZ4sK0ZAcZsjuRqeGMcwiV1qCe7r+OKeuCr5fnqc7kAn2oWMWEvH
         H3zHcscmIjJBQzPNpN+SeRwbcSlhvVKrL/WBswRWeumC5miGCcjFJvOwnvZSJyjKWPE/
         3qcJJtBrRPvLXtBUxlQUJgIoi6yI9lmoahqo340GprDqhtw60mSkvtCaKmHhWW0EwlmC
         Ln4A==
X-Gm-Message-State: AOJu0YyZnYBQHNyrmOgzYojj0Pt0No8YnyxFRSXsH4DQohSEd9wF49Mg
	/1zLOwfplpYpGtMmNEhm9KONCGt+JQRDw3WTwHJj1w/ervAfYkMbhS+krlzE
X-Google-Smtp-Source: AGHT+IGZqQ4c0JXpFfH73TPfsibkt3L9ijloyhEoH5zNQuH+NbC6i2ABbD32vZ/KJ9SwW57gVp9XKw==
X-Received: by 2002:a05:6402:885:b0:58b:f46f:ae45 with SMTP id 4fb4d7f45d1cf-594bb773fb7mr12072194a12.23.1720928651278;
        Sat, 13 Jul 2024 20:44:11 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b2504b923sm1489235a12.29.2024.07.13.20.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 20:44:10 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: [PULL v3] administration commands for device parts
Date: Sun, 14 Jul 2024 06:43:42 +0300
Message-Id: <20240714034342.3288081-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michael, Cornelia,

The following changes since commit 9b3129fe72360a78e76b6dd890d3abc5a45fa915:

  virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-12 06:43:53 -0400)

are available in the Git repository at:

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v3

for you to fetch changes up to 328ddaceb9e15339729a8c8db6023ad72fc7f252:

  editorial: replace hyperref with ref (2024-07-13 21:16:44 +0300)

If the change 328ddaceb9e15339729a8c8db6023ad72fc7f252 still not reaches to your
expected quality level, can you please pull upto 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2?
I will supply the requested improvements on top of virtio-1.4 branch on top of
52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2 once merge.

----------------------------------------------------------------
This tag contains administration commands for device parts

changelog:
v2->v3:
- added message-id to the last patch
- fixed reference to named reference in the last patch
v1->v2:
- fixed hyper reference to name reference
- fixed typo in commit log
- reduced the patches of pull request due to rebase of virtio-1.4 branch
v0->v1:
- resolved merge conflict for an empty line in newdevice.tex

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
