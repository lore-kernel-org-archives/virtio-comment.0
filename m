Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04B36D
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798451; cv=none; b=rt/wvKbBqLvfW4MnvdoCjA/GwYMoXmhJ+rkB1rY6/wGZpnd2DzH9veQfeCycWFVFcdSxtwqynunwvKdpkpmf9oVFgM5NauELJSxUDLo5x+3btV+Oyxy1Z2MZJlIgulYHMtayD7L1EFEhl9dJkwxCWJvoGNFwBC92lFSBS659asI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798451; c=relaxed/simple;
	bh=A0hN2ebXnzIWrAEyaj7POStyo0PxbK3tcbVpggQJscM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eTXTKfg/nFzlso3iJAHFLEsno5jqM1oE1HJi6+vg6P/xt2JCMqCfBRYNJSi9o21duAkZC6nNvSk3DHaCpWOxwI8gNvIkBCStXjdWo/IIx3y2msf75E6V4+Z8Isgm80PbrREsZWW9RfGWxVvVsgKNUAi8pcl1Vqtly0BfGD2/CNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=J2Bo4Lv7; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="J2Bo4Lv7"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O65RsI016893;
	Sun, 23 Mar 2025 23:38:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=ty2W76eBpjiqBPLWq+WEYfH
	NSwH7MKRSqR6XqMSICH4=; b=J2Bo4Lv7TJlx8V6DGheo4A16ZrwhpFkSiaxzJLz
	ALC0YzFsvvEnJ7bz0AcwCX8Z3Jlx4ycPp2eDPoXQ6XTPTl7HYjsPY8Lb/8ER/J+7
	82iHNWQQrZj5nQf0y5odlyN1KDlm4VoefO4IfPEZ3/FTlZpzg4YrAQEAgtst47EE
	HZomuV0RBJXTuneFquONmmouBJZp+Z8i67kANcqFoLQok/ao54Mj4izBS5Mu9MQ9
	jZgGHDP41fmSscBmGPlOK7T3S1g5m7/hb6xRIpFzbclycvqokJpQAfmcORKqzzNn
	50xJAxl/k0U7FWLTwIt5AjQo0HaDWi0lLWVnof8j2+MGjOg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45hvqjjg4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:38:49 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:38:47 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:38:47 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id A296B3F70DE;
	Sun, 23 Mar 2025 23:38:44 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v4 0/4] introduce IPsec Service in virtio-crypto
Date: Mon, 24 Mar 2025 12:08:39 +0530
Message-ID: <20250324063843.1599512-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VC8NUQde_i0rC7iRdIVceOkb5rJhEjc1
X-Proofpoint-GUID: VC8NUQde_i0rC7iRdIVceOkb5rJhEjc1
X-Authority-Analysis: v=2.4 cv=YYO95xRf c=1 sm=1 tr=0 ts=67e0fdf9 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=mchOrBHCVxKrAIYRA8sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

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

