Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8910263C66
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097945; cv=none; b=hKW8UpJdowkUX/GM4LEmAOLxNeulB6i6EjQNb7DqOGwX+swjoF9GDjb3oRQJnbk4qvduoHV0aPu7MX056gZjxX2j96ouXmP92A1QIKgICSjLZIqNz3FBBX6tEagSJg1lhlXozFgdhkDcmzV3+PGWO4/y2g3sHc+lgPlnrLHAE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097945; c=relaxed/simple;
	bh=V81zCzTUAnqws3l8RSjtzhDqeMX6Jl3c3xzJ2YtGGYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dv6FZSL3p2xHDuZo+3OY+Ho8knm3OLj39lToU6hvwuCBa9Z0ZVq+JNXCM9A6Cox7hs5bd2cQMUPMGQjjEKCxMIK4bzsaNNqWQ1Pp/alyzdOlbmrCLrrnpWBBAmdVKAnIbkLo0HutXYEhVyJ5+fOuQfMMOH6PLQEbErDB7vJ+vCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=efSLKoEU; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="efSLKoEU"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5387Mwjp020169;
	Tue, 8 Apr 2025 00:39:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=zGGjLpOm0Ab3PpnQPMeZKdn
	z9z+ZPrF8VqTHQ29pvbE=; b=efSLKoEUF0PBh2kicnlx438+gPVR5aSrpHMkrzJ
	liZARcMNpi2Ab6OhsJOtembwY0NCA0heHVxOgpbyOhWKR6K8EFyGJ5FbHZKRisDg
	SCK8Me61nKenl4rFioqyVBwJ+uYmjfvfxWetRMNyu0+o1kWpq58nSuqd3X65mHFs
	ZWjy6g68/ZL5N6ihM1o9F612wDlQoIFpzqh5Mwn+8UQChoa1nPmfvGIri1/RMior
	JJXeQ7BJSdZMXx3BwIN6AxLlPtoUlybu7mpbKMa8plxghkDaSWEJXisMLBc1L3rb
	azcHUGhlifTxL6brhezvSEfHVKnKiB6XrECa6FA23SSE25w==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45ursc44kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:39:02 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 00:39:01 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 00:39:01 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id CE3293F7114;
	Tue,  8 Apr 2025 00:38:58 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Date: Tue, 8 Apr 2025 13:08:53 +0530
Message-ID: <20250408073857.1783779-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8K7EO7rGBrTsYViS4GjXiT0h2mQxPUrY
X-Authority-Analysis: v=2.4 cv=M85NKzws c=1 sm=1 tr=0 ts=67f4d297 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=x0C1_AZOdUCCJCe2u-oA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: 8K7EO7rGBrTsYViS4GjXiT0h2mQxPUrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01

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

depends-on: https://lore.kernel.org/virtio-comment/20250408073512.1783641-1-schalla@marvell.com/
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

 device-types/net/description.tex        | 206 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 203 insertions(+), 5 deletions(-)

-- 
2.25.1

