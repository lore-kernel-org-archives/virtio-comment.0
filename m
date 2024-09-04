Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA101DEFCC
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465015; cv=none; b=a61T4xt6ukSV9EcVuDiDEBGj3Kv/dNad5E3LnC+ohMZUzelJYrxpGCtpMSqmMxkawVvZWZPGUHwZERwhLJJ0H7UUsGiy0/UK/rEfDWGv2R9rPyeby9HstjGhrNCMP63fU7ebVdx3JR6hmxqvGd36c7XkaC32Cxl8yVX2QuH/ESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465015; c=relaxed/simple;
	bh=63fifeQcgqCQhM7ev2LteCZhPPUQ59fg/n+ZlaDeKZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALqDdCpwKNoEuG04QWAlNMYoirhQ1n5/SWL7Wql2GAD5Lv89/Ydk5WYxOcplAvI7KZn3v7NEsuu3CduHezncx8BYXguCdW+WmIW6nCM9QUjzHvJCEhctRcy8f0wQDCL6iOsx/M9e246h70psuZE67kHZinXG6ensQsfTgTDvQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RB2rdcVw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RB2rdcVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725465012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ol00iGh0fPa7HTYBxbuRGP+/FAkNV7X278TgtwPE1LY=;
	b=RB2rdcVwz8cctsbaFnt2oo/6/akgVreeU3MlHes3SB6bb9/k5qXPoWw6qZtn2e5S8S51kX
	eVlSEfdCpTntstNG0koO07MrLxthI1chwBSJ5pCrsSH3DlDt0aQ1PgDJmk3dbq5Wu3Tv5a
	BXyzj8FDLpPPMUSlYmFdANfKKs2m038=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-Aucol7CuNQG5-w85QnlXZQ-1; Wed,
 04 Sep 2024 11:50:08 -0400
X-MC-Unique: Aucol7CuNQG5-w85QnlXZQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AF531953963;
	Wed,  4 Sep 2024 15:50:07 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E86019560AA;
	Wed,  4 Sep 2024 15:50:03 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
Date: Wed,  4 Sep 2024 17:49:55 +0200
Message-ID: <cover.1725463935.git.pabeni@redhat.com>
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

Paolo Abeni (2):
  virtio-net: define UDP tunnel segmentation offload feature
  virtio-net: define UDP tunnel checksum offload feature

 device-types/net/description.tex | 262 +++++++++++++++++++++++++++++--
 1 file changed, 252 insertions(+), 10 deletions(-)

-- 
2.45.2

