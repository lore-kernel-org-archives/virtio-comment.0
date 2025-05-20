Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D9DDA9
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743578; cv=none; b=Qt09FPTyVrZN6H0+d4kiVO6UUad4mqYPD3c7alSoTN+7kHx5iHmqbkdiogwtXVRfI6zslENM/BiET0xti7xulinwapXZTh8xLpk7XiopFPmyaZ1Vp9cBkui9OuG7L/I0O33Qpz8coWDTgV/c5KrMXgGfRB9E6VKCe9e2OgBtCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743578; c=relaxed/simple;
	bh=caLKhP91gzBSuWhTvtuylFyEIm6g7i6Q7ZqnIYzeKJg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F3AnYuYgboEP/XKyK4Y9oY+wdNi1DT16QsmINqfV5Vaj06s/LZ8mr0USOs37dolpOE93Bv89D2h8DoSoSIUgowPyCtO7JAWIopYaHpLwx3yZU2eYrSwciyf4N25mulpF09QE7IxCEK6Mx+r/H4UkdP3hWL9HuYGcil1o3jMtpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=G9d3rMC2; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="G9d3rMC2"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JNSxO5011011;
	Tue, 20 May 2025 05:19:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=ydp4esZTnwbERrGhYIeh+Yn
	7UiUmcJf415mi+XPU+s0=; b=G9d3rMC24C+sHukBNqpQMm4lQ85FQ93HUazEsP6
	qId0kRbYVRqrgp1MSw5y1Ibq+E55Nbv9K3aPdlvLrXnDaY8Wd5wOthf+VKD7MIpG
	aSvFwtepde1Gf8Ra0V/E3jiGuV8Q8nIRTf8S+1mZ/pb89/ZHW0nGrDIPNoNap/D8
	P1PiLfd3otpCYjErGcY+4EnymNrI52IT1nwZ+jYYktIJmEy8UJhgA6bEd05aBZRk
	RspMA56unZD98P+5Ug5UBUjKSKzZYe+0BNk4USULQUe42VZV49LJy6YE+QQ2+eWL
	509XLI30/tzAAbLDJ4rSrREUMO1VA9E4Z9siG342Lfxl9jw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46rebt15sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 05:19:29 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 20 May 2025 05:19:28 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 20 May 2025 05:19:28 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 818613F7065;
	Tue, 20 May 2025 05:19:25 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v7 0/4] introduce IPsec Operation in virtio-net
Date: Tue, 20 May 2025 17:49:20 +0530
Message-ID: <20250520121924.2169258-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5OSBTYWx0ZWRfX4xJr5Jm+VtSb i2BBTP26vAzlug9pEvilbHt91SfOmq+WRKCbh0VdwLa8sKsQUJ52VJQDi40PdyhKmQDzDFbb/ZB fZm0B9GhqZaa2Ra2YsE/DW7ALJm5Bin9GLPuH0+8RFH/HAngKs2Hms/fMr/kG9I2xpJIEEnhwZk
 hW5v9/nGgHi6pRLSAT9k1akDj8eLeFH1ovf+EVPmYt6r2c/tto2NDA7QZ+SoWhP3+EYzh2IrRla LoRX97dlUEW/8TL5yY5VYvRwrYmOx4tE8gUNH3r7sD1OqbwOGPxsXp4vXW51jiUBIMVryNt3Hkf gFpH7iNSTE8tPC3CQfBiT6TrAi6r+gJA9upJ3zEy9shXHJkuJliyHgYGA8sg7V3iPAVva+Jw7LZ
 u6ice6cO/R+kYvCkkeKZzHl0hTiD4eySGtRFgv0UzOmp3lFxhaSBkzdH8VC0mmz4doxNy5lq
X-Proofpoint-ORIG-GUID: dr-OFd_8bOmNgmkUZHNvedyjTR3KcOnV
X-Authority-Analysis: v=2.4 cv=BqCdwZX5 c=1 sm=1 tr=0 ts=682c7351 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=x0C1_AZOdUCCJCe2u-oA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: dr-OFd_8bOmNgmkUZHNvedyjTR3KcOnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01

This series enhances virtio-net by adding support for IPsec
Operation. These patches aim to extend the capabilities of virtio-net,
enabling it to handle IPsec operations efficiently. This enables
the offloading of IPsec processing, both before transmission
and after reception, thereby providing inline offload
capabilities.

It is using new virtio basic facilities of capability and
resource objects. Below is a summary of the changes introduced:

Patch1:
This patch introduces the foundational support for IPsec within
the virtio-net framework, outlining the necessary capabilities and
resource objects for IPsec operations.

Patch2:
This patch introduces a new selector and action necessary for IPsec
processing, leveraging flow filter actions.

Patch3:
This patch introduces new fields in "struct virtio_net_hdr" to
to support IPsec functionality.

Patch4:
This patch specifies the requirements for both the device and the driver
to support IPsec operations.

These enhancements are for providing support for IPsec within the
virtio-net device/driver, improving security and performance for
virtualized environments. We believe these additions will significantly
benefit users who rely on virtio-net for secure data transmission.

This series references the Virtio-crypto IPsec service operation
capabilities and resource objects data structures, and cryptographic
algorithm definitions to avoid duplication, however the admin command
type value differs between Virtio-crypto and Virtio-net.

depends-on: https://lore.kernel.org/virtio-comment/20250429131953.1949757-1-schalla@marvell.com/
depends-on: https://lore.kernel.org/virtio-comment/20250401195655.486230-1-kshankar@marvell.com/

v2:
- Addressed the review comments from Parav Pandit.
v3:
- Introduced VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN flag in
the virtio_net_hdr:flags.
- Addressed the review comments from Parav Pandit.
v4:
- Rebased this series on VIRTIO_NET_F_OUT_NET_HEADER patch.
v6:
- Replaced struct virtio_net_hdr:padding_reserved_2 with
  ipsec_resource_hdr.
v7:
- Combined padding_reserved_2 and ipsec_resource_hdr into a union(Parav Pandit)

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: extend virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 214 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 210 insertions(+), 6 deletions(-)

-- 
2.25.1

