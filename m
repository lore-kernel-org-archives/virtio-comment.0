Return-Path: <virtio-comment-return-8286-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC93C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:02:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44C0C3E586
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:02:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E8CE986CC5
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 08:02:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F3C51986CC3; Thu,  9 Nov 2023 08:02:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E012C986CC4
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 08:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nmYe6E2mMcyW6_I72UStiw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699516917; x=1700121717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBHUT39/D4lwAosyqI8dvwtzTtoxMcyx2eUfdENusI8=;
        b=L5GuAGnE4InNSh5gaH/KVX2bBwhZ8JXtvL3WsXgKI51lM5wH6HzgchgKXNOyNtWRKZ
         xz1jp8kkSxq0679bBNcfFvdRJrm3jt5HbRJ8KTgpaxoLTyP3zZGehN+hIif3Wy4znl8F
         I7WgdSOiD2/THPh+CagQOq2ju2JcvzHgadWZWM8TZcjYtuJdU92Dr03d51M26BqEMO7s
         KtfOmDFrEtnfIDQ8y5vWE9o1AcGvDUYutJzsK4kh5oFpSHplu6EKVJvyfBj1GrFZv2T+
         Gv5HVAOMPkIqk5N5Vs1tGmOId74tjh3bd84DyZEHUn81gq2kZkOEyr4lrKEKzUBbUUBC
         2GXA==
X-Gm-Message-State: AOJu0YzlBx/rjBAnEvQAcwxR63Il6m924E6LiMuaBq7ZxrE4x+fv2LDY
	N/3D+IrYH4OdL/y3E7ONd8UMAJ/uZo1OfGUO5yCsD8o0t4Apz9f76n21BIx84P8MQdOJ0tkXnYE
	D7UBJLelGpjBo6A2X3DLIuyZgT0GaIwFmX/wkxNcpLA==
X-Received: by 2002:a50:9f4c:0:b0:543:c4a5:d4e3 with SMTP id b70-20020a509f4c000000b00543c4a5d4e3mr3279312edf.10.1699516917558;
        Thu, 09 Nov 2023 00:01:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFZNuhpmYj1gbJB3WpYH/0UeFUQU4On662uQEsHuRhSO8QZIm+3MFNdCmVixV9L1RrxLinfg==
X-Received: by 2002:a50:9f4c:0:b0:543:c4a5:d4e3 with SMTP id b70-20020a509f4c000000b00543c4a5d4e3mr3279292edf.10.1699516917258;
        Thu, 09 Nov 2023 00:01:57 -0800 (PST)
Date: Thu, 9 Nov 2023 03:01:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231109030057-mutt-send-email-mst@kernel.org>
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org>
 <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
 <20231101013634-mutt-send-email-mst@kernel.org>
 <CACGkMEucwwx2p1Y-3DN3yBAA6_Mu6pdmKxpCj8pDbD6YxjvFPg@mail.gmail.com>
 <20231102024425-mutt-send-email-mst@kernel.org>
 <CACGkMEvXBjHUmHAjBvn8UE47Ca26vx0+J22=nAygB96nakXPcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvXBjHUmHAjBvn8UE47Ca26vx0+J22=nAygB96nakXPcw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Thu, Nov 09, 2023 at 11:55:01AM +0800, Jason Wang wrote:
> > > Most userspace doesn't care about the checksum though.
> > >
> > > > Maybe we need a flag
> > > > to say which offloads are expensive?
> > > >
> > >
> > > That exposes some device details which seem not good (e.g we may want
> > > to do migration among hardware and software).
> > >
> > > Thanks
> >
> > If you do then things will be less well tuned on one of the migration
> > ends but then that is by design, isn't it?
> 
> Ok, so I'm fine to enable it by default.
> 
> Thanks

I was really asking a question. Is it true that full is more expensive
than partial for the device? So it should only be enabled if
strictly required?

> >
> > --
> > MST
> >


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

