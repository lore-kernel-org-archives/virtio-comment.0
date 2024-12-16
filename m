Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822D202F7E
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344473; cv=none; b=RDA1ay94i6aSQaKehoEtEXYTCO5ZCr6Ticr9bqsn2nL5oJpmo01Be9QFZmuvy57MZ9Wz+uxeLzkWBrGW7qhtZTB95TFFW7smQdeTvBhcIFMFmXlQrfbegzO+PgJjowS5ZUg1uoMIl7EnaGfoZ0ftLvKCkmQofSFvYW08iLEY6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344473; c=relaxed/simple;
	bh=6jNUnVkKsLaEJVKuHZElg2uJhQ4s4zbjKsQKE/Tc36k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q5bd/hTm2D7sCHF/+KBdq07F1MBHEwJnrZgGQJwZBXjq9clSMZGIF5n4FPaf6KAg4fTBVTkh0Y70Vttvw8PIYq3QzJ7Rjg9bbMjihggP0rcSh7kSaZ7DY7AOtBTDpV1wPpdsWCjF+9qNKASdhAR66gD7YiYAC/if95Q/1I4AXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=ds3+bX+e; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="ds3+bX+e"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9MtVm004975;
	Mon, 16 Dec 2024 02:21:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=gV7sTSnHFztjAsy0bcd1PP+
	vmUpGJeWxGSEbdjM34qs=; b=ds3+bX+eYb1JQ7Sjmi3LHGwj4qLacmqTx72yCV6
	+xTnNr98bCQUQ0jeIb1gIUv+dAC7ckiS99tmlZmtf5ZsRxQGU3aYNKe0zjlnt3QW
	nmoS/BSHVIfXcnOw3HoQ+v1L1VdVPVcF19/SpNLKMVJ+HM4dXCkGzWn2xfFfjUgw
	eXeZfGWwSseasbXLV72FeU63NYb6Td3Yt0o3tEYNPErr4pFtp7KhjpKXjxi2cYf9
	awMmUhPrrdo7AYtnGmvEeleFDXlXO/vOYdisrUtRCJ+SeAVfFO/7RyJX8eSr4rPa
	p3TbJPQHvkfBOyv9BDU32l8EXRsGsZeWpNjjgABZc3tZQZw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43jhh6g3nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:21:07 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:21:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:21:06 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 77FE43F7099;
	Mon, 16 Dec 2024 02:21:03 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 0/4] introduce IPsec Service in virtio-crypto
Date: Mon, 16 Dec 2024 15:50:58 +0530
Message-ID: <20241216102102.2720453-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NYnc9DnBPdBLBJVVvCrTruhVZ9LgKzr_
X-Proofpoint-GUID: NYnc9DnBPdBLBJVVvCrTruhVZ9LgKzr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

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

Srujana Challa (4):
  virtio-crypto: Add IPsec service operation and Capabilities
  virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
  virtio-crypto: Add new IPsec opcodes to data request
  virtio-crypto: Add device and driver requirements for IPsec operation

 device-types/crypto/description.tex        | 473 ++++++++++++++++++++-
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 3 files changed, 470 insertions(+), 5 deletions(-)

-- 
2.25.1

