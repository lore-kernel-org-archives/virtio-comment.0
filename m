Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E92040BD
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514570; cv=none; b=ou2HqrW1i3gCzQ4H2zW3/iVbK1ijDxJ+MgDvSSHJCv5YoIUGM5noxMmOSzXKTxRrGllQW/6/f9me968Cpj+bIH9y/wPC/ZigWlTYW9O1bzgYJ94HuhypPKvfH17SICsKJ6g47uLKyaJ6GNvkcryaaLcUtCX6MvAKsGw8CMaw4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514570; c=relaxed/simple;
	bh=XcRbMfo+HzN/L2DO70Is16gBdh3csp5XTiOTC/gdVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aDEOAFsvv9S8vzhxrNyYgPdnWq0qf6J0TVPt1LflyX9OvyQY0yGlJgfpubCzvjWHb9w7UVi25OKAarDZVEe22DgfwIZx3oJ/+ZeLjGnUywBH89LIinG73IZCuuAquwXDJJQnwKqyDxFS4vKmt6hZHO45Oc5ntrF+uLyRXmIa9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrZQrLUR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrZQrLUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0BxYq10F0uiyTJ26gaFH8Bi0xbSit4uC+uiwW8z+zA=;
	b=FrZQrLURFX7W1SB9Sp27Ef0jaLj09ydH0DnDoUb5gF7Uwh7XMDcEH8H2O7A2mu5+XWzRse
	JgbMpYY89D24ZaGOqItkb51tGWzWKS4sDKvbni321p7WA4e4kkm3LCXrpburyy+/RO03/+
	S3UFAvW40qExWt0kFqRKcTzqd/uea+8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-djxZNHEvPJ6fzWNJOxap4Q-1; Tue, 01 Apr 2025 09:36:06 -0400
X-MC-Unique: djxZNHEvPJ6fzWNJOxap4Q-1
X-Mimecast-MFC-AGG-ID: djxZNHEvPJ6fzWNJOxap4Q_1743514566
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391315098b2so2427098f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514565; x=1744119365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0BxYq10F0uiyTJ26gaFH8Bi0xbSit4uC+uiwW8z+zA=;
        b=Y57YLi+NRXV1W48mSFvzO8ZRx0hGcya++BCzg7wKrdQDr0oairRel9VhjqEhdWdXT4
         tJPAHmqljDx42+TPCAq/dDiyF54X4+sPll1SNhYcb4st/PXOtvVLVdJK7xQcaa/+FoLb
         1eVsimJUHRLuqP+gNsu4+OS204+k9AJFGKO0nU3XJagTPO7QM2K/rV4xI0QamcufiB+A
         N11001l76IHbzZjbPrdXvJdFtU4XCR059Wur+Pd80qdNcTRg/I++rtkn2rwW19rt2/Gd
         s5kR6ohFBtIgtW1xds8JTryFgSw6f17g87GPwxXhROkNQ4BP+7zdRLGPQXqNUK9khGmd
         zCIw==
X-Gm-Message-State: AOJu0YzlZpJmi9QUrq5VMlFriyu63O9xee68TMusw3RqF+fGXstjC30g
	ACAPLx76DcXTvvlGMYRVx7zZWJpGoEMI65+ryJN6O2vihBsZjQrzGDhVBMzBHu/I2JGA/azzIqE
	YPHMDmNkBn08+ddq1lEFbGSbTxmxFGXre8GqNEqzbyMpXmlY/fSIKiAD6SvZPGBjymDQ0DRbgow
	mx4HLWGmddBaSWHgTVRYRGg/9Yef7dhpuv6S8hrtJP6zl7v6k0
X-Gm-Gg: ASbGnctNMyqjBcFe47Ddt8FoZKN5tZC9A/TrWuouV86FcGhpQIlkg6lRmhwhJjieA+c
	egepp5yeLZ8xY0uAj2hoFL3GctwrKD30zUbvDx3UiOcQtNVE+CJp5sr6hDcFE0e3WgIbVnmO1X8
	Y8np/M7isZvQbYOYneQuJrSsriHCHGCBmGD81Ln2JchB/QWZ5/Q9hnGTHwNNRa5xhgAd/yt3jH0
	QYMOqqF7n//v+kzM+8tf5CjUKr/eVg/9q1a7Yu+DzQ1+fYli6LWTqO/xAGoQ69R3Jk/VI4ij08G
	Z4Upbm5C7BYDipKHAsQ=
X-Received: by 2002:a5d:47a7:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39c120cb814mr10771989f8f.5.1743514565077;
        Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5P/1rd1fB6XdAIcgwSZdRVLeg+DjXmv4dIZq9mcyZVmuS9xBexKp+1rGQkdkcK8X4ivNMsw==
X-Received: by 2002:a5d:47a7:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39c120cb814mr10771960f8f.5.1743514564696;
        Tue, 01 Apr 2025 06:36:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41c0sm13901865f8f.88.2025.04.01.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:04 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 08/13] virtio-net: Annotate virtio_net_hdr as field
Date: Tue,  1 Apr 2025 15:35:08 +0200
Message-ID: <20250401133543.801184-9-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250401133543.801184-1-mvaralar@redhat.com>
References: <20250401133543.801184-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MOAUN19TF56Tia7s9Ur46b2R8iVFeNy9Efw2zPYK5cw_1743514566
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

At several places struct virtio_net_hdr missed out the field
annotation. Add it.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20240606102014.2103986-4-parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 6abd42fd2398718ff689dc51fa93d38ede97be8f)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 7f9ed38..86cdb63 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -431,11 +431,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 
 \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Network Device / Device Operation / Legacy Interface: Device Operation}
 When using the legacy interface, transitional devices and drivers
-MUST format the fields in struct virtio_net_hdr
+MUST format the fields in \field{struct virtio_net_hdr}
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
 
-The legacy driver only presented \field{num_buffers} in the struct virtio_net_hdr
+The legacy driver only presented \field{num_buffers} in the \field{struct virtio_net_hdr}
 when VIRTIO_NET_F_MRG_RXBUF was negotiated; without that feature the
 structure was 2 bytes shorter.
 
@@ -729,7 +729,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   chains them together to form a single packet in a way similar to
   how it would store it in a single buffer spread over multiple
   descriptors.
-  The other buffers will not begin with a struct virtio_net_hdr.
+  The other buffers will not begin with a \field{struct virtio_net_hdr}.
 
 \item If
   \field{num_buffers} is one, then the entire packet will be
@@ -1825,7 +1825,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 
 When using legacy interfaces, transitional drivers which have not
 negotiated VIRTIO_F_ANY_LAYOUT MUST use a single descriptor for the
-struct virtio_net_hdr on both transmit and receive, with the
+\field{struct virtio_net_hdr} on both transmit and receive, with the
 network data in the following descriptors.
 
 Additionally, when using the control virtqueue (see \ref{sec:Device
-- 
2.42.0

