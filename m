Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A73183CA5
	for <virtio-comment@lists.linux.dev>; Fri,  8 Nov 2024 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731084789; cv=none; b=ZS/oewVmCcE15lZW8RRx4ZsSzOUrbpZkEY2yoKRbKjXVIgvtg5nizZcHyLPfPUgttNHmCUz4lYmrZTOSOCfW3OhYgX/ASJmSCbGM2hcUPK/ekqDk2vdBynCKvaHFZX2sLVC0fOUW71eNGP++lQEfkkKvu7+k9qOf7uISYm5IyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731084789; c=relaxed/simple;
	bh=xuC5lUux20F5fMJg6NVufHDU85/ildZj57gw4Ij1iSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxT1EKQJpNVaKJyeEPPPXukNVqejOVeMWH5kC8+Hra/ytaEJFk7+1BqRiVyzbztylbdfbaDPo+ww9irUWfD+FYLnIKF1HAhU4uW7Phc5HOrPIME7qnimRUWXt073Nwjl353gxvIFrk0kmcBWAfXukwfp58z540VXxdqdimUyiRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cI6YWfS4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cI6YWfS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731084786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxm7LwQaM1D3HzWWYgwIkgqvR7P91W1lxs9D+4BHuBU=;
	b=cI6YWfS4CtJWS1EaGJEl9cveS9RwZ4fcAbvYbklyYqfMA08az5czvYEBFMBg2s4mrJ+KCa
	/3dpJJr5vwObPu0LxjsPehSHncuAY8UO2Me2YFekR1PTuFTCEy18ez/1h4tdITA3Qz2htZ
	RIDG6LKA7g3lpZLLCs0JbYac2zIJ7sc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-PBdy-cFFP9-zh4cmBLXDTw-1; Fri,
 08 Nov 2024 11:53:05 -0500
X-MC-Unique: PBdy-cFFP9-zh4cmBLXDTw-1
X-Mimecast-MFC-AGG-ID: PBdy-cFFP9-zh4cmBLXDTw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C56E1955F45;
	Fri,  8 Nov 2024 16:53:04 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.193.90])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 29C83195E481;
	Fri,  8 Nov 2024 16:53:01 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v10 1/3] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
Date: Fri,  8 Nov 2024 17:52:44 +0100
Message-ID: <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
In-Reply-To: <cover.1731084277.git.pabeni@redhat.com>
References: <cover.1731084277.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gX9HFgfeLT0lMJ7JdPVYWawhUxFpTNLj97LbL9iCgXs_1731084784
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The current wording is a bit unclear hinting to possible additional
nested headers. For GSO packets virtio net (currently) supports
offload for the checksum of single transport header, explicitly state
that in both the driver and device sections.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 device-types/net/description.tex | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b2a0d39..3099c6f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -605,6 +605,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item the driver MUST validate the packet checksum at
 	offset \field{csum_offset} from \field{csum_start} as well as all
 	preceding offsets;
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \item the driver MUST set the packet checksum stored in the
 	buffer to the TCP/UDP pseudo header;
 \item the driver MUST set \field{csum_start} and
@@ -805,7 +810,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
   then \field{csum_start} and \field{csum_offset} indicate how to calculate it
   (see Packet Transmission point 1).
-
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \end{enumerate}
 
 If applicable, the device calculates per-packet hash for incoming packets as
-- 
2.45.2

