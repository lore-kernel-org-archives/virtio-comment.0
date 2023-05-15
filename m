Return-Path: <virtio-comment-return-5899-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB6C7EE22
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 14:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7184711B669
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 14:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A95798650E
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 14:50:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A9E19864EE; Mon, 15 May 2023 14:50:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 282C4986509
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 14:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684162233; x=1686754233;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It4PSYIr00QhJVeVO8m3xAyfm1t5Hle5i90PhtsVA20=;
        b=YbzN0K5PA3hZW+2/vZW4lD95btks/xZ2Gd/7mVaUxJPjWEswmzt/bk8ViEqJ0yAxQe
         x8bhOWqaZdq3R6yzp+0ex2nB7yeEpQz7rxWpAf0BTjPCsK+5NJc1xnsbgllb6OKtkm+x
         EDGqWWi9/N94xmanMr0+QTc1EIYMSsg0SPiZrMEbn6BA4xhmjezu9DcQxuIVe4TvHlmG
         uUHUsdTIGifDny4yHUp5iFgglmcRmgvKCqMgacYx+Mf4lT91JhZVfyWwfIsHlq2gAAn6
         cEt3r9YgSJdkZsEttPPDSRZYvvwrqHSpBhFertCoKR53h13V0KmRLstCsswygYHRfnG6
         Vu2w==
X-Gm-Message-State: AC+VfDySfwWLV5Z4/Sy1fNefkxr6OC1N1k6+IWa/WT/dBvLfo9MaoTfl
	jn31f05rzaAIe4y5OYmEFcBB0hOosrypqfMLPAaDBwCNc7mgtuN5w1Nh7g==
X-Google-Smtp-Source: ACHHUZ51/obNK91hhHsG0oH3R5nYrAp7H8oecEKC5r6rr5qcD21K4gmj8IOG+GQO1mspK02fOt8dGd7ID+BSSHjRBYs=
X-Received: by 2002:a05:6000:12d0:b0:304:b1da:77d with SMTP id
 l16-20020a05600012d000b00304b1da077dmr23180402wrx.52.1684162233086; Mon, 15
 May 2023 07:50:33 -0700 (PDT)
MIME-Version: 1.0
From: "T.J. Alumbaugh" <talumbau@google.com>
Date: Mon, 15 May 2023 08:49:57 -0600
Message-ID: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Subject: [virtio-comment] trouble sending patch with git send-email

Hi,

I'm having an issue trying to send a proposed spec change for
discussion to this list. I'm following the instructions here:

https://github.com/oasis-tcs/virtio-spec#providing-feedback

which seem to be pretty standard and the typical workflow for sending
git patches. However, my messages bounce with this error:

<virtio-comment@lists.oasis-open.org>: permission denied. Command output:
    Traceback (most recent call last):   File
    "/home/oasis/bin/kmlm_crosspost_issubn", line 14, in <module>     import
    MySQLdb ImportError: No module named MySQLdb Sorry, only subscribers may
    post. If you are a subscriber, please forward this message to
    virtio-comment-owner@lists.oasis-open.org to get your new address included
    (#5.7.2) ERROR: postqmail-local Error #77


I have confirmed that I am a subscriber to this list. This email
itself will serve as an experiment to determine if the message is
legitimate (the system believes I am not a subscriber), or if this
error is spurious and there is some other issue with sending a patch
with `git send-email`. In the event that this email does get through,
any advice on how to proceed would be much appreciated! Thanks,

-T.J.

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

