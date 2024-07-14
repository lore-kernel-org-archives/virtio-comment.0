Received: from xvfrnhpk.outbound-mail.sendgrid.net (xvfrnhpk.outbound-mail.sendgrid.net [168.245.32.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DC22313
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.245.32.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720995529; cv=none; b=F0W9TjLIsa5M66kLtvjFoWL0wBXGSWMzlD9TXh4HU9YQFxU0jIZj5rmJnqCpPoBUNQL7zHM/N3xLe+cxatV7BJTK2EJoIuu+4U520esrv1JR6xMTu9sGUgRK/hgLfrP9FKIjX0h2mqbs8s52z3SHV5EownWv4RwnP14KjTpOkCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720995529; c=relaxed/simple;
	bh=OYmCdaFHIR5Z7ADOW01/KyBIQpiIsiIfidnLBQBJXR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=IDWXdSB3m/JCpxjeINju5FVOgtZ3761B9wQX3ZZr2iwASWJxsGHRGQrzlWa+KieA5CnqQCfy8TXInyko8aOCgbVvCD0R6/89+F2+uPoU68Lkb3e8fPWfii9+ZYbxWan6pm7CyY2YWLQ7AnYJy7XulJRP+/EBj27fVDCT12PvEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=pass smtp.mailfrom=sendgridstats.nvidia.com; dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b=OZ65Yc5b; arc=none smtp.client-ip=168.245.32.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sendgridstats.nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="OZ65Yc5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com;
	h=from:subject:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:from:subject:to;
	s=s1; bh=Z/NVQI2s6Sl5aUk0zgpTgXjCHu+Vm6fFD+iWT/S0Nj4=;
	b=OZ65Yc5ba+PS7/PZin86l6nx6qBw8gJLO8NKxAQnPhpke1mlChgEOCPC5mJ0bD38/IrE
	43c+yEjbYUo/oAAWwmxYBb9zJX2HB/Ytltb6ZerXbdTMymSN/8R+86Y7JNq+cTB6k5QU6Q
	hxcs/kCnKHLJQFMCy2ZUOl3TwXv/ib5W9BLSQ/vgw7OQcPz30T57OPQBhtjsLSrQxeBVyV
	oS5R9EY9ZraifT3RcGBlGP1Pm1NV7EQGhAs+ugth+dYl2i9QMAoFp+HKrCT2PMg9Cs+UFF
	BfRbvZ9zuHddj/MQnbTg2UwLdLzLAz5wg1+w6iDSSMnMAB1w6UHpdmlxdqpV9g7Q==
Received: by recvd-689769458d-zz5kp with SMTP id recvd-689769458d-zz5kp-1-66944EC3-21
	2024-07-14 22:18:43.582811422 +0000 UTC m=+1488014.067941573
Received: from mtl123.mtl.labs.mlnx (unknown)
	by geopod-ismtpd-canary-0 (SG)
	with ESMTP
	id 5dzS0_94Rau_mIdKbCF4xQ
	Sun, 14 Jul 2024 22:18:43.407 +0000 (UTC)
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [10.245.43.40])
	by mtl123.mtl.labs.mlnx (8.14.4/8.14.4) with ESMTP id 46EMIg4b017511;
	Mon, 15 Jul 2024 01:18:42 +0300
Received: from vr-arch-host06.mtvr.labs.mlnx (vr-arch-host06.mtvr.labs.mlnx [127.0.0.1])
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 46EMIgNY3323470;
	Mon, 15 Jul 2024 01:18:42 +0300
Received: (from parav@localhost)
	by vr-arch-host06.mtvr.labs.mlnx (8.15.2/8.15.2/Submit) id 46EMIeYi3323469;
	Mon, 15 Jul 2024 01:18:40 +0300
From: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] html: add missing xltabular package
Date: Sun, 14 Jul 2024 22:18:43 +0000 (UTC)
Message-Id: <20240714221837.3323459-1-parav@vr-arch-host06.mtvr.labs.mlnx>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EGKIzaBmeMpQo8dENF3BKzHhooF+oMOnrwKqptdheemMEs2maYobIgHNSi?=
 =?us-ascii?Q?3HpuxQn0J1ksZ0bJ2Es9Y+grYdP1Q2Z1nWuTLy4?=
 =?us-ascii?Q?7Ug9nSe3RzvAsrQGqnZHuvJOAB4OFCCPeHKYOaC?=
 =?us-ascii?Q?Cnt3HgdZYNx4liLwPZNJpHJEnjc7Xzs0NVZ7vpg?=
 =?us-ascii?Q?a2xHbdfYwVehNADrujqeMR2o1Rnb+NDtAf6JZU5?=
 =?us-ascii?Q?aB4M6tZjM+s6u6yZHtkKzMMegiCg2RZoJXLOt0v?= =?us-ascii?Q?bqW7?=
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
X-Entity-ID: u001.9Nu+sJkq3f0LJ/tZbyfOWA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

From: Parav Pandit <parav@nvidia.com>

script makediffhtml.sh errors out with following error.

LaTeX Error: Environment xltabular undefined.
Fix it by adding the package.

Fixes: 72a91e6d6365 ("admin: Prepare table for multipage listing")
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
This patch is for virtio-1.4 branch.
---
 virtio-html.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/virtio-html.tex b/virtio-html.tex
index 48c633d..c29f8de 100644
--- a/virtio-html.tex
+++ b/virtio-html.tex
@@ -33,6 +33,7 @@
 \usepackage{xstring}
 \usepackage{enumitem}
 \usepackage{chngcntr}
+\usepackage{xltabular}
 \counterwithout{footnote}{chapter}
 
 \usepackage[utf8x]{inputenc}
-- 
2.34.1

