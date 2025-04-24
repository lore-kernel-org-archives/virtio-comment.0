Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A03207A2B
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487321; cv=none; b=NoGvr6X84rvd1nUyhn1PPiGfBcU9xv/H+uiXG0NJfQ+RN8AxA23G+HUtb6PW80CDzMgCamcX6A7XS7jSLonshlk4BVnkCe+5ogPXMGvx8mRxR0T0X7t8Nd9gcJxzrH6Y7Id26qr9Oy1WSUxtD8Q8WHOFn0ZI6riGXIAsIB3TXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487321; c=relaxed/simple;
	bh=dlsFysfTiAkxNHLZKo4lN+uvnZwPLF5pC6ElgqDOKLw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M3P4ZBac8Ws3LyuF1sT4Yqz53DYOTxAcvlLbeMzgR2y3U/oWjSP9SgMMd1BVaDAdimGx5Pfdqy36rhgQSsdgmliXbr4DXl5y2tGfeBxNbaT99aN5zcDU+6b2SHeN10xowSZILWU4kd89jzGbpWdWDMKDHfSX2Ct4eqjXD79pFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=FhnBgctE; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="FhnBgctE"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9CWQ9006551;
	Thu, 24 Apr 2025 02:31:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=aBUMnQ9/sq7dw+HWIsBTnGI
	j971R8D5Kfb945b5543g=; b=FhnBgctE1KhXAXNbPAezcGGPpL9PIn0jF+jP+su
	tkLQDlE1a1ORKVQDzfWY6wRLkTynmKFNRWbG6lPquzlDz3MsYX6tEhxe5hhp04U6
	nOs1HILPT4B3CmINVAQT9y8u5FxeQuO78N73Ar1Tcq2+fdHkyXKMf10XpM/Om1dY
	cmlVqERpSngtVaiu96ot22gRH6ZUDzK/HYC7j7BPabzcwAWuedxJGlGn1UzZfjW7
	AO6Dp36iW4n+ub0tqTEUUZ3ZsZlzM/sISL8/EzJ6/kms8N/sOwDnvGUsZdYpCA0N
	C6wWyd36OivxxTUSTR+dZJz71w9eBcKOezCnjgxgQL3PWng==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 466jk1c4td-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:30:51 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:30:51 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id BE5393F70A6;
	Thu, 24 Apr 2025 02:30:47 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v6 0/4] introduce IPsec Service in virtio-crypto
Date: Thu, 24 Apr 2025 15:00:42 +0530
Message-ID: <20250424093046.1927395-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXwRZtg3r5Lc7N kCSoBfGMDnLDZF12pkdeoyjzv6TL6U8Z0GzbZWFB9qz/4aNPckjvkboN8JpIlMHNRpV7aRmAofZ 78uqgPLi4/F1+HB1EDK8SCokaJQKM6mbeqn4KbjaO9uAxfDeSv+Ugt6OeXmYXNUXMZfwbBrDs67
 b8PvJJjCDqhlHj9q9lw42fJPj9PGuiwZ+KMHOQFNrp2NpGsa1NV0v14kIb9RfUIJddKCw9Us8pq Y+jE8jsyIBVNYShRZURb/dNeiwmdWhpPSnOEC11Sm9iy+bCgLPhSrb0mui8gaM5Kq2BXKg+wn/p LCVX6m9ghGuNNaxLXNTAdGxHYbgrKxb2VrQ3YmOyTOa7M/vBblsr8cI1pEXknEhXnCZm1qMzw43
 bW/LXoNFa0ueGp7BftM+aKs+jYsoORu0+LPj2i+0G1ni4WalkI4Bjq1KQa3YRkZBVhU/GvM6
X-Authority-Analysis: v=2.4 cv=OLwn3TaB c=1 sm=1 tr=0 ts=680a04d6 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=mchOrBHCVxKrAIYRA8sA:9
X-Proofpoint-GUID: QbFI3TkSJBjp2uWI-8eCBAkEOXZSrI0q
X-Proofpoint-ORIG-GUID: QbFI3TkSJBjp2uWI-8eCBAkEOXZSrI0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

This series enhances virtio-crypto by adding support for IPsec
services. These patches aim to extend the capabilities of virtio-crypto,
enabling it to handle IPsec operations efficiently. In addition
to standard crypto processing, the IPsec protocol processing is
also offloaded to the Crypto device as lookaside operation.

It utilizes new virtio basic facilities, including capability and
resource objects. Below is a summary of the changes introduced:

Patch1:
This patch introduces the foundational support for IPsec services within
the virtio-crypto framework, outlining the necessary capabilities for
IPsec operations.

Patch2:
This patch adds resource objects required for programming IPsec Security
Associations (SAs) for both encryption and decryption processes.

Patch3:
This patch includes new opcodes specific to IPsec operations,
facilitating the handling of IPsec data requests within the
virtio-crypto driver.

Patch4:
This patch specifies the requirements for both the device and the driver
to support IPsec operations.

These enhancements are for providing support for IPsec within the
virtio-crypto device/driver, improving security and performance for
virtualized environments. We believe these additions will significantly
benefit users who rely on virtio-crypto for secure data transmission.

v2:
- Addressed the review comments from Matias.
v3:
- Addressed the review comments from Parav Pandit.
v4:
- Introduced COPY_DF, ECN and SA LIFETIME to the SA options.
- Introduced SA lifetime to the SA resource object data structure.
- Set cipher and auth key arrays to fixed sizes.
v5:
- Addressed minor review comments from Parav Pandit.
v6:
- The esn field has been removed from the IPsec SA resource object.

Srujana Challa (4):
  virtio-crypto: Add IPsec service operation and Capabilities
  virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
  virtio-crypto: Add new IPsec opcodes to data request
  virtio-crypto: Add device and driver requirements for IPsec operation

 device-types/crypto/description.tex        | 510 ++++++++++++++++++++-
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 introduction.tex                           |  12 +
 4 files changed, 519 insertions(+), 5 deletions(-)

-- 
2.25.1

