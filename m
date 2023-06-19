Return-Path: <virtio-comment-return-6376-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2264EEB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 12:01:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4D6A714E68D
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 12:01:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30D839863A9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 12:01:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 196C9986396; Mon, 19 Jun 2023 12:01:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04708986397
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 12:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687176102; x=1689768102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHe+hgfMQKZb874Qrnipz++13//AJqJK2rEyaqsMNB4=;
        b=PF3+/oGPIIWpTCKOca/xLMc24pQYrSqaJwBTf6MTdaEugU4QaTlztR2fZwvErbyHPi
         +ciHCzBudR/ZanSmJhrc9doABIOQRO19GekAN6tOTyq/MhyXLowg5XDNsm1gNugkZn0C
         HKkD+NlmAUip/MTKJxTrbeC7xmrl4aMQqwJQwSTdo6rwzwJDO8kn3PS+pFuw95++IFaF
         lXhZjXe+RK+siCxMl+NCs0d0RmsM6GR5V1sZ7IZnQN7OOJaIAJjPMJbF5ctI1rClkOul
         fXswVgd3WodIvxd9Uu72/Nq5rVEH00BHKgEQZR1lII1cfYKjGuNcNXqAkpxNhKBeGLP8
         VVmA==
X-Gm-Message-State: AC+VfDyTaY0GHUJk//dmVpLogwfmNBBTsIafRDA2F9y4DYCacBP8xZao
	/0tljLvXyFoYalunDY5cmnQOFQ==
X-Google-Smtp-Source: ACHHUZ63lIOkGKSt3qvmSflJempdnS760FFshn0WEv/474maho6ZVopLlobI3tX6Vf3bfJJ/gz7CgA==
X-Received: by 2002:a5d:4eca:0:b0:311:1b0b:2ee0 with SMTP id s10-20020a5d4eca000000b003111b0b2ee0mr6214685wrv.53.1687176102413;
        Mon, 19 Jun 2023 05:01:42 -0700 (PDT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Harald Mommer <hmo@opensynergy.com>,
	Will Deacon <will@kernel.org>
Date: Mon, 19 Jun 2023 13:01:28 +0100
Message-Id: <20230619120128.234244-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [RFC PATCH] virtio-rpmb: fix spec land mine in max_[wr|rd]_cnt

Even if 0 meant no limit we are still limited by the field size of the
request. That said for a maximum sized partition (* 80 128 1024) you
could only actually request 40960 blocks before running out of device.
Perhaps it would be better to mark 0 as invalid?

Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Harald Mommer <hmo@opensynergy.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 device-types/rpmb/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/rpmb/description.tex b/device-types/rpmb/description.tex
index 1dae3fd..2ce8a5b 100644
--- a/device-types/rpmb/description.tex
+++ b/device-types/rpmb/description.tex
@@ -37,7 +37,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / RPMB Device /
    The values MUST range between 0x00 and 0x80 inclusive.
 \item[\field{max_wr_cnt and max_rd_cnt}] are the maximum numbers of RPMB
    block count (256B) that can be performed to device in one request. 0 implies
-   no limitation.
+   no limitation other than the maximum value you can store in \field{block_count} (65535).
 \end{description}
 
 \devicenormative{\subsection}{Device Initialization}{Device Types / RPMB Device / Device Initialization}
-- 
2.39.2


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

