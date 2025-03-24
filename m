Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A7EEAB
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798798; cv=none; b=W2UKwOEUp/ff8hPa8kLv+M7/mnVNG9Ofo1Uj6UEwCfo0v/AV4LApAbtqG/ibrNi5ntvrJJoshmpKami5VcTdLSGuuWA7klp+gK1a+3rZdx2BjjFh1a+8d5dPnKR7cs+YgyfLHqqKxpU0Ve8W3LpIP3ya8f4U2+TY/qBnqSpaq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798798; c=relaxed/simple;
	bh=vQZl3Pn1RH0XxpNPm42a6ER/Pt4VCMQRWa05yVC3rUU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LTVVP0PBnmxF+CXu6l5MW3+aXXabqpROkleV1A3PgTg98tzhulJk1Bu9NPiPlrKoh9HUFbjYR5bPRgLymCh8hok+2UFRDi6H1IyzFpJJ+IalTYFg21NfeRRjkypkzgbMBUstPbdqfHWUYaZXNnjdBgv6exjHXT2YIM+WFcXrh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=ZY7NvwKw; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="ZY7NvwKw"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O3CWIA005928;
	Sun, 23 Mar 2025 23:46:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=J+vF3FnCjW+ypMCie5u61k9
	MnoQf/17v209CfTH2ihw=; b=ZY7NvwKwNCQgFq79Vbu8V8J1BcZJOWgZ2flKD7X
	YnwLF6t3uiM7xYIXq/ywae2LfA3c/JI34cyjgo7QkfpCGDZYXPOAml8m9SRnryhY
	HZQuKVESmpR3WG0LQnmHtj3oP7h5Fj/4Ix8JphVLESD0wGFugW90SsD9SjmzLIAU
	hjimeRV7gr3OvgbVhtxuQr3f90Q65NrZc2XKg739nPg3sqNon3Ipecdm/uR/KhyX
	oHllVAKDFks3fTXVb3XjBVZGH7ccNwjJgfjLvtJuz/XYN7wm4MkgxtPnGBRW72+S
	zJfzA5lhotArip/ehm2LVd5ROF84xBbZrzoQi9IldFfYJmQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45jy9ng9ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:46:35 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:46:34 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:46:34 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id CC8043F70DE;
	Sun, 23 Mar 2025 23:46:31 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 0/4] introduce IPsec Operation in virtio-net
Date: Mon, 24 Mar 2025 12:16:26 +0530
Message-ID: <20250324064630.1601356-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=YvgPR5YX c=1 sm=1 tr=0 ts=67e0ffcb cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=x0C1_AZOdUCCJCe2u-oA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: tWa2oabCWgn7tMPLoTncD4j0S9oA10uF
X-Proofpoint-ORIG-GUID: tWa2oabCWgn7tMPLoTncD4j0S9oA10uF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

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
type vaule differs between Virtio-crypto and Virtio-net.

depends-on: https://lore.kernel.org/virtio-comment/20250324063843.1599512-1-schalla@marvell.com/

v2:
- Addressed the review comments from Parav Pandit.
v3:
- Introduced VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN flag in
the virtio_net_hdr:flags.
- Addressed the review comments from Parav Pandit.

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: extend virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 204 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 200 insertions(+), 6 deletions(-)

-- 
2.25.1

