Return-Path: <virtio-comment-return-7238-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAB6C83F2C
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 06:05:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5852512F605
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 06:05:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A0B19863E0
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 06:05:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 324EB983E4F; Mon,  4 Sep 2023 06:05:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 478939863B7
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Sep 2023 06:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693807455; x=1694412255;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjpYEb8bOEYrsHzFWL3fGRHE9ArwnujMmKckx9lbKV0=;
        b=eU7w9I8NJkOToOfuHl4M+RvsnI6y69c0oytJhGLSp3CHR/mNhZ+8XLXVzAnU2P8m7H
         A9QMy8s7YHYdNFB81uQ+SBJUjJ7aH8yEGXgfzh7i5pM5pAwXXb5HXGf0jhEeO6gmq7GJ
         o/dOpgtutFyi0zhQJfmsH54VvuE1utEr6g415IcnVnIwKQyDzsqIYnbfDcI/WRj2ElXx
         d+thNmclhnFga0Lak7cQOxnB+J3ovnYA1+bQ3s6Fi6cWOlY2X+2e0Xu3WFas83JuI5ge
         lhvxBAqBOVSuZZgNsjJbHSMc0KFVq+3x+iWUWAwdWJ/yg3SGWcencmUTCfrosyHzrj6X
         gwWw==
X-Gm-Message-State: AOJu0YzRQj0F5qwjrT8d960IKu3NqBDHHYm7z3faoLfROOtSc/8JNlyy
	bRasezA5KodxeduPZ6R+w9Dn4glNFXp1N0iPLTcqOV8oRd9eH2Xo
X-Google-Smtp-Source: AGHT+IEJzLVeCo0MHZrGuZAu0TFt6q+PZlsnHAFtAudtXWDfSCbhFbQVN2CSOcC9nixVHSYc+EK62U5btreX5qVbbkg=
X-Received: by 2002:a05:6402:180f:b0:523:bfec:4913 with SMTP id
 g15-20020a056402180f00b00523bfec4913mr6055367edy.0.1693807455078; Sun, 03 Sep
 2023 23:04:15 -0700 (PDT)
MIME-Version: 1.0
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 4 Sep 2023 09:03:59 +0300
Message-ID: <CAAjaMXaJb+BgKj2_Ou0ghzu-HogMSdqLH=8RJrfFrTKj2dmoqg@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Subject: [virtio-comment] Expired certificate on https://docs.oasis-open.org/

oasis-open.org has a valid certificate, but docs.* does not.

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

