Return-Path: <virtio-comment-return-5330-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB8C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:24:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F2FD3309F
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:24:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7892A9865ED
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:24:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 704F29862A5; Mon, 10 Apr 2023 06:24:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60EEA9863C9
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 06:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: c0RnoKJWMfud2HDZmgPfWQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681107881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SyrjmAdl5eX1xK1e5c4mE02FdLQujtoDgxmvm2oHCU=;
        b=f7gEU9qcWgoJbBcuXatmFQPM1PWb7ZOVDu/m9QvrjHP2rrEcqh+3cUulXkjOzyWxpw
         TJ0jjznAtLFiY1RHhXgnkLWA6mi9+mZnTrKuUp8P1gZLhfqAgA0ZcbITgDGfDD3EKYcW
         P8IdBJqvH4NknyxzMSwbSEU21eM5we6x6wL4usWTA/roDFrb1JxNmnjCJAMLx7olqed2
         yMx1qjGWBEfxWCSQeNVwFyPJtVm7HjbfdN7y05/LvD8kYf2QwjJKUpW/MviPJC+1o2CZ
         xuv+cXgDY8PloPQN/dj2j5YBfrSucBPr5SmYWmkoAvHjsa2PX2F2UjSYPnEkHiaf/XW/
         +3NA==
X-Gm-Message-State: AAQBX9eEx+r1Ch+IGurdEM1SjHxuqNA4cXh4/x8+WPYde96MlotHhmLk
	teB3wvEd+FO1GaYsmqlJeCR8075mPW5j3hmNcxWNMep9eUjL0esPYLgnShDjp13LYw397AYUqEM
	UQNK2gFIdA3REKtAHUTvl2saevl+bDNmqeQ==
X-Received: by 2002:a7b:c843:0:b0:3f0:7b28:e393 with SMTP id c3-20020a7bc843000000b003f07b28e393mr5699026wml.9.1681107881494;
        Sun, 09 Apr 2023 23:24:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350YE8+f9NFy9EMHc+sI5u0xsirWpDIfiicfnidL5VFKdmln2+ttkaSXBOATSO9ukPwkw+FGm1w==
X-Received: by 2002:a7b:c843:0:b0:3f0:7b28:e393 with SMTP id c3-20020a7bc843000000b003f07b28e393mr5699018wml.9.1681107881213;
        Sun, 09 Apr 2023 23:24:41 -0700 (PDT)
Date: Mon, 10 Apr 2023 02:24:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230410021619-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Mon, Apr 10, 2023 at 09:36:17AM +0800, Jason Wang wrote:
> On Fri, Mar 31, 2023 at 7:00 AM Parav Pandit <parav@nvidia.com> wrote:
> >
> > PCI device configuration space for capabilities is limited to only 192
> > bytes shared by many PCI capabilities of generic PCI device and virtio
> > specific.
> >
> > Hence, introduce virtio extended capability that uses PCI Express
> > extended capability.
> > Subsequent patch uses this virtio extended capability.
> >
> > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> Can you explain the differences compared to what I've used to propose?
> 
> https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg08078.html
> 
> This can save time for everybody.
> 
> Thanks

BTW another advantage of extended capabilities is - these are actually
cheaper to access from a VM than classic config space.


Several points
- I don't like it that yours is 32 bit. We do not need 2 variants just
  make it all 64 bit
- We need to document that if driver does not scan extended capbilities it will not find them.
  And existing drivers do not scan them. So what is safe
  to put there? vendor specific? extra access types?
  Can we make scanning these mandatory in future drivers? future devices?
  I guess we can add a feature bit to flag that.
  Is accessing these possible from bios?

So I like this one better as a basis - care reviewing it and adding
stuff?

-- 
MST


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

