Return-Path: <virtio-comment-return-9166-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD33C54E49
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Mar 2024 15:57:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D60AF3F4B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Mar 2024 15:57:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1EAE986674
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Mar 2024 15:57:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D697D986669; Fri,  1 Mar 2024 15:57:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2D2C98666A
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Mar 2024 15:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kWyeZFhmONSnFcu9w-TGpw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709308640; x=1709913440;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUzACCTlLGoNXoEBHhwmpUKcQMDKMj1ALAeEtGZDXys=;
        b=Z+dH7GZXon/gZZK4Lx8+RjZCpCSsN8A5Fc7TCOm3ThOfe3tVOFMLEiTbc2bBJ80mig
         JepfP82pwlxlE/zt43uD0Kq4QPQwbWUKssPVGnM7C4rngMT79Uam6ySu5vIURXfjaBos
         yhcENSfT1IkLwNvsSqzIt+LzPkiXn8FfqkKd3M2acp41YpEuJny1vGiGAjAUbLRF3Xln
         vzlrNocNj/waGMg3HzSEYMIlmhpCaj58jhmv5Zktd2GXtFM4fkwaXvIwmsadOCmV4QIm
         ShdQXEJt9ArfmYgT3nNUTI/vN7osrTo7RRcON3CpMd+8sJVh9kzVmVs9jUeJxaDJLwO0
         udxg==
X-Gm-Message-State: AOJu0Yy4YMSbMXt9/EOyqUbX7RQ5+vTSWk7aps+LAh2ysojbm3Wg3B4w
	QcKad+2W5QRn5TrfXEXiSTY/Alao0hBq53XiXl/XFg9E6a1dSkUJp0U8vQuKPa/hbcUmhIj0C/9
	phnhl3uBKQj70K91TXiJUs90ZOwTYdRAzflD7L8UVg7MRMi77I0SOT0ZacjRCwbVNM/j2vFBdQp
	WCWsT9bAwwmOCaQOkL1gPaSTHJXC/xPHKw607mcOzWQ25qmjNwOIRb/qA=
X-Received: by 2002:a25:7443:0:b0:dc6:db0c:4ff0 with SMTP id p64-20020a257443000000b00dc6db0c4ff0mr1914944ybc.32.1709308640599;
        Fri, 01 Mar 2024 07:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4LDDuS9F0gXa7ZKOTINlcSZ6h4fKAJDxTqKFPTM760uVECl19sbqXiVwTYbpPyB56fn54Dg==
X-Received: by 2002:a25:7443:0:b0:dc6:db0c:4ff0 with SMTP id p64-20020a257443000000b00dc6db0c4ff0mr1914928ybc.32.1709308640233;
        Fri, 01 Mar 2024 07:57:20 -0800 (PST)
Date: Fri, 1 Mar 2024 16:57:16 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com
Message-ID: <ZeH63CbUsw78ZGkD@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v1] virtio-can: define out of rage can-id

This commit explains when a message is out of range.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v0 -> v1:
    *  "can-id" => "\field{can_id}"

* This patch applies on top of virtio-1.4, which has not been released
  yet.
---
 device-types/can/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..98b163b 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
 NOT schedule the message for transmission.
 
+Note that a message is out of range when a standard frame uses more than 11
+bits of \field{can_id} or when an extended frame uses more than 29 bits.
+
 If the parameters are valid the message is scheduled for transmission.
 
 If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.41.0


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

