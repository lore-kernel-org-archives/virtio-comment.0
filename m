Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183D203D56
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346149; cv=none; b=F37suDpgH5O6lzR6kwwSO7UXAwLH5racT1vKAy/g9xmyvNAgJdUNmpP1gQD23RJd+zMJWPa5yHGnDr/cZanQhObS4uhjBoROSMbcqwSgVubcocGx1n012Z2BHRaVNhed44A8C3q72V/+Ml8n7v834n2iya0mfd2Nj5a/yYWyWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346149; c=relaxed/simple;
	bh=4twAMvqYfx5JqDqprQIVgn/yp33bbnd/YOjuguoBlss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Db9u7dTz5AguBQRrw8JaOaw0oBH8DjZbgZayrYn1QXXo64jE+1KQD6vR5AX2angt74gmT1Q6VJ964RTka5Tb8TdVAqQMwE0RI2c6upgPDcDlgNz47EdSZjgvRy6J7T4u4gzmLM7ojbiulMSz3cQ3iG2D1bRu7ijg2+Galog307I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=CS5GNls2; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="CS5GNls2"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAZTnI022731;
	Mon, 16 Dec 2024 02:49:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=/RRFVMQTqaR4CEBoosRbVes
	gLPTnYg0+O/oqNw79fFA=; b=CS5GNls2KcGHva1xkKImysSNiTRg7LZcniibygw
	uwkWJNfSukFWXJKl6KVxsaXTQRX9IwIjMk1pp65gTnDhYO5fC3yhNwwPrUYl+49U
	lkpV8V0VALCLPwaD7AWTFtV8KKGr0M1G8YA/aaLSh8XtzljGHzhlXzErLrRC6Jeh
	0SyB3qNjxnb/6dDDjDXXcIl9Q/XOO4i01Q71hmSke1xZ66KntMyKLqh8al2MykZ3
	LGgVouVhkgXAx5IP/rTzjSUuoY/v0MXO6Edg80QZWbt0PKy5aNm22IAQfdZ7CM7k
	2cOoj3+CLxMxfeLc3Ut86YBHSwBv1Zodv6NVI4FWacKD05g==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43jjkb80p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:49:04 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:49:03 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:49:03 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 5B4B63F7045;
	Mon, 16 Dec 2024 02:49:00 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 0/4] introduce IPsec Operation in virtio-net
Date: Mon, 16 Dec 2024 16:18:55 +0530
Message-ID: <20241216104859.2720719-1-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NEX--M4j3fxtytol4p_Y85o03-EZcUL_
X-Proofpoint-ORIG-GUID: NEX--M4j3fxtytol4p_Y85o03-EZcUL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

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

depends-on: https://lore.kernel.org/virtio-comment/20241216102102.2720453-1-schalla@marvell.com/

Srujana Challa (4):
  virtio-net: Add IPsec operation, capabilities and resource objects
  virtio-net: Add new flow filter selector and action for IPsec
  virtio-net: updates to virtio_net_hdr for IPsec support
  virtio-net: Add IPsec operation device and driver requirements

 device-types/net/description.tex        | 191 +++++++++++++++++++++++-
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 introduction.tex                        |   3 +
 4 files changed, 190 insertions(+), 6 deletions(-)

-- 
2.25.1

