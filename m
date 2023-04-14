Return-Path: <virtio-comment-return-5470-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A2C77B6E
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:10:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 756A32B133
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:10:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62CE0983C98
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 03:10:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59E93983FEA; Fri, 14 Apr 2023 03:10:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A196986601
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 03:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: R7W1utAIOqOk0PXiQHlVlA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681441847; x=1684033847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjIc+yYcRdvPg+S9yntsMOTkcZYT6LggtTsx0uzt+No=;
        b=PzD8MvZUK717AHN/EjdufujT4WjlL1VGmd+XSvv67hyS7+ZW00AbJflo2+ZnlNncju
         VYh8LXnxCX34inoRcrYvZwM7wEcHeO9hF8wparourJNhgI1D0X2fP3BaC/UKnaB5P18R
         tCRJPUSoiv14XN6emcDpQ4bD4+c3V2005p0mDi87YEkByezxlC3pVFFZGWGhu0qWlVga
         RftD6InxSZFD0KzkFttR2THwepkHpV5UNeuMTDsi/YlDYych7YYulF5h0cAPxl97Kqcv
         fnNKKicLADbDbp9NacQ/0d420ixbC/hiGZPsglnqS6ZQsETsWQQAzZhtZMaWzPWp3biA
         KIsg==
X-Gm-Message-State: AAQBX9ccQoLY46y3fqmwherWel39JhlDb5Wf5cHp0p2O3mjrwi5t4jBO
	TeBdA8tq/NWI/Ob4+xUjneO1oaZ58w6JO507CTowYByFd+qORjt0RxfXCxlaYh/MYW3BP3tZ28+
	r90cDY0K5qi9ZKtsLYxIbIK3Np9TZtMd7EMwUMb1R3zIWOu/dBg==
X-Received: by 2002:a05:6870:910a:b0:184:cb2c:e81c with SMTP id o10-20020a056870910a00b00184cb2ce81cmr2277942oae.9.1681441847496;
        Thu, 13 Apr 2023 20:10:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZvwKQriiIBxNVLJEhWBv0TLdh1nz+wjWNlysD3b8UW3Fvbsbe50y2yZe8ZH1QA4Ltjp9fyFxZAWSoCn2lrcic=
X-Received: by 2002:a05:6870:910a:b0:184:cb2c:e81c with SMTP id
 o10-20020a056870910a00b00184cb2ce81cmr2277939oae.9.1681441847312; Thu, 13 Apr
 2023 20:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230403045833.21853-1-hengqi@linux.alibaba.com>
 <1d30d4a0-6bfc-3d58-17a4-645602d3792f@redhat.com> <a95ca379-0675-9b33-f649-bd2a19b56190@linux.alibaba.com>
 <20230413174525-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230413174525-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 14 Apr 2023 11:10:36 +0800
Message-ID: <CACGkMEttCB7J4bd8HoB4z7zQrhZArBHCECWcuuHy2eJVoV7tew@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-dev@lists.oasis-open.org, 
	virtio-comment@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v12] virtio-net: support inner header hash

On Fri, Apr 14, 2023 at 5:46=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Apr 13, 2023 at 07:03:26PM +0800, Heng Qi wrote:
> > > >   For example, when the packets of certain
> > > > +tunnels are spread across multiple receive queues, these receive
> > > > queues may have an unbalanced
> > > > +amount of packets. This can cause a specific receive queue to
> > > > become full, resulting in packet loss.
> > >
> > >
> > > We have many places that can lead to packet dropping. For example, th=
e
> > > automatic steering is best effort. I tend to avoid mentioning things
> > > like this.
> >
> > Ok. And Michael what do you think about this?
>
>
> I think this text did not do a great job explaining the
> security aspect. Here's a better, shorter explanation:
>
>         It is often an expectation of users that a tunnel isolates the ex=
ternal
>         network from the internal one. By completely ignoring entropy in =
the
>         external header and replacing it with entropy from the internal h=
eader,
>         for hash calculations, this expectation might be violated to a ce=
rtain
>         extent, depending on how the hash is used. When the hash use is l=
imited
>         to RSS queue selection, the effect will likely be limited to abil=
ity of
>         users inside the tunnel to cause packet drops in multiple queues =
(as
>         opposed to a single queue without the feature).

And this is only for GRE-in-UDP? This makes me think if we should add
GRE support for the outer header like:

https://docs.napatech.com/r/Feature-Set-N-ANL9/Hash-Key-Type-10-3-Tuple-GRE=
v0

Thanks


>
> > >
> > >
> > > > +
> > > > +Possible mitigations:
> > > > +\begin{itemize}
> > > > +\item Use a tool with good forwarding performance to keep the
> > > > receive queue from filling up.
> > > > +\item If the QoS is unavailable, the driver can set
> > > > \field{hash_tunnel_types} to VIRTIO_NET_HASH_TUNNEL_TYPE_NONE
> > > > +      to disable inner header hash for encapsulated packets.
> > > > +\item Choose a hash key that can avoid queue collisions.
> > > > +\item Perform appropriate QoS before packets consume the receive
> > > > buffers of the receive queues.
> > > > +\end{itemize}
> > > > +
> > > > +The limitations mentioned above exist with/without the inner heade=
r
> > > > hash.
> > >
> > >
> > > This conflicts with the tile "Tunnel QoS limitation" which readers ma=
y
> > > think it happens only for tunnel.
> >
> > Perhaps a "QoS Advices" is better?
>
> Plural of "advice" is "advice" not "advices".
>
> This advice is somewhat bogus though.
>
> The point I keep trying to make is that this:
>
>         Choose a hash key that can avoid queue collisions.
>
> is impossible with the feature and possible without.
> This was the whole reason I asked for a security
> considerations sections.
>
> --
> MST
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

