Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE722620C2
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097726; cv=none; b=CKaq1EhXBIrtPf4cIqxff6FGfq7SVZcAYkI4ayT4uKTO+w0igrpNbTV1I2KU9k5kA5NFrp2ZBBjmaspvaZbN1qHb3MNB9Go1wR4+PBhZv3fNqVlN1LXcZt5lBHEfM7QGPLZc1yPmxCLTdJ7uFH1Y+IxFuTvsWhtaAKLktHzh28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097726; c=relaxed/simple;
	bh=XcgcriqnVRLDbJ6Xs0ci/wtFccg39wfRMOeNnJfdfcw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O7zFGwm8XNHhptlPaIndteU2jV5eH20dHurpJJXO5tb5Cb6cx53UAXSOn+ZMvmP/+J1NkkrnIJoNrmzldl2s1eJqrDk07WxCj6vSOAavYvm7F41HTFoI+ILGbbLfI9rzbrJMv6DBuZzMMbPE8mNK2u4bGz/zZii+uLvS3b62Vqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=gi791a/x; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="gi791a/x"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5387JBHr002628;
	Tue, 8 Apr 2025 00:35:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=zDZizlFJ5+tLOoNcpp+3WV2
	pmEUQ04q2eA/P6/4xc04=; b=gi791a/x2N7EAPw5ZT+6rcy7asD8ILTXS/cBXNY
	OFSCrEDIEqf1//tc5AGRC3N+t1uKWDak5UGfaXee4eys5pIV0IYNVxzntbZszJQU
	001gBlyK9Eb5RZrLzifE20BU00sBfEv2eNkBqRWPPFNxqnZzLdOuWc+VAnKrnIeM
	OoFOY7inl0rHceIrEUEn+hkXqlsihzn1NpU/nt+y/Fe1oFVx4MTm5DylRdkMPLmJ
	zlVk0UX3jMyz5+5VnM2GNYZLcdca4DZ4Tc2lw7bqO1IaE259oeOqv5OfAAcgD6m0
	RUkKYnThhg5iW0S555yhFYWSAjf1GuUcYSUKltmIZCIY6Zw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45un99v6xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:35:17 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 00:35:16 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 00:35:16 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 27F923F7114;
	Tue,  8 Apr 2025 00:35:12 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v5 0/4] introduce IPsec Service in virtio-crypto
Date: Tue, 8 Apr 2025 13:05:08 +0530
Message-ID: <20250408073512.1783641-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I/JlRMgg c=1 sm=1 tr=0 ts=67f4d1b5 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=mchOrBHCVxKrAIYRA8sA:9
X-Proofpoint-GUID: ZYx1FIS94BAQ37qLds_AwetaCzYbEYS0
X-Proofpoint-ORIG-GUID: ZYx1FIS94BAQ37qLds_AwetaCzYbEYS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01

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

Srujana Challa (4):
  virtio-crypto: Add IPsec service operation and Capabilities
  virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
  virtio-crypto: Add new IPsec opcodes to data request
  virtio-crypto: Add device and driver requirements for IPsec operation

 device-types/crypto/description.tex        | 512 ++++++++++++++++++++-
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 introduction.tex                           |  12 +
 4 files changed, 521 insertions(+), 5 deletions(-)

-- 
2.25.1

