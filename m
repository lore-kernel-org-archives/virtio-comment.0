Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C9183CA5
	for <virtio-comment@lists.linux.dev>; Fri,  8 Nov 2024 16:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731084786; cv=none; b=KiK2M24rHPylU/SPJXV2vdj8foaNu8MFnQsiZwGWpfesmXzXdtPcmYkVzxClBbDXRP3QL86SgNX6gJBwtPzE7TtOGk4KS1pF611WUBIQTmpgkQTcbgn0roL2rREFKp4FxrXzEfH6fN0pEwl81KWSc9j4CCb4rRhYBNbe9+MNUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731084786; c=relaxed/simple;
	bh=M5FKx6Fk0vIMeZKAICzsRI9Smr6H0maw9KV0ezwBMKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=njWSM2yWSvCb27a2TnQmcM6SX51iOlb1U8Kw26NS7Gxtiv0xNJEuHtVft2gLMLuibqLArIpbZQNqm5e+WOp57uFwKo1jeR/O4IxZtH4kKKhfoTOenKDdxbDKFwz/Z8ji0P1u2r8ffI5CyVPVM3UHWcLvaIwQtLktgXiiBe+C838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=edlfR0nM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="edlfR0nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731084783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+q/tdrT6Jg7R6nqshxrRk/U3ykwu1wBx65/6Jb3/Btc=;
	b=edlfR0nMRDdKrUWff0zk0YWdTPkL00OkVH8kBrGDkA5O+c5g3Uv2qs2a03momCPCYuJ1QG
	asFZHXFhdmzfDFvqObgE3Z8Bi+dI3U7Ig4S0PwkyYKB3CQb9YkCEWuOWUxIZPVSBjLcq6J
	1QdZV7SvY+wtPQxMPUGy+iwYuU+/nbM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-Lvd7QDULP52G_nkuOYHw_A-1; Fri,
 08 Nov 2024 11:53:02 -0500
X-MC-Unique: Lvd7QDULP52G_nkuOYHw_A-1
X-Mimecast-MFC-AGG-ID: Lvd7QDULP52G_nkuOYHw_A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A808C1955BFA;
	Fri,  8 Nov 2024 16:53:01 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.193.90])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 139BC195E480;
	Fri,  8 Nov 2024 16:52:58 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v10 0/3] virtio-net: define UDP tunnel offload
Date: Fri,  8 Nov 2024 17:52:43 +0100
Message-ID: <cover.1731084277.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZJ9-eAv7UEbZlMxqoBCSJaAbf_H9ijWxVUBN5Eva0IY_1731084781
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

UDP tunnel usage is ubiquitous in container deployment, and the ability
to offload UDP encapsulated GSO traffic impacts greatly the performances
and the CPU utilization of such use cases.

This series includes:
- a clarification on the current semantic of
NEEDS_CSUM offload (patch 1) to make later changes easier to follow,
- new features definition to handle both UDP tunnel segmentation
offload (patch 2).
- new features definition to handleUDP tunnel outer checksum offload
(patch 2).

A PoC implementation is available here:

https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9

Note that the user-space implementation has not been updated since
the previous iteration, since the kernel changes are transparent to it.

Changes from v9:
- added patch 1
- clarified that 'hdr_len' accounts for the inner header for GSO over
UDP tunnel packets
- DATA_VALID is not be allowed for GSO over UDP tunnel packets.
https://lore.kernel.org/virtio-comment/cover.1728029499.git.pabeni@redhat.com/

Changes from v8:
- rebased on top of virtio-1.4, changed udp-tunnel features number
  to avoid conflicts/duplications
- Clarified the usage of DATA_VALID flag with UDP tunneled GSO packets
- mandate strict hdr validation on the rx side, too - for UDP tunneled
  GSO packets only
https://lore.kernel.org/virtio-comment/cover.1725463935.git.pabeni@redhat.com/

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

Paolo Abeni (3):
  virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
  virtio-net: define UDP tunnel segmentation offload feature
  virtio-net: define UDP tunnel checksum offload feature

 device-types/net/description.tex | 350 ++++++++++++++++++++++++++++++-
 1 file changed, 340 insertions(+), 10 deletions(-)

-- 
2.45.2

