Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE9442C
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933121; cv=none; b=rEgmfBOAAcVjUEsUxR/kw1G/czqbTU2NhWmtfah97DimTrX4Gyk5T38xaVBTmDmHoJ9ziYVUREuL70iMcPpcdrkCs6fMUn+kuJbEiTpnL3A1smChyfZJidh6vNGTtplPCnznNzYA0ODUlbCLmQqe3g0u4LOcp+0FKc0mBhjsmYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933121; c=relaxed/simple;
	bh=33XEdAUXcxZJ0ECWq9F2Akb2wETdij4sNfrm1rn1eYQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D4bvHJha/kw7Wg32Xscm795KEtLcIbF+U8H3fAJVU3SXDPBfJt9mOfUp+bYlHwg3uB0Na2LuZNBsOO2lYmkWZtKsyzSE5d0v6aDiVjJQfDxVTKrvv+pSc44GjL2ERcdorfZB64hph//NnfPYfRHvNVWckdAY+BqbKpRs7IOUIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=QKETtxW6; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="QKETtxW6"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T6t5Hf018874;
	Tue, 29 Apr 2025 06:25:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=LQ0wE1iuE0L2LIAR6u2yYyE
	EG69gtd/bQZHz6wY6UYA=; b=QKETtxW6nU6rzBzt3H/vXP0vvaPy/f+U2dDAAyT
	1jvAFZPVFsDeaDAIFzutXZAtClAe9J7E0JxQRGEABIjSwc9e/CqLbOVM827kAoqp
	af8WiDaE3r3VwZncSF1VtzkqOtmRi35yCPei/UYuK3wQJXNLd1OQdmcZZZ7XKXkg
	Kp8FsZVrxsrS+rcGcWWceeBWrXqQb8bzv2PbcnzEUnYT4FtDSU2qXBqLgLd3O6/u
	GxexzW3mTWYzhnAPiBEIgjUYGPVy+7fkIGyOnJcADXvakvNIKDnQs25YZrOR/uR0
	C1NyVpKudnJ1F43hZhKIjgyZDs+ZRkkhsRZ1uREkxVRbXxw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq65yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:25:16 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 06:25:15 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 06:25:15 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id B7FF73F70C3;
	Tue, 29 Apr 2025 06:25:11 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v6 0/4] introduce IPsec Operation in virtio-net
Date: Tue, 29 Apr 2025 18:55:06 +0530
Message-ID: <20250429132510.1949946-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OSBTYWx0ZWRfX1wIUkrxyAxbx S6sDsANNH1eLALWnv/gCZmxxk12pw+oiHVuDkW7cD/FES+30YEH1EGdg6zmwPRHXQUuPMVBOfdC +MApN4s4zafanBloa3T66TtkJZEFy12i+HxwwYzVlE0jMDEQDr04teyNPLW1IjZBCBzLfNbTixQ
 vWDcqmeKaxCugDffBfy2o+rSPFSnCxnzTRQSxQI8EA4iBqdD4soAYB3nUEOydJZdUDxLeO8WRGr pQdOKTqo9AozOREi9vjI0R2iRKml6Oy/9MV8DOJd6vA1Hh0P1nlE51X6yL74sTyrQOl7PNh3gAx qw3mYeJtij//JwRMdr8iTBuGhd8v6OQCyGEDkAOeA7xtUSGllUkzvfiECJeqydZuvJVunznqQld
 glDhjNdffx0rpkOriHin8WHOeefIBEzbJG7FZG821GZ4ZP2fYXfg/M6kUKT3q5pT4xQ/Y6Nd
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810d33c cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=x0C1_AZOdUCCJCe2u-oA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: rQV1cQLLzqlvDQ5wCekTuKZLsvEsBDLO
X-Proofpoint-GUID: rQV1cQLLzqlvDQ5wCekTuKZLsvEsBDLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

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

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: extend virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 213 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 208 insertions(+), 7 deletions(-)

-- 
2.25.1

