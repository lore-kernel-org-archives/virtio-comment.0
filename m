Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA521883E
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793155; cv=none; b=cxVjxuDlmajdzGG3R3nfxu9BYELj08hhGNAk30XAiPmYE7hmvdyiTR7atgvvwQ5KWxfYvXaHysE4pTuF7p7kWdKTUMBSSsW6WZ8nUUPXENClFWd8A22BA5l4tAipisGwA9t0ai0P/QFoI8M0YZzxn6Kj9/oKJ+j5XAlSQ4/mvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793155; c=relaxed/simple;
	bh=U6YJZCEdZoSj+Hkfl4cy5EsuGYqn6cL4RBCLfzMMjz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b0BKG/NGG2IqbyYS488fF+lgLeWKNr+wARX5uSLCUf4Qf5vpHq+Ynuj/Lbjzc2MP1iFkj57aZQQYMVZMer39tOC+S6tgk8/5ntkKvBSpB7sFKZgCgEIbSqMF8LimG2dt9svHT8I9SVUKarZ3JRH6KvgWZ37LEVBbmvmk18kYAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gaFaUpyV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gaFaUpyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739793152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ggl1Wpy673jOa1UXF7XyNhfvmUG0kcSi539GR7x11+8=;
	b=gaFaUpyV02u//837ocjc5JXyxepysabN8RTQtsyH44GB2jgDbo6hUgEbci/umlUv2lzmNM
	hNVug9qTpma9iK0pe1BJ4uomADgP+NST0kodA4H1nVm1IwrO5OiEId6x2gUOM+gB1TQLUe
	cCeCW7ujc98ieeJrMSUYReQsk8sv+oY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-1N5f_I63MwSLdhteffSnsQ-1; Mon,
 17 Feb 2025 06:52:31 -0500
X-MC-Unique: 1N5f_I63MwSLdhteffSnsQ-1
X-Mimecast-MFC-AGG-ID: 1N5f_I63MwSLdhteffSnsQ_1739793150
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CFF119783B3
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:30 +0000 (UTC)
Received: from slp-asahi.redhat.com (unknown [10.45.224.236])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B6BA300018D;
	Mon, 17 Feb 2025 11:52:28 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Sergio Lopez <slp@redhat.com>
Subject: [PATCH 0/3] shared-mem: introduce page alignment restrictions
Date: Mon, 17 Feb 2025 12:52:24 +0100
Message-ID: <20250217115227.4961-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: omUeEfOLnuYIb6sMBXDxk3z5Q6hEPyep3TbLZOH9MRg_1739793150
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There's an incresing number of machines supporting multiple page sizes
and, on these machines, the host and a guest can be running with
different pages sizes.

In addition to this, there might be devices that have a required and/or
preferred page size for mapping memory.

In this series we extend the "Shared Memory Regions" with a subsection
explaining the posible existence of page alignment restrictions.

For the device to provide the page size information to the driver, we
need to extend the PCI and MMIO transports. For the former, we borrow
8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
field which can be used to derive the page size by using the following
formula: (page_size = 1 << (page_shift + 12)).

For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
holding the page_shift value. Since MMIO registers are 32 bit wide, we
could have asked the device to directly provide page_size instead of
page_shift, but seems reasonable to be consistent across transports.

Since accessing a new MMIO register could be interpreted by the device
as an error, this behavior is gated behind the newly introduced
VIRTIO_F_SHM_PAGE_SIZE feature bit.

An implementation of the changes proposed in this series has been
published as an RFC to the LKML, to be used as a reference:

https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/

Sergio Lopez (3):
  shared-mem: introduce page alignment restrictions
  transport-pci: VIRTIO_F_SHM_PAGE_SIZE support
  transport-mmio: VIRTIO_F_SHM_PAGE_SIZE

 content.tex        |  3 +++
 shared-mem.tex     |  7 +++++++
 transport-mmio.tex |  8 ++++++++
 transport-pci.tex  | 10 +++++++++-
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.48.1

