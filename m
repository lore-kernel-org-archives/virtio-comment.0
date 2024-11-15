Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E852F9E
	for <virtio-comment@lists.linux.dev>; Fri, 15 Nov 2024 11:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671130; cv=none; b=k6PPZANDS917TaB+So/t1PvciDiH3aVcAdQ4huKwbklqwbvjRulL3B/Z+9cjrT2T1cDqwvaTqmDXuW9QH/Pi7ySCfar02as9XeoIPoAE5Xy3M0qk9xJDKuxNMc4hR9MTFK+lBKiLEy9CwO4Hq6Nue9H4wiZGyTgB3jodVe1B7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671130; c=relaxed/simple;
	bh=+GMihqrflnfEVss7YCfHa4asutfD70QfDP6QY4Kys44=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RT2A6yycgXehZ96WR6z+5x2aTSLSHq4sdZCJuKNO+SIyK1zG8bqEU+W8hPIC5TMF2rjK+kELawHdEX1EJhY/KXauB7uptOwYv91eB7R2qXj2Ti6MtTAfkAcJ6fnzRXbMA2x361wRIpk7UW4Z+KUVDJli2Bg6ahs8IDgm868jStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=C0kRt5g4; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="C0kRt5g4"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF7YI96011764;
	Fri, 15 Nov 2024 03:45:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=HMnEj9kJVEsH/U5sc3dDSCq
	NuXtrgpFG0oXZx3zi3Ko=; b=C0kRt5g4MlaftVUzs2MzZyNEXMaMTGm7PwtRJYu
	l3VhEIjWr6RTnfaf53wN/f9Xy0Ck2awPSSe+0AWmFI7G955Bw52Wu8kgPQ0TzGnp
	vx4VPkVFRJc1wQ/uAquy2u+WV3ZZ3B9ain2iI5pZ9GtPoO1zfOyKtOtqiXlW20KQ
	WLMSmNLVVpDwuJujhwmzFL3I+54zaLVbXOP62n72e1oQwuJ4lsIRB1OQXHusPp9p
	8V50FOckKu0uGyz+d/En62/Fg57kVY6EZsPa4chvhRFeo60CsbfmvMN+cqRWejW3
	lk1YkpIu/xQcUCzYnu2H9wkeXeDJK9W2dMlIeKGLZyIx9Pg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42x2128b3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 03:45:27 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 15 Nov 2024 03:45:26 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 15 Nov 2024 03:45:26 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 132DA3F7048;
	Fri, 15 Nov 2024 03:45:23 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <parav@nvidia.com>,
        <sburla@marvell.com>, <ndabilpuram@marvell.com>, <jerinj@marvell.com>,
        <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 0/4] introduce IPsec Service in virtio-crypto
Date: Fri, 15 Nov 2024 17:15:19 +0530
Message-ID: <20241115114523.1787840-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -W5bCmfVzlbuUexdeIqrTFRyjImNY2E2
X-Proofpoint-ORIG-GUID: -W5bCmfVzlbuUexdeIqrTFRyjImNY2E2
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

Srujana Challa (4):
  virtio-crypto: Add IPsec service operation and Capabilities
  virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
  virtio-crypto: Add new IPsec opcodes to data request
  virtio-crypto: Add device and driver requirements for IPsec operation

 device-types/crypto/description.tex        | 476 ++++++++++++++++++++-
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 3 files changed, 473 insertions(+), 5 deletions(-)

-- 
2.25.1

