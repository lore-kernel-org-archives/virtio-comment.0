Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3518E373
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700220; cv=none; b=jot/EA9Zx15fVjrbLkWztiSRc+5rHlFjmnWlbLt6scfBTauwbTEz6DUTAgZ7KmWoCM7PcNi78xF/eE69LCero8HOpz9zOSdRHiQ+4FP3FkDZz6NDx49xqycLGDlHndiCt3Xo19IEk3ShrFS3kmeLZyHhMkx9ZOF5ESo8oWL2EZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700220; c=relaxed/simple;
	bh=/VtGrgXXChYIVPzdzTSVvT7r4A2eWBlVnPoHZ/jzHQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=QaFzrcAUJks4g43T36lh+UgPg1J6NT8Si/mOHab5zdvPZh3JVADFFrCgeixhi+0bUj8Fc6Rv4Wji0NNPZCtAocZu4xZ40KelocMmXofYiAuNtWx0ICh3/skLclg1UpwdTZeUUQM2PqQ6DigrUnqFGfS6ZplcWizvEidtvFvuUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXjfeNhZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXjfeNhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732700217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=871PxFBjkR6A6qOP2bYZzDynxnagR+R2ZoITa8mYZ70=;
	b=bXjfeNhZ8qq6JLFnpRFFT3o3332E+7ugbd9Ho+JXHi0YlM3HfKZWQ9BLgWFg4fTU3KX+Er
	1RGDDSgblZxZGrEt7bk0G5IOy30agfjopdR5SGIFfRThn4/ICXDU/7GPnAJ1KkFzE77Rce
	i19tlFIGWMdbW857EQScDR3R9g5ZT24=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-PnWx3Sp_PBGrRmHT8_me2Q-1; Wed,
 27 Nov 2024 04:36:56 -0500
X-MC-Unique: PnWx3Sp_PBGrRmHT8_me2Q-1
X-Mimecast-MFC-AGG-ID: PnWx3Sp_PBGrRmHT8_me2Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CB42195FE16;
	Wed, 27 Nov 2024 09:36:55 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.194.173])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BA8F195E480;
	Wed, 27 Nov 2024 09:36:52 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v11 0/4] virtio-net: define UDP tunnel offload
Date: Wed, 27 Nov 2024 10:36:39 +0100
Message-ID: <cover.1732699986.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wUd8KeeQcWxXUDm-NxN1O8FP-okr2RgHdrdmVQNQMe0_1732700215
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

UDP tunnel usage is ubiquitous in container deployment, and the ability
to offload UDP encapsulated GSO traffic impacts greatly the performances
and the CPU utilization of such use cases.

This series includes:
- clarifications on the current semantic of NEEDS_CSUM offload
(patch 1) and DATA_VALID offload (patch 2) to make later changes easier
to follow,
- new features definition to handle both UDP tunnel segmentation
offload (patch 3).
- new features definition to handle UDP tunnel outer checksum offload
(patch 4).

A PoC implementation is available here:

https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9

Note that both implementations has not been updated since the previous
iteration, since there are no additional functional changes in v11.

Changes from v10:
- added patch 2
- clarified only a single encapsulation level is supported (patch 3)
- s/TCP or UDP GSO packets/GSO packets/ (patch 3)
- 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
  checksum' (patch 4)
https://lore.kernel.org/virtio-comment/cover.1731084277.git.pabeni@redhat.com/

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
---
Paolo Abeni (4):
  virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
  virtio-net: clarify DATA_VALID  semantic for encap protos.
  virtio-net: define UDP tunnel segmentation offload feature
  virtio-net: define UDP tunnel checksum offload feature

 device-types/net/description.tex | 355 ++++++++++++++++++++++++++++++-
 1 file changed, 345 insertions(+), 10 deletions(-)

-- 
2.45.2

