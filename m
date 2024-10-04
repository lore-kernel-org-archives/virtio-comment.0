Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52D13C8F3
	for <virtio-comment@lists.linux.dev>; Fri,  4 Oct 2024 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728029629; cv=none; b=ZVbC2bKFzxoHLp4emYOclH+4m3g+Fm7zHF/kXRACzLxGHi5j+7+kCQMY1JtIw0pt6k4kxgY/A0ohF7kc9vJ5+RBB3HmPDhENkflyLfjnUVHYyUFqASacOuB1hkd8e7xxftZamZlP1iMX+uB8+kGytYAHXX9SvCeQ3vstbFaslm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728029629; c=relaxed/simple;
	bh=JGX5fG3iSXELzpIOB7U1jtCBt9xsrswrjqJkM53W09Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p99LSbWYepzjogtSZV6qi2L/ey2MGo847djd29FyRvsqE31w+3/Kcmvkga3dLLzZb93WTK65GajFK5cui0bQl9GY33ZzHRL/S8jYqxowWbSofk78h3uRMRunvo99p0+hcmqGby+pCsCOvrxfev4vn0EzL4DKv2pq1tC6TM0rWNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MPRckoGa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MPRckoGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728029626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aosGRUgOfl31cNU3CGDESZsXKyQ1+HCNjiNhdXsBOOI=;
	b=MPRckoGaTdPjt1tqZx7TQdC1Xfpx9UkXBtyqaZzyM3XZgPpcRW52ilNP0GQ1apkxIrZY2w
	RKIxpcbeFrQre91N+JodiCTkZ2rvwE9WPTWltEBI1p6d8eCHVdExYQJcOjWY5WuDTOH3f0
	zinfaP+/OdeFEf8nyPHfj4+HTqg0zVk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-LKHB0DdJPomGrptX3UZA7g-1; Fri,
 04 Oct 2024 04:13:43 -0400
X-MC-Unique: LKHB0DdJPomGrptX3UZA7g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5E2E195608C;
	Fri,  4 Oct 2024 08:13:41 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.200])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D15CA19560AE;
	Fri,  4 Oct 2024 08:13:38 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v9 0/2] virtio-net: define UDP tunnel offload
Date: Fri,  4 Oct 2024 10:13:23 +0200
Message-ID: <cover.1728029499.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

UDP tunnel usage is ubiquitous in container deployment, and the ability
to offload UDP encapsulated GSO traffic impacts greatly the performances
and the CPU utilization of such use cases.

This series introduces separate features to handle both UDP tunnel 
segmentation offload (patch 1) and UDP tunnel outer checksum offload
(patch 2).

This revision is hopefully a minor delta over the previous iteration,
covering a few problems spotted thanks to the PoC implementation
available here:

https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso/
https://github.com/pabeni/qemu/commits/virtio_tunnel/

Changes from v8:
- rebased on top of virtio-1.4, changed udp-tunnel features number
  to avoid conflicts/duplications
- Clarified the usage of DATA_VALID flag with UDP tunneled GSO packets
- mandate strict hdr validation on the rx side, too - for UDP tunneled
  GSO packets only

Changes from v7:
- minor cleanup in patch 1/2
- dropped confusing wording about csum validation in patch 2/2

Changes from v6:
- replaced inner_protocol_type with
  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6}
- many clarifications and cleanup, see the individual patches changelog
  for the details

Changes from v5:
- split in 2 patches
- dropped outer_mh_offset field
- many csum related clarification
---
Note that such while the mentioned PoC is based on the previous
iteration of this change, it already deals with all the delta introduced
here except the refined DATA_VALID handling. I'll try to update the PoC
WRT that ASAP.

Paolo Abeni (2):
  virtio-net: define UDP tunnel segmentation offload feature
  virtio-net: define UDP tunnel checksum offload feature

 device-types/net/description.tex | 325 ++++++++++++++++++++++++++++++-
 1 file changed, 315 insertions(+), 10 deletions(-)

-- 
2.45.2

