Return-Path: <virtio-comment-return-9001-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A856C47DDB
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 17:32:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3D384330B8
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 17:32:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3053A9867BF
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 17:32:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22D139866E0; Tue, 23 Jan 2024 17:32:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 112A29866D7
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Jan 2024 17:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031134; x=1706635934;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vf4kYw2zodMz/klA48TVXihaCTfY5itoR/q3XhkHKYA=;
        b=vkTzLaKafYQrNETV8Esx/gtPynJB11fs6SO4DSZlgPrts34G6UsE4H1lCEgnoc6Aek
         JhWcEU8/t/+JXoML85bQn88BMkTGHsXLqAsIcyu3TW1vatVmAeXHcSnZLAybvroHSi3K
         eVYJQj0vXypf2YTJ7c9ZNuI3Kqg4ts0s8dYZcu/wvG2V3PUcvKCK2Z2z/r43nA/dCRou
         1XAefJLgrRc3Ox+C1XBwTXr5ZuyoF/Nc6XVrYMS66KYQPX4CaHp4dyB2agjGsQl3gDqx
         ee0mlH1KVIX0zvvVpq2sR53uReAdEjVC1D7flv1SAHWdxXqIi45FbP3Q/vFqTb/AQRWd
         VPoQ==
X-Gm-Message-State: AOJu0YxDBT0Z0ejXoLDr0C2xvevCC/aeLBtLvYl7HgiC1j3wlfbjTk9u
	JSMikA2ZkQCg54EzflPZ0D+xAhzJ4teBgieDpB4h6OGn0vWQu0iVTDCNE4LOK5f0OVDVVW1QBMb
	7pGOC0dSf2VnGz37vzXt++XW9jWpE5U/kztty
X-Google-Smtp-Source: AGHT+IFlIxFOxHiR+68eAWK4oDq5Dt5P3t1LyqNbbeyyCPbia6pfaF315DXsTxJJ/QHesVHEm6L9b3fRboW+sGGnSn8=
X-Received: by 2002:a17:907:2d88:b0:a2f:7c68:e043 with SMTP id
 gt8-20020a1709072d8800b00a2f7c68e043mr141377ejc.6.1706031134101; Tue, 23 Jan
 2024 09:32:14 -0800 (PST)
MIME-Version: 1.0
From: Shujun Xue <shujunxue@google.com>
Date: Tue, 23 Jan 2024 09:32:01 -0800
Message-ID: <CAB6OiKgcWwH_qprNv6Z=F4=Hc2PckoCqQEJCGgkgNVL9Xx4k5A@mail.gmail.com>
To: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Shujun Xue <shujunxue@google.com>, Slava Malyugin <slavamn@google.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [virtio-comment] [PATCH] Define the DEVICE ID of Virtio Cpu balloon device as 47.

The Virtio CPU balloon device is a primitive device for managing guest
CPU capacity: the device asks for certain CPU cores to be online,
offline or throttled, and the driver performs the requested operation.
This allows the guest to adapt to changes in allowance of underlying
CPU capacity.

Signed-off-by: Shujun Xue <shujunxue@google.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..87f0238 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+47         &   CPU balloon device \\
+\hline
 \end{tabular}

 Some of the devices above are unspecified by this document,
-- 
2.43.0.429.g432eaa2c6b-goog

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

