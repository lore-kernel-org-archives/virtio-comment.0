Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23221F12FC
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506968; cv=none; b=BNPcMy80OQcsbUreK1DEWFSb7ndUXuHgu/URLr8vz5R7XIlxUqEdHuKmJPJAp8dvNFUVgWPyRx8MnPLyo9/IZVRcciXI0+vhPxMhRZyZZYWuek4lVCSqQ4nGT6vPz1mIFk8P3VTNknS2Dgyt5xiZ3PrVmIrWindl/OW1A9at3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506968; c=relaxed/simple;
	bh=mbhn7xCGZoNtIg5tw9Ew189LBtesNZdhGQFyGST/hO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P8Ujw9Rm63j4XjPNOVD/6TEmhtGl0CEsq2h8UCSW3PU4LS2XT5Epm69AKhg24EQcTZNsg4AdAbZ6je4AjPP5HBk/79uHpkaU12YAZiPZHYwDWFeC9G2B2gpgxPQbRe1OJ8TUuEC0POfGZlg7pRpmrebt9RZtBKmDwJqiQy2OAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KzYX7QC7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KzYX7QC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743506965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lamCCL1a1jFNxyLunh4VF6Y43yV+Ll2wAkCFeA+cSBU=;
	b=KzYX7QC71GFUieAJ2pvD3nnMv0mVbn/iHit8NB/RdqYQPvkpPqSkl16AOb/gvu/sxdY7ax
	OJG9HQ1frjYFl0r1pO9qmyQVvOww6Xg/Z+T2ak/D9+hso01fxCuzMicg0ZkvYdBTKt0Urd
	EpfDiRS4ZPcXLmU14oHkIfoNFP6OQbo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-xt6g_muGP2CjWQ3ciFU9nw-1; Tue,
 01 Apr 2025 07:29:22 -0400
X-MC-Unique: xt6g_muGP2CjWQ3ciFU9nw-1
X-Mimecast-MFC-AGG-ID: xt6g_muGP2CjWQ3ciFU9nw_1743506961
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D027195609F;
	Tue,  1 Apr 2025 11:29:21 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.225.223])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20C971955BEF;
	Tue,  1 Apr 2025 11:29:18 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: mst@redhat.com,
	dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Date: Mon, 31 Mar 2025 17:37:08 -0400
Message-ID: <20250331213711.63398-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lerme7bS3VumjoX3ror8FYzRZzk-ot9KVQtOx9JFjeM_1743506961
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There's an incresing number of machines supporting multiple page sizes
and, on these machines, the host and a guest can be running with
different pages sizes.

In addition to this, there might be devices that have a required and/or
preferred page size for mapping memory.

In this series we extend the "Shared Memory Regions" with a subsection
explaining the posible existence of page alignment restrictions when
the VIRTIO_F_SHM_PAGE_SIZE feature has been negotiated.

For the device to provide the page size information to the driver, we
need to extend the PCI and MMIO transports. For the former, we borrow
8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
field which can be used to derive the page size by using the following
formula: (page_size = 1 << (page_shift + 12)).

For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
holding the page_shift value. Since MMIO registers are 32 bit wide, we
could have asked the device to directly provide page_size instead of
page_shift, but seems reasonable to be consistent across transports.

An implementation of the changes proposed in this series has been
published as an RFC to the LKML, to be used as a reference:

https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/

v3:
 - Reintroduce the VIRTIO_F_SHM_PAGE_SIZE feature bit, but limit its
   scope to page alignment restrictions, still exposing page shift
   data in the transports unconditionally (thanks Michael S. Tsirkin)
 - Adjust the feature bits to reflect we're using another one (thanks
   Parav Pandit).

v2:
 - Remove the VIRTIO_F_SHM_PAGE_SIZE feature bit, exposing page_shift
   in the transports unconditionally (thanks Parav Pandit).
 - Didn't pick up R-b due to the significant change between revisions.

Sergio Lopez (3):
  shared-mem: introduce page alignment restrictions
  transport-pci: introduce page_shift field for SHM
  transport-mmio: introduce SHMPageShift register

 content.tex        | 10 ++++++++--
 shared-mem.tex     |  7 +++++++
 transport-mmio.tex |  8 ++++++++
 transport-pci.tex  | 10 +++++++++-
 4 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.49.0

