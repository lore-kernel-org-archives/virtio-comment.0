Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169342045B7
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514574; cv=none; b=ZDfF6eS7VdpYseJv+gBu6HuJhDg+8Pb5/lyL3lvFfhl7yLDR1mssQ+Z5Gg9HVbxpm7k6T5lw+bsPo28OzSkJnhckByc112H2BIytwhAqVYGIsU5YqNuUguAQiUGibeU9W5popQ8THby84QsOFqkzVtNIsI5cSLVwD884evYHxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514574; c=relaxed/simple;
	bh=yFhONE6v4pW5lOukPINV0cY87dGiBLOhY4oo5guPsnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=dxMmFmDhjt1nTnKaLSWwIbV5tWna5q5mQLbwK4kIRQK9Np4p8c5BSNjA+G3N0/3lkyeQsBpvhvpaIB4fRgL0G57cp9n49ljp0fpOBnX0xCWeezhw6m2/USHZhoxFMBop/9peK7BgvyV0ivID6E0P2gcUZX0FG1JQwGJsQUbqUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eit96o14; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eit96o14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wd1WkZuEFX10/s+rEYxVQln3cF6zAYAdMc5SvQtp1H0=;
	b=eit96o143Rl9hgYlEf6P9V/UTLOMUmNY0Q4Nzz6LiK52WS0ez9TlRD7TGTD9w5YdrAimfZ
	AAGPi4C3tNviNzfJjkrr0oqdnCcoXvDC03mS4xtvlquIj76PRdOMZHRc/yKLKoM9x0eg07
	auaokxARCvkArZdwhRhX4gWBdvUW9hM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-5YeVKf3MP2OlzIROxLgFvQ-1; Tue, 01 Apr 2025 09:36:09 -0400
X-MC-Unique: 5YeVKf3MP2OlzIROxLgFvQ-1
X-Mimecast-MFC-AGG-ID: 5YeVKf3MP2OlzIROxLgFvQ_1743514568
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39141ffa913so2643058f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514567; x=1744119367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd1WkZuEFX10/s+rEYxVQln3cF6zAYAdMc5SvQtp1H0=;
        b=Y1rWPLWyV20LBmW9kKM0ITS6dQrPUxoqIRRc7Mle7fudC/5pKAokQzCcgvm+HLMfEq
         SXgGn8m9L9KEO/7Z6A/uPzuVOsZKVh3vWQSsmZfjG/4IQo9AReijcTynV+dl00bAPFc9
         NnExYXSSVLVvlLD9cAh5ufFu+umVUIVDKAGOy9F9R3i7I7KnVQPesEYs+7K+IaF7aNbt
         C8d08F68tE9QRgcqEBRxsSqgSNTXJ/To0utTHAljyjNBhfiQUu+WKsO7LA4vkjZzSm/Z
         5YvY21/Xz00LPH+j92mUveA8tbKJHtz9IyTWmkOTfv1hdh1JEKQNYDjnI5JIhudnwMv1
         +tfA==
X-Gm-Message-State: AOJu0YwGDazmiPIJvH8SxV6Meduv36ovwo4zTYDL40S98gTLc35udyh4
	3GymIp8uHsbhOP6iLaJdO3LEmM8bOOwDsQxNExp0S1fm0qc3AJBp1yEu4/xhIN8WKGag9FRnl67
	gilm/lPT5iMxjr/Q+Eh9oPaoNqK5YiNRVzW3VQPsSzk2icPWPIv80s811IQ7N1deoh7Dk9WKPkn
	GFpIBdzEm81OLwSwr97nQNVgPJqLOPxF5aVPtljYuvBUPoDaBG
X-Gm-Gg: ASbGncs0jy8SJOnq+4S6eq1REs1tONcmdNuRvAbfqRIALtYbP5cAHv+Akr89dA795zr
	yTY/GKWC/+0R+MLEncuJmCbAj7YrU0KZ6FPbNSmON+0AKSjpy4RaUSgu4Id1xGSjZBFjueBSk5+
	A2lZW+U3nfh8j6Hr2kLEWXKkax9CLD2Mr1yH1MS+v5kc4E5LroLzMb5QZhsJOm7Gp7svU3whWYg
	iXFukQ3kVP+AHXosw0cN1EH11YpfcEj4ZmnZTzcwjV916Jz4gmh7DCEenq4r7NlxggYmrM7YliD
	H9rXK8/5kRDZYS8rt7I=
X-Received: by 2002:a5d:5848:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39c1211d5bbmr9290468f8f.54.1743514567594;
        Tue, 01 Apr 2025 06:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErpGBIaBIti9qlJDwjDdX6xq9T5kGEzawcEyC/ywlYWMpjoA1KXDlxo5QKzBYpheT4XNoApw==
X-Received: by 2002:a5d:5848:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39c1211d5bbmr9290433f8f.54.1743514567140;
        Tue, 01 Apr 2025 06:36:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6656a0sm14237503f8f.37.2025.04.01.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:06 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Paolo Abeni <pabeni@redhat.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	Jason Wang <jasowang@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 11/13] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
Date: Tue,  1 Apr 2025 15:35:11 +0200
Message-ID: <20250401133543.801184-12-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 7pxorw_Q_G69Kf0EsJKN2tDJFKZCEdDxKrFilaAumjw_1743514568
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Paolo Abeni <pabeni@redhat.com>

The current wording is a bit unclear hinting to possible additional
nested headers. For GSO packets virtio net (currently) supports
offload for the checksum of single transport header, explicitly state
that in both the driver and device sections.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Link: https://lore.kernel.org/r/81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com
(cherry picked from commit 8e443f483843c3d42a4128778f1c7548a02c48bf)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 86cdb63..9ea713d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -567,6 +567,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -767,7 +772,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
2.42.0

