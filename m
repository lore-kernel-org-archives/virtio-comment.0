Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCFAEAC7
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791364; cv=none; b=jyEj63cr5bSnx4j5ckmAYeFfSian72zXSpxYJR5Q0bEndWGQHPBJmbX83THmblKGUu6LNcBfJ8e+1xDem2H1KEqw1X+Zk1AW8jpLM1UQzJOQZMRoJeH2cWaiQX1+2+YVPyizWRBbIXolFZJuXzpH0XqZTadytF7yKCIwo9tX2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791364; c=relaxed/simple;
	bh=OEi9uo8Osbnf2yEH+W/0MGKemJRpnFf8XLsdck5T4cU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mzUc7oZQA/H6DuHwZ1cAG71YnPHCgHHINbMUl2bjgekfdW4u5RC7YJ174BLeEzfT3P42IcU+hMwE0kHTc/TZ8B5WKF8uarzLJSZ5lDzfoJ4LMUXMfym0gyLIc2TkbfYkQl3dq/FHb6XwWfhrJB+1RibGNy3oJNyanL7ZEbjcmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpjRvORn; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpjRvORn"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so2895549e87.1
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720791360; x=1721396160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVYBYW7NPaJxXhneviLzmYo2Jv0l/nfFgpTxDuB4S3U=;
        b=WpjRvORnck1gd5xyyr+r+KMXG/1blI/5bo3iQh15LaNZ8/dq2pZaU+LWCBBtljef2u
         u+/PmIcapkjG79T8IEhlx4BODWzU8QxSMJmISsvC2f0tIn5xtVOtHc69hC3zUHPReoY3
         7drsVX9pSt+cDbU8yWslbG3YrOiezhlK/M18IQ5jV9rD9HxhL6IblK67AnOid8XFEzOt
         ApzprYzYoDlyDkBVGf33QR5lnHHxCTChHF+tnARO00A82hWpdchpgqGAtnrX08wWqvlh
         5lYfi7aOcs0mugd2ksJgYFwi2k/an7lTt4DDqUHocjiRArgI5DpKruIGPJRWW7zFtvwc
         t/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720791360; x=1721396160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVYBYW7NPaJxXhneviLzmYo2Jv0l/nfFgpTxDuB4S3U=;
        b=eZxIQJ21zX3GkS91Y5/K3a2sFFuH6SqBzPIgvnFUPOqhuKc5OTeShSmckClK1ETm2P
         17qvmyFd/Gyd09+S75l+tiLvCZyCLrANy6U3vYHcQ6Jw8Yciwa/8c3XK5lfzbExXo9kQ
         N0x7UxqtRvE+Q8hvzwu63BPXHMGf83lnw8sONidgpHy54wIhnBqVr7LYdSL/7bvOKGHE
         rXC21sGmKKvpEB3rDFkcsIpquzNRVqVsnmO+64K3llt3jbyRFyEELaqqD4mRmXW2L2J2
         zauL3qRZ0QFt58Ad4zTKprkGw+/qxZnZ30SGbpTT3ZGjNba1fFB2LhStVwEC++Ls9fBB
         ecrg==
X-Gm-Message-State: AOJu0YymZDTStD3xLmNBtmPKAg1FuKh9yqGt5LwM0x1Okc/m4ZudcRzu
	gLPzAxRyab9tU4WTgJoGo9FMnWHV1CkF8l0GH4vZzZAAc91NPz5DB0jEw5Ac
X-Google-Smtp-Source: AGHT+IGXc6Vg6HsphKfskPefR9ctKvqpZEUQ9rPAMUccenJufq1mGGr9fkaTeLsashS5Q+10mbOljA==
X-Received: by 2002:a05:6512:239d:b0:52e:7542:f471 with SMTP id 2adb3069b0e04-52eb99a317fmr8137869e87.29.1720791360104;
        Fri, 12 Jul 2024 06:36:00 -0700 (PDT)
Received: from vr-arch-host06.mtvr.labs.mlnx ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc897sm347744166b.39.2024.07.12.06.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:35:59 -0700 (PDT)
From: Parav Pandit <pandit.parav@gmail.com>
X-Google-Original-From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: [PULL v2] administration commands for device parts
Date: Fri, 12 Jul 2024 16:35:50 +0300
Message-Id: <20240712133550.3271761-1-parav@nvidia.com>
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

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v2

for you to fetch changes up to 5b1ed863cf9701e110042e9e85d69acd06cd33c5:

  editorial: replace hyperref with ref (2024-07-12 16:08:59 +0300)

----------------------------------------------------------------
This tag contains administration commands for device parts

changelog:
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
