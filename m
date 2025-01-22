Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27515B546
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526912; cv=none; b=Ce8GaDatsRk2UaVrjuqopLOficU48oTynwC4J4m9870AKxEaDUGTPwTwe0Wvh9XjC/sX5J1Ea+3c9SAjJdcQm6kJ9qzYa4B7zGQOHjfQi48I6h2+tw0gmPZVrYKSpAAG4NG2STxN35Cs0ANw5utRG3qtGPfv9kWRaVRojYm7lRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526912; c=relaxed/simple;
	bh=zvbzy+FZ7cVnJgcATYddeT8ckjB3mqrNt/Q65k3eWro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WbC/Wb4eZsp/FJOXlQYrGAAK9Y0n0kUUhxwuaIeFDNAkLJvl242TRrSGWcCMlL6nrPvUU9b69WVsLWj/2/fmmGqgWXpOROD7Vi+rx1G90E5cPEgZWtRyNVPfh9F5ZJPVUccMOHPR056MFgXqxTiiTMbsSBABvDmEWnMgCLqRFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=buljBwdn; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="buljBwdn"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M61pxt026905;
	Tue, 21 Jan 2025 22:21:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=xwwwLQYSnNQLlzB/rC4vbcA
	Be12P0RJO/b6Qx7WIzgw=; b=buljBwdnJ7s41vNnIeopWQ5xIB1fkntFPu4la1a
	bNV/VX4j5dxWBqG/dYXp9eiY1IAdXqVsUtNaYSTBly47t1gkG82yEobqMbBwqxMb
	5ftiTSd25wd9izdVopgsHA99GcbkxAmqVRxc770eMYYtasavMv4HT0Y2rFKLIWJk
	3PXzQKguDFP3Y9kbp2jQdmUBTBhaeH8d5VvEWg/2rPY+cKqHYt9AtdUz8elwEiQT
	Yasf7MB/sb4tfKO3owDl9ySDgGdl6Za1NNGrwz5pdT3QMFebrwgZz7YPhh4OwuDq
	bZb9DEgs9noO8bTkFgMV3ZwAE1i9fTJpWR2yVA0LudmCMAg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44au1x014d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:21:49 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:21:48 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:21:48 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id CE3E43F70B4;
	Tue, 21 Jan 2025 22:21:45 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 0/4] introduce IPsec Operation in virtio-net
Date: Wed, 22 Jan 2025 11:51:40 +0530
Message-ID: <20250122062144.266725-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tTSm8CJSkcbhxQmb15DFCFbYBh6a0NqL
X-Proofpoint-ORIG-GUID: tTSm8CJSkcbhxQmb15DFCFbYBh6a0NqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

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

depends-on: https://lore.kernel.org/virtio-comment/20250122061644.266560-1-schalla@marvell.com/

v2:
- Addressed the review comments from Parav Pandit.

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: extend virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 195 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 192 insertions(+), 5 deletions(-)

-- 
2.25.1

