Received: from xvfrnhpk.outbound-mail.sendgrid.net (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C12572
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.245.32.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720969270; cv=none; b=PVIqiobKEHnAkUmGyqctWrTnbyJKM5qjTbybt6jkx6h4nCT+xa+ooL9SL5AK03f2skjARD8CvTKVO4s4f6DU9CwACb5sL7lizzcdGoyNvJQj9V3l7BozJXIYv7JdVJzhfyyW4hJqGj7egZR7Zp921YJS7VPbcZ2152V85jdjAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720969270; c=relaxed/simple;
	bh=s+WkyAWtTGso+nnXNKPQkdIaFXeaj0IEa3oO8hEqXxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=kmWBGVfD31NvXqmno2RNqJEyhwd67QtRM7w21R45GjPfP3aRGgr3D+kbrnj4UEatRAWNRL6aJAgTvKEZXykSi0RO39w8/y3EjLKqJMCtKIuDYTiSEbS1MSNrJuToQkkRAMgfNilZpYzHHCGjoZACfePrtGSujXMu56tucgzC2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=pass smtp.mailfrom=sendgridstats.nvidia.com; dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b=AP4u9jSd; arc=none smtp.client-ip=168.245.32.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sendgridstats.nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="AP4u9jSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
	h=from:subject:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:from:subject:to;
	s=s1; bh=hpZG0Bx4Qy9HYVTS0VX9wmHlID3JycpuWcyToTTMhdw=;
	b=AP4u9jSdQLAZl/kJb7E2G7Qw1w5oWqW6xCPW1NvuvGxm537XgeWvhFClstYjxLoXMTFn
	Sam+laD9MgFALPyVNHfn70gCHviArMGXf7W5cLQ60hsej2HuwSC1tKfbcMDcUQIQG6f29V
	/QUcorUKA55oWwt9+oayKEWR/F3iSXEmx33gACAPhYszucRwUffxCrrlK1TJ4C80SnJylc
	3Mw910rGr4+OnpFRxcCZZePt3hZ37j9cQdY0eiAAsrMjWao7u1i177OFc+OjXRT0HyROI1
	YhQbYa85eUWtcN5CRgiW5RoRrIhzYgzou6gYPVn8SEeQXoKRnPvuXSulvdgIm1Mw==
Received: by recvd-6c4b9d448c-lzhc7 with SMTP id recvd-6c4b9d448c-lzhc7-1-6693E833-75
	2024-07-14 15:01:07.309703247 +0000 UTC m=+1461493.173482636
Received: from mtl123.mtl.labs.mlnx (unknown)
	by geopod-ismtpd-4 (SG)
	with ESMTP
	id qgGR1Ay9RO6MVPzgXl8rjA
	Sun, 14 Jul 2024 15:01:07.145 +0000 (UTC)
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [10.245.43.40])
	by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 46EF16wo001349;
	Sun, 14 Jul 2024 18:01:06 +0300
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [127.0.0.1])
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 46EF16KZ3292721;
	Sun, 14 Jul 2024 18:01:06 +0300
Received: (from parav@localhost)
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Submit) id 46EF16kG3292720;
	Sun, 14 Jul 2024 18:01:06 +0300
From: Parav Pandit <parav@nvidia.com>
Subject: [PULL v4 ] administration commands for device parts
Date: Sun, 14 Jul 2024 15:01:07 +0000 (UTC)
Message-Id: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EGKIzaBmeMpQo8dENF3BKzHhooF+oMOnrwKqptdheemMEs2maYobIgHNSi?=
 =?us-ascii?Q?3HpuxQn0J1ksZ0bJ2Es9Y+grYdP1aLub+6jtJxn?=
 =?us-ascii?Q?tZkTVQo4aNiDtsSfcWq8c48D0qkGvq6qoe0vOhd?=
 =?us-ascii?Q?fbl3BTnURRonHhm6HwTeDtqg46tH+9ONbXl9n1G?=
 =?us-ascii?Q?Kx78tbPYHoy4GGJju1BBFqmpt3y82jGLHy0FyUq?=
 =?us-ascii?Q?Gi3NVS9qUYW5x9kYh0ApEMb+YvYYTfPaSfrdgz2?= =?us-ascii?Q?M4OZ?=
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
X-Entity-ID: u001.9Nu+sJkq3f0LJ/tZbyfOWA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

From: Parav Pandit <parav@nvidia.com>

Hi Michael, Cornelia,

The following changes since commit 9b3129fe72360a78e76b6dd890d3abc5a45fa915:

  virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-12 06:43:53 -0400)

are available in the Git repository at:

  https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v4

for you to fetch changes up to f89c2818bba1bd0d80bb12372973deb6908931f2:

  editorial: replace hyperref with ref (2024-07-14 17:44:14 +0300)

If the change f89c2818bba1bd0d80bb12372973deb6908931f2 still not reaches to your
expected quality level, can you please pull upto 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2?
I will supply the requested improvements on top of virtio-1.4 branch on top of
52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2 once merged.

----------------------------------------------------------------
This tag contains administration commands for device parts

changelog:
v3->v4:
- addressed Michael's comment to add fixes tag to the patches
  in editorial patch
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
