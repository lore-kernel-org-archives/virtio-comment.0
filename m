Return-Path: <virtio-comment-return-8106-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCDBC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:40:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 757B82ACFF
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:40:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 533C2986BEE
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:40:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B357986BE5; Thu,  2 Nov 2023 04:40:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B2BD986BE6
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 04:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QJ7Y8_UnOeafE4QJ_X88EQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698900015; x=1699504815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjREIGHtZrT7S1BlSGWJ/pBdbLecQLjdgjaSD6HAX9U=;
        b=DB8Cqouxjswlh2hCiQDONQa8zo+fmrIA4I5cToViskJ3P7AWR26A0xiJaU2Zz6xZ9Z
         IpvhIloqr0jCjohfjYpzC+ptNtQk5ZjzAcsPZulKtxC7qQO0KKV7XRZ5omVKJo//CdeL
         VX92WAf+IdYZ2XWSpxDhj779vwNgEnX4+42N5tLAeGlITfZTM7WAy+ntEht0JZBeFn1Z
         DydlZn5127DQeHZICvOJ/iShDzWsI2XngtUKiG+iKEZnYFFSRWFpFHTXcA2yyN1KM0QP
         4BT8Vk3RJIkpu4NDMCEYP1dvoZGllPrUS5qRphQxsnKBJid1BFnBgsrV3vKI4ZMY45W1
         aV/g==
X-Gm-Message-State: AOJu0YzyUm1wMCCjr7VW6W/nFNoQXQFNH+lNAD+1bg8zMhFOZRsTTKdH
	5PiMSYRoiT5PJMAMJ7tJ2oSBojE1SIdFqUAK16K4K4sjbnMjws2aI7D88TODYQDGLxGkX6frz/9
	fIvei4dvdUH/7Xs7J+lctHmp1PgnA3VE+1Hfi2s4W/TVN+NhTag==
X-Received: by 2002:a05:690c:18:b0:59f:72a6:da0e with SMTP id bc24-20020a05690c001800b0059f72a6da0emr21204833ywb.41.1698900015521;
        Wed, 01 Nov 2023 21:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxds9q9b8N/5MWVNmTqs1MX2DmaH6rJZenJDOX0ccxeJLyqqWQL7BFWpPfB7jes5IsQvCkfL/uLMDcHmA3KeA=
X-Received: by 2002:a05:690c:18:b0:59f:72a6:da0e with SMTP id
 bc24-20020a05690c001800b0059f72a6da0emr21204824ywb.41.1698900015159; Wed, 01
 Nov 2023 21:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org> <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com> <20231101013634-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231101013634-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Nov 2023 12:40:03 +0800
Message-ID: <CACGkMEucwwx2p1Y-3DN3yBAA6_Mu6pdmKxpCj8pDbD6YxjvFPg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org, 
	Parav Pandit <parav@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Wed, Nov 1, 2023 at 1:37=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Nov 01, 2023 at 12:16:23PM +0800, Jason Wang wrote:
> > On Sat, Oct 28, 2023 at 10:36=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> > >
> > >
> > >
> > > =E5=9C=A8 2023/10/27 =E4=B8=8B=E5=8D=883:39, Michael S. Tsirkin =E5=
=86=99=E9=81=93:
> > > > On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> > > >> virtio-net works in a virtualized system and is somewhat different=
 from
> > > >> physical nics. One of the differences is that to save virtio devic=
e
> > > >> resources, rx may receive packets with partial checksum. However, =
XDP may
> > > >> cause partially checksummed packets to be dropped. So XDP loading =
conflicts
> > > >> with the feature VIRTIO_NET_F_GUEST_CSUM.
> > > >>
> > > >> This patch lets the device to supply fully checksummed packets to =
the driver.
> > > >> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the ben=
efits of
> > > >> device verification checksum.
> > > >>
> > > >> In addition, implementation of some performant devices do not gene=
rate
> > > >> partially checksummed packets, but the standard driver still need =
to clear
> > > >> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable =
the
> > > >> full checksum offloading, then the driver can load XDP without cle=
aring
> > > >> VIRTIO_NET_F_GUEST_CSUM.
> > > >>
> > > >> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve t=
he above
> > > >> situation, which provides the driver with configurable receive ful=
l checksum
> > > >> offload. If the offload is enabled, then the device must supply fu=
lly
> > > >> checksummed packets to the driver.
> > > >>
> > > >> Use case example:
> > > >> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full che=
cksum
> > > >> offload is enabled, after XDP processes a packet with full checksu=
m, the
> > > >> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in th=
e stack
> > > >> not needing to validate the checksum again. This is useful for gue=
sts:
> > > >>    1. Bring the driver advantages such as cpu savings.
> > > >>    2. For devices that do not generate partially checksummed packe=
ts themselves,
> > > >>       XDP can be loaded in the driver without modifying the hardwa=
re behavior.
> > > >>
> > > >> Several solutions have been discussed in the previous proposal[1].
> > > >> After historical discussion, we have tried the method proposed by =
Jason[2],
> > > >> but some complex scenarios and challenges are difficult to deal wi=
th.
> > > >> We now return to the method suggested in [1].
> > > >>
> > > >> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg002=
91.html
> > > >> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux=
.alibaba.com/
> > > >>
> > > >> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > >> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > >> ---
> > > >> v1->v2:
> > > >>      1. Modify full checksum functionality as a configurable offlo=
ad
> > > >>         that is initially turned off. @Jason
> > > >>
> > > >>   device-types/net/description.tex | 54 ++++++++++++++++++++++++++=
++----
> > > >>   1 file changed, 48 insertions(+), 6 deletions(-)
> > > >>
> > > >> diff --git a/device-types/net/description.tex b/device-types/net/d=
escription.tex
> > > >> index 76585b0..3c34f27 100644
> > > >> --- a/device-types/net/description.tex
> > > >> +++ b/device-types/net/description.tex
> > > >> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits
> > > >>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through co=
ntrol
> > > >>       channel.
> > > >>
> > > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets w=
ith full checksum.
> > > >> +
> > > >>   \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header=
 hash for encapsulated packets.
> > > >>
> > > >>   \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue n=
otification coalescing.
> > > >> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label=
{sec:Device Types / Network Device
> > > >>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > >>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > >>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> > > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_C=
SUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > > >>
> > > >>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> > > >>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> > > > What about all of these:
> > > >
> > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4] Req=
uires VIRTIO_NET_F_GUEST_CSUM.
> > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6] Req=
uires VIRTIO_NET_F_GUEST_CSUM.
> > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] Requ=
ires VIRTIO_NET_F_GUEST_CSUM.
> > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4] Req=
uires VIRTIO_NET_F_GUEST_CSUM.
> > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6] Req=
uires VIRTIO_NET_F_GUEST_CSUM.
> > > >
> > > >
> > > >
> > > > can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as opposed t=
o VIRTIO_NET_F_GUEST_CSUM?
> > >
> > > Both GUEST_FULL_CSUM and GUEST_CSUM can work with GUEST_TSO/USO/UFO.
> >
> > Yes. For software devices I guess it will have a lot of performance
> > penalty. So it should be disabled by default anyhow. The idea is to
> > delay the csum as late as possible.
>
> But for hardware it's actually better.

I can't think of a case where it might be better than XDP.

Most userspace doesn't care about the checksum though.

> Maybe we need a flag
> to say which offloads are expensive?
>

That exposes some device details which seem not good (e.g we may want
to do migration among hardware and software).

Thanks


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

