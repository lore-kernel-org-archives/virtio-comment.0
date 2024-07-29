Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546DA266A7
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252633; cv=none; b=FELprpola3YOsNI6RnjV4dyra0FK2jUS4y0hdV1hLWM6QQ/BTLMihdoq14wajbmZ+m59PDy9vnvI05FWz0zES7CgXp9azFJDtYcqEj7aH/ZcmbKKuOhez2qqc5c+NXc0rFbGwfigCkYzE3ySoE8ysZtGfbhPqic/v8V/nKc7k+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252633; c=relaxed/simple;
	bh=VDOya5MkNdTFLQCYV3y2ADDJMmv8Edxkh28NBOt/zcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hz+DbvlgFHApcO07sfR3GWCxpBLcbLAb8aOE78GGZhdXJgVoVRBOUe4d5o8JRzweWQcYh8+xPR1kxYFHxKExg2XiCdvo9xoWZs6SctP4z97RiYs6/Wo2SnGBA+FI0mvx04TB0dnLPtaU1+/UYop/bS30RS9z1VCpuwUJqHHl5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXp5gR08; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXp5gR08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722252630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f4Ni86lfs52QHBqJwIuWq7xNxjPpHr8yH9y5y6aBphY=;
	b=eXp5gR08UIQiXB3VRbPeZ8eeF7495AHCkcDMzQ3V4gDwnG9T1w0SGvXuCop+VFsNCckpjl
	4UKtpa2nBruO5v6vPCfq/b6UjZpA72mGkk1uxXMzAxBshW7o92NQqSc13hVxDm51dDL12I
	xwnr+v9Lwowwbk1EJ5J10VC8Xaw/s2g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-inPM48_qPNyt3qj2UedfXg-1; Mon,
 29 Jul 2024 07:30:29 -0400
X-MC-Unique: inPM48_qPNyt3qj2UedfXg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 886D01955D5A;
	Mon, 29 Jul 2024 11:30:27 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.225.153])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 153EA1955D42;
	Mon, 29 Jul 2024 11:30:24 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v6 0/2] virtio-net: define UDP tunnel offload
Date: Mon, 29 Jul 2024 13:30:06 +0200
Message-ID: <cover.1722252302.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

UDP tunnel usage is ubiquitous in container deployment, and the ability
to offload UDP encapsulated GSO traffic impacts greatly the performances
and the CPU utilization of such use cases.

This series introduces separate features to handle both UDP tunnel 
segmentation offload (patch 1) and UDP tunnel outer checksum offload
(patch 2)

Changes from v5:
- split in 2 patches
- dropped outer_mh_offset field
- many csum related clarification

Paolo Abeni (2):
  virtio-net: define UDP tunnel segmentation offload feature
  virtio-net: define UDP tunnel checksum offload feature

 device-types/net/description.tex | 227 +++++++++++++++++++++++++++++--
 1 file changed, 218 insertions(+), 9 deletions(-)

-- 
2.45.2

