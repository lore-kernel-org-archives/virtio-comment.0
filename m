Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82D170826
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526623; cv=none; b=uiyWMcBFfunDXb6U4kcSZjxp2uuZav92laLaK2djP3802gicrkO3+vB2WbDDgnEXInIvv9w1SuEOaPyGLVGGVSQM1necmab3XoCAHAioiSipXxlo982Y8GV8cy03PSnDxtyigUsApAeNF/ZOEifQ2EIK+GfUrgHy3ykU3okptPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526623; c=relaxed/simple;
	bh=xCqwH2d1m5jeUld27TjXVh1pyyib4ONIjj+i7/jqaUw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VbWXhSkqQP+eCP1MOiWYXHE3QqEeU9fE2IQYroPeAcCFQgqUCkZTLimZfPICgGQtdywyreZThJf+6YBoY8K2ZWN0NPVQIGOfvS+jcAvXb2b42SlFzgkWpvbR46dRNb1BmzJqeHYpNyytOEDQP4GgoAszdIBSIi/lPDQy+8WAs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=F2nVOb2T; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="F2nVOb2T"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M61bv9026745;
	Tue, 21 Jan 2025 22:16:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=B+9HVKYJJhtiQjjIf/tOiWU
	gzuynHUpF7f1Va9zQ7vA=; b=F2nVOb2TA6LPvx5Y4321uo+2JzupWq61A2T7Euq
	i31DPCEgz/dcRH07Cd5LXes/5ioWNy67fIl+Da3olHmJ+yBvR9WwX+vR9j5GCEf3
	SPMZfZa2HaeilDVD0LctmVy1CWawxFxzDRW28M0bQ6ZdoI/qHi6tO6RC6q7N09GM
	JlM7c77dn1CD5etabyz2f6nPeFQdhuQNQu/uaqZp9uBFkI6XbgoyL4Lm9UEcqE3X
	XpXaCAUBnRQjMdx6hi3n8izMomiQQsSezv6ospGIiOKzWNEwIS35TaRLOnlTffPZ
	CyZh3em19Mo+XBtHRxLyagbeMngIUew37kXqyO4G5VEBwHQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44au1x00ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:16:55 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:16:48 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:16:48 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 6049F3F70B4;
	Tue, 21 Jan 2025 22:16:45 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 0/4] introduce IPsec Service in virtio-crypto
Date: Wed, 22 Jan 2025 11:46:40 +0530
Message-ID: <20250122061644.266560-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _meyhIIddQlbTazirFOwYla1spPHlzy7
X-Proofpoint-ORIG-GUID: _meyhIIddQlbTazirFOwYla1spPHlzy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

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

Srujana Challa (4):
  virtio-crypto: Add IPsec service operation and Capabilities
  virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
  virtio-crypto: Add new IPsec opcodes to data request
  virtio-crypto: Add device and driver requirements for IPsec operation

 device-types/crypto/description.tex        | 486 ++++++++++++++++++++-
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 introduction.tex                           |  12 +
 4 files changed, 495 insertions(+), 5 deletions(-)

-- 
2.25.1

