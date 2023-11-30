Return-Path: <virtio-comment-return-8691-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B1FC4167B
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 09:02:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DEB86217B1
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 09:02:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFD95986679
	for <virtio-comment@archiver.kernel.org>; Thu, 30 Nov 2023 09:02:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C20F098666F; Thu, 30 Nov 2023 09:02:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4971986671
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Nov 2023 09:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QJ7YTeTKM4muHuSMx5lzGg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701334948; x=1701939748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO+r+nfsIsQKg2F2+UO+QagaKw0vAHQp4N2Q4+RnbsI=;
        b=NzR/fBYQTflsCs9FOBM4Nqa/vnAztUDGrP6buFsLyZ1qqOCbe5YxUpP5S5/0zjI42X
         GsLk0+myQ0jkxZzaIjlJgSf31nKgIyCw28M0maTqXziuxcr244tI405yJCqSkru0GzxA
         EAw4nw0tyQQXhhhfSGfYK7tbsSnn8b6PAMVcEq2x7pyRQmyB3iVCIeYdIxcm1mSfY9/W
         cFDkYlG+yJuvhvBrVx11JwrHIhCCIPxGfBvdklDhtaXN6CkaHgbxaGLXqsaNXoraJ8vf
         /z9ssRw8k55e3bR6LySa+zOXpkMD6bfOuXKbs6OhJngAdmxYc30unS4XtHOnfu4MwLud
         /fLg==
X-Gm-Message-State: AOJu0YxcLSnREBQ6uorPfiaMJqXYZ32AEqdEfxdoRExGdqkk5Ba/Wg5M
	K9t7Hq43Nm+HpCO2ZEYMuYhEuO2tP/i8ZZgyGzuNHXrOycOGuBmcItP1FtfeMAhQMLwEMNIMx9c
	6ohKNwZP0/yVpPCyfetMaGUEP6KDniTij217nB0XyBg==
X-Received: by 2002:a05:622a:13d1:b0:423:7843:2b4a with SMTP id p17-20020a05622a13d100b0042378432b4amr22081490qtk.50.1701334947872;
        Thu, 30 Nov 2023 01:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES6CtoXKGLAgSiSaT7z6JKCIkY4Kn3frvfA5N9a9YxzXLmcaZyldKkRP5nHzzdGSASGJdLIA==
X-Received: by 2002:a05:622a:13d1:b0:423:7843:2b4a with SMTP id p17-20020a05622a13d100b0042378432b4amr22081469qtk.50.1701334947618;
        Thu, 30 Nov 2023 01:02:27 -0800 (PST)
Date: Thu, 30 Nov 2023 04:02:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Message-ID: <20231130040108-mutt-send-email-mst@kernel.org>
References: <20231113061950.122683-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20231113061950.122683-1-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v2 0/1] Define low power mode for devices

On Mon, Nov 13, 2023 at 03:19:49PM +0900, David Stevens wrote:
> The virtio spec currently does not include the concept of device power
> management. The lack means that there is no good action drivers can take
> when they are requested to put the device into a low power state (e.g.
> when a guest is entering a system-wide low power state like S0ix/S3).
> Stateless devices can be handled - albeit inefficiently - by resetting
> and reinitialzing the device. However, stateful devices cannot support
> this situation. This patch defines a low power mode for devices that can
> be used in this situation.
> 
> Low power mode is mostly defined at the transport layer, and all
> device-side power optimizations are optional. This avoids the need for
> invasive device-by-device definitions. It also pushes the requirement
> onto the device side, to simplify what driver side changes are
> necessary to just [1].

Great idea.
This couldn't have come at a better time, too.
Please do remember to CC reviewers directly in the future, though.


> I believe this patch may address the virtio-gpu issue which [2] is
> trying to address by avoiding the reset altogether when the guest enters
> S3.
> 
> [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chromium.org/
> [2] https://lore.kernel.org/lkml/20230919114242.2283646-1-Jiqian.Chen@amd.com/
> 
> v1 -> v2:
>  - Define virtio-pci support on top of PCI power management.
>  - Add more conformance requirements.
> 
> David Stevens (1):
>   Define a low power mode for devices
> 
>  content.tex       | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex |  7 +++++++
>  2 files changed, 52 insertions(+)
> 
> -- 
> 2.42.0.869.gea05f2083d-goog
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 


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

