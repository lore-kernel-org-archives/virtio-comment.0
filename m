Return-Path: <virtio-comment-return-9160-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA943C54E49
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:15:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 002302CAF0
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:15:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF26E986637
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:15:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 956B998645C; Wed, 28 Feb 2024 16:15:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 887FE986478
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Feb 2024 16:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NqBRsANRP9KSiEfSdRs1Kg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136950; x=1709741750;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW656CYaS5xZKXjpoQZ2ztyEcRLLjCaEghweq1I00Ts=;
        b=K6yic+mJxnupj4ELOqjk5cxzzKZO0zUOB0yx97QbMvJGuUusqIdNPGqMGXmx9mzngo
         Eu2RpplPsdrw0v5nLcpX4lfWaoRoDuAauOKnuqS6FSfXui9PYMRJM7Xz9GmDr6B+Bo2d
         LZW3JQakdTmJhGPbQvbFmmZmjmSpxIDFKr1Unr5v8wRYYJaR7jx+bR8PH43ugcXUtjzV
         1aQjYfxvU8iWpW01eY8z7Mn3OlbZ9gEgvQRs+mvlOMjKNuoDKbPAND8QschSZlBVXcDZ
         CRWaALLSkEBLFfZ8A8okuaIff4xtizMTSN9avAHioTwCoPWXweKSyYUJD2Hw+ictsqqm
         mzqA==
X-Gm-Message-State: AOJu0YzmLxJS055x5hPt/ZXwhXujF5r9HfmjL4Vl/VrO6jdcX13/ptkK
	Qg8p5a7f6BbRRGEUk+1SGY7uvWi5DCdC1aBq1U4GYAxz25r7wxFGBXDuJd1somHLuURD4swi8No
	t2M1D8sXXn4APuBU4geQZxG5dP+1C8PL7o9Xx2n8jYmw/tU8Ig/yJewW4yfwProLDEAjqukABHR
	tufEGYgTad4IKUO0nmK2gPc18OFkQ3RAynQvqShZu4tzqlysYCUytQtzU=
X-Received: by 2002:ac8:5f4d:0:b0:42e:97f4:594a with SMTP id y13-20020ac85f4d000000b0042e97f4594amr5862730qta.3.1709136949742;
        Wed, 28 Feb 2024 08:15:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpneQMpURTEaDdsiFswDoCQf6aveUzTghR/Fatu8KlCUJEl2aMPOKzAMgjAhlHKQF5ylS+4A==
X-Received: by 2002:ac8:5f4d:0:b0:42e:97f4:594a with SMTP id y13-20020ac85f4d000000b0042e97f4594amr5862703qta.3.1709136949339;
        Wed, 28 Feb 2024 08:15:49 -0800 (PST)
Date: Wed, 28 Feb 2024 17:15:46 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: mvaralar@redhat.com, harald.mommer@opensynergy.com
Message-ID: <Zd9cMvuPQ8VxKOXY@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] virtio-can: define out of rage can-id

This commit explains when a message is out of range.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
* This patch applies on top of virtio-1.4, which has not been released
  yet.
---
 device-types/can/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..0a5cf02 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
 NOT schedule the message for transmission.
 
+Note that a message is out of range when a standard frame uses more than 11
+bits of can-id or when an extended frame uses more than 29 bits.
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

