Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C723314B
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487820; cv=none; b=TC01whJofnWEts0Bze24xFRdmIyJjbePP7y8qbCTq18KCGNn8fX9jKe8skHL3IFtkTVBJMeTjfiJhup8Ht4M7zu2YsKnqHFAaaKFti/6lHn2Ru+VIzGM7YywW+PzSWT1Jb/+csMxjEl0jgxO6WskdXnyCAZT1E9+KjmIMuLeqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487820; c=relaxed/simple;
	bh=1Zue83slOql5sObU4eguuP1cXh2lkCzZVWHmAtdi9IQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hazm8avGTtlGY7DMbovHoLpgI7W9KarMdRchEb5BeqrSkLa9Uc/0DJlcIiAGiBGIozrgNIsIcuxypW0B8lHezlL2Mp32TzzMLN94Y7CXT9V5FAtU2a7vQ1Ivbr80zFUZHNGsKGJBc7wzrt1fwjHjviX+OVxJjN90a8DpfKeA47c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=bm70JDRo; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="bm70JDRo"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9GpxE015614;
	Thu, 24 Apr 2025 02:43:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=fTSfw0JKSxlvl6dAbHI3Eiw
	rwT+Rso6PbJ1olTi3YH0=; b=bm70JDRoucARxE+cVMQd/hYAXbOcCPj9udZYTxw
	VEwXR5aUIwy802F7cVGkf4nndJ72i6YeeTawOZYTtpnZcfLIbOodpprT8pPlGExq
	p137MiE2+5eDt7redxXtCwCpYykjK24xlkpsQt5JOEIN6VTM27xxn8lzgbUJclDF
	a4Td2KBK89UsW4i/fLTwgywoIo0hHLhUquG1kUGVrajzJKg8pmkIyBYq+lO+JLG6
	Th9DwYYVLARp3SeMr4rf/KM+XsMR1Do2vtDk2lfFFU47/uDoSWKQQXjlImfcEXdT
	6QjLxGBL+a7T4TfMqZJsO2/VU3y/wtT3AvHLhL7qFnRHbeA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 466jjwv6s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:43:37 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:43:37 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:43:36 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id AEECE3F7097;
	Thu, 24 Apr 2025 02:43:33 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v5 0/4] introduce IPsec Operation in virtio-net
Date: Thu, 24 Apr 2025 15:13:28 +0530
Message-ID: <20250424094332.1927688-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HfIUTjE8 c=1 sm=1 tr=0 ts=680a07c9 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=x0C1_AZOdUCCJCe2u-oA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: MJAv9hlAuFFLeg-ThRJNkG3zK7V0mf8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfX812bOw/VGc2T i4ZYTXUsH3AlV2YNGAkdypljRh6xysVzqeBSPHlvN8nLh5WhUU4OBVCPYQI5G7YzML0RtUaPtcf bC4b4VP6Vvoc3BpH8EuJMSneMIOYFVo3n+Yd75ehsn3guGoD1UZFLLDh6ZHefbZuTrrPsSIJlK+
 ubecdZWpNqKq1pAyTZJMi57j1qB9Un2ABkpC2jIo7fFYKAM0ctZ4qevb/fLEiffVJhc1AfjHBSS 3wFwS1SI5xoxKI6FfOSOldHhYb2DzqOYnQK1Z7U2JcdYo4pPZ5WBi0rkYTjx8O5+68Zk5iTtRWz z8qtGPwVsLv00bo78D2HL5L6Dk6OCHaop6N3xMxeXXQL9NjRGrcAJXRgBKhY8Jlk+9uEFGpob+6
 3gL+gyxmXsBw1FNufaQqJH18yBDZLEStDPFAZujNbIDLeXQ3X3Gmd7/r8QdoD4naeBGopXfU
X-Proofpoint-GUID: MJAv9hlAuFFLeg-ThRJNkG3zK7V0mf8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

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

depends-on: https://lore.kernel.org/virtio-comment/20250424093046.1927395-1-schalla@marvell.com/
depends-on: https://lore.kernel.org/virtio-comment/20250401195655.486230-1-kshankar@marvell.com/

v2:
- Addressed the review comments from Parav Pandit.
v3:
- Introduced VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN flag in
the virtio_net_hdr:flags.
- Addressed the review comments from Parav Pandit.
v4:
- Rebased this series on VIRTIO_NET_F_OUT_NET_HEADER patch.

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: extend virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 210 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 207 insertions(+), 5 deletions(-)

-- 
2.25.1

