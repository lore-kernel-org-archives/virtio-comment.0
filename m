Return-Path: <virtio-comment-return-5331-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7EFC76196
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:40:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2E8F23D70
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:40:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E668B98636D
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:40:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DDD9A9862A5; Mon, 10 Apr 2023 06:40:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC70F986319
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 06:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: R9B2qN0XN4WhGMJfZuFMJA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681108796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik+K7A8ZeoFVyvZHa5hPdNmVX/txp+CzssG24WtYK4Q=;
        b=OyDDcABVvA9zp1el4w1XG2UoTvknuwGw61bVRsRDfnlnX0l7ejt+vFkc45T4ycDgSF
         qs7nbqrAAjh1e8FVi6FMHpl+NtNPjmWOFXYrCBxpIUw1xhLlBc2KxoyWqLoVwuQFxGhx
         oPFKrXozOy6CexqMpgkAzVCx0mC6orXoh+oTuN8BnGf8xNpm5ynPXCr08WY4GqGdnaTj
         yVEmErsY2EEGjB9v85WsbXVxPL7lv41PL8EWnbG/xXnxwRR+qjPAPQK25P5yiZDahX2Z
         ghgUVi/JUG3x0gjzchyUx5bMCrvsnCkZAOQti21e62OLMYyxgG3IUyAOEfsi1uQFk8h5
         d+yw==
X-Gm-Message-State: AAQBX9eYTKA/R5xLMEGNCCNk9FWyxF4w/vqMwE3f26R4KMF9mdpyls2d
	ZBdtYF/pNE1QalYwnVmsvo8WBMcO+E6G+ggqG3mZ4kf0QGAj8/noICdXHgbOOHEJavc5wkYt0nB
	p08VoQaWmBwOs3x1fcB03Z7T76yMIHriS7Q==
X-Received: by 2002:adf:f909:0:b0:2d2:f3e3:115d with SMTP id b9-20020adff909000000b002d2f3e3115dmr6769581wrr.59.1681108796757;
        Sun, 09 Apr 2023 23:39:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YdYJWupf8UeJ1GsVtPu9FBERPwuXrlWOi24LmR2B1Nk3a/sNKHhY5eSqG/Hz2BvHEybuB2gQ==
X-Received: by 2002:adf:f909:0:b0:2d2:f3e3:115d with SMTP id b9-20020adff909000000b002d2f3e3115dmr6769569wrr.59.1681108796482;
        Sun, 09 Apr 2023 23:39:56 -0700 (PDT)
Date: Mon, 10 Apr 2023 02:39:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230410023715-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org>
 <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Mon, Apr 10, 2023 at 02:20:16PM +0800, Jason Wang wrote:
> On Mon, Apr 10, 2023 at 2:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > > This is fine for vDPA but not for virtio if the design can only work
> > > for some specific setups (OSes/archs).
> > >
> > > Thanks
> >
> > Well virtio legacy has a long history of documenting existing hacks :)
> 
> Exactly, so the legacy behaviour is not (or can't be) defined by the
> spec but the codes.

I mean driver behaviour derives from the code but we do document it in
the spec to help people build devices.


> > But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> > And we have to decide what to do about ACCESS_PLATFORM since
> > there's a security problem if device allows not acking it.
> > Two options:
> > - relax the rules a bit and say device will assume ACCESS_PLATFORM
> >   is acked anyway
> 
> This will break legacy drivers which assume physical addresses.

not that they are not already broken.

> > - a new flag that is insecure (so useful for sec but useless for dpdk) but optional
> 
> This looks like a new "hack" for the legacy hacks.

it's not just for legacy.

> And what about ORDER_PLATFORM, I don't think we can modify legacy drivers...
> 
> Thanks

You play some tricks with shadow VQ I guess.

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

