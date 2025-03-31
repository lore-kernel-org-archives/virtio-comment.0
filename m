Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5501F213244
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436768; cv=none; b=OhBjoackN467N/aN/7N6JRDUmIbHyXmrQTkkcDExm8yXHbtKn5SdvNaK2d4mE3dD7fayQJIj1l3kC54eCs+X4tUsGSNScJH44YaF85C0Eovz2X2EMKdnDg7fZUeylWcgubENJaKjIuwHhqo4g9BjoAOwkPRBFuAiIjch0w3JtvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436768; c=relaxed/simple;
	bh=Q9qihBivVirfaCTv/SHLfTkpmWMuVNLIMyS+B+5ghRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LCN+QKtF9zpo2vdwdelb0iqOO9mGasaOhNgeHpF3WVe6WzqnsBeVR/JySSuwOcWlW40DdQt8UdfxIM4+cViqltec7Vhj+TRJx4sKzlvppx+wLPnnJV7LaS6rBeCkaPAh9IlS9h8MmdljPnd+S5zqG6wOZ/NK4VhuIfDKEFqpCHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RIxzhU7S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIxzhU7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743436766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j8p+UlpdcS6D/co3tFKHQHx8KvUjFV9Atn6iIp1dKyw=;
	b=RIxzhU7SL8W2EwdZuMarc5mVPjjjQv+dmDFEmRn006/vtJS1Olf5D71FWcCcYvDubSs7wU
	BMztBdwwnSMRqhOcGHn0XIsbPjwTXABLy07O7L/D1mb6cvPqT2rJZjaalkh5uh7LkXDqZQ
	Rg4qA+6yc8Z6IbGkjxM0TGpvDCPOby0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-KnY4_XAyNFOjXcN8QeEMQg-1; Mon,
 31 Mar 2025 11:59:23 -0400
X-MC-Unique: KnY4_XAyNFOjXcN8QeEMQg-1
X-Mimecast-MFC-AGG-ID: KnY4_XAyNFOjXcN8QeEMQg_1743436762
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEC081800260;
	Mon, 31 Mar 2025 15:59:21 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.224.27])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE0C61801752;
	Mon, 31 Mar 2025 15:59:19 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	mst@redhat.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 0/3] shared-mem: introduce page alignment restrictions
Date: Mon, 31 Mar 2025 11:05:45 -0400
Message-ID: <20250331150548.50595-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Dd1XInwCgSTxFhsfOWuhrD8pfdea27M-l9Mu3vYuYY_1743436762
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

An implementation of the changes proposed in this series has been
published as an RFC to the LKML, to be used as a reference:

https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/

v2:
 - Remove the VIRTIO_F_SHM_PAGE_SIZE feature bit, exposing page_shift
   in the transports unconditionally (thanks Parav Pandit).
 - Didn't pick up R-b due to the significant change between revisions.

Sergio Lopez (3):
  shared-mem: introduce page alignment restrictions
  transport-pci: introduce page_shift field for SHM
  transport-mmio: introduce SHMPageShift register

 shared-mem.tex     |  6 ++++++
 transport-mmio.tex |  8 ++++++++
 transport-pci.tex  | 10 +++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.49.0

