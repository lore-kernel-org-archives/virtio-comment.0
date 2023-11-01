Return-Path: <virtio-comment-return-8076-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480C6C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 04:16:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 786F42B07A
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 04:16:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62AF0986BB6
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 04:16:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3E0FC986BAA; Wed,  1 Nov 2023 04:16:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E730986BAC
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 04:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nzOTuXJ5Mjm-_o4JmWfX7Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698812195; x=1699416995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LD9DMnAQ9Q6JoJiAHuGPIo6T7t15Iueuj4dscfNay28=;
        b=rbWCoBQOaun+FEFte8idDXkRn9CTLIkhidOyOeVPcuKqoZBIhUCodzeYslCOMEtefQ
         2jP+6BwW65x/wVHDeW7ygaQmVHSvheUjEBp7qPPU04wLWyYTfgLr8KBWz1dR7jPeapeI
         nsZWaDDdsAjObXEW0AVLHc+8umu4im+fOsUFGr3EkcpSLJjim4xefFWudWSTJvaASmSg
         8BiBnGxazNVsCpvtYYm206wnY8in/JcoVdeM9QP9PasnFBpuoeVj9erds5D02Q5B+QiT
         5teHGVGABIoLEhzeMwNd6aQEoyRFfQ6Wm+eqilrHd9ggX0rEAbB9DzRjIT9zDtVTI639
         a5Zg==
X-Gm-Message-State: AOJu0YwwyfbpMjGWff9O3lEFSe/9R5bZtVvtu0kSN4MGKnPgyvW1nANf
	e3o4rZSQ8fr75z5M22VYb3WIkNHFdPJobGGCXf5/FkLuoaz+m3byQqv41AbhOu6cAW08fy2j6hv
	UpXGs3/5EvtSAtz9vsIw92XOoN92NXQ51EiFVfpC2A8Rd6ey9XA==
X-Received: by 2002:a05:6512:ba7:b0:509:2b82:385c with SMTP id b39-20020a0565120ba700b005092b82385cmr5175544lfv.61.1698812194972;
        Tue, 31 Oct 2023 21:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW0rMbrCPYsLQpDUcaThkk/rXmRSojPdCBv086pirKO0LybkPxEkEJ1X8/nq3aHfPQrXqzeevnNLDR1mmuMfk=
X-Received: by 2002:a05:6512:ba7:b0:509:2b82:385c with SMTP id
 b39-20020a0565120ba700b005092b82385cmr5175531lfv.61.1698812194602; Tue, 31
 Oct 2023 21:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org> <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
In-Reply-To: <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Nov 2023 12:16:23 +0800
Message-ID: <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Parav Pandit <parav@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Sat, Oct 28, 2023 at 10:36=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.com>=
 wrote:
>
>
>
> =E5=9C=A8 2023/10/27 =E4=B8=8B=E5=8D=883:39, Michael S. Tsirkin =E5=86=99=
=E9=81=93:
> > On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> >> virtio-net works in a virtualized system and is somewhat different fro=
m
> >> physical nics. One of the differences is that to save virtio device
> >> resources, rx may receive packets with partial checksum. However, XDP =
may
> >> cause partially checksummed packets to be dropped. So XDP loading conf=
licts
> >> with the feature VIRTIO_NET_F_GUEST_CSUM.
> >>
> >> This patch lets the device to supply fully checksummed packets to the =
driver.
> >> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benefit=
s of
> >> device verification checksum.
> >>
> >> In addition, implementation of some performant devices do not generate
> >> partially checksummed packets, but the standard driver still need to c=
lear
> >> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable the
> >> full checksum offloading, then the driver can load XDP without clearin=
g
> >> VIRTIO_NET_F_GUEST_CSUM.
> >>
> >> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the a=
bove
> >> situation, which provides the driver with configurable receive full ch=
ecksum
> >> offload. If the offload is enabled, then the device must supply fully
> >> checksummed packets to the driver.
> >>
> >> Use case example:
> >> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full checksu=
m
> >> offload is enabled, after XDP processes a packet with full checksum, t=
he
> >> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the st=
ack
> >> not needing to validate the checksum again. This is useful for guests:
> >>    1. Bring the driver advantages such as cpu savings.
> >>    2. For devices that do not generate partially checksummed packets t=
hemselves,
> >>       XDP can be loaded in the driver without modifying the hardware b=
ehavior.
> >>
> >> Several solutions have been discussed in the previous proposal[1].
> >> After historical discussion, we have tried the method proposed by Jaso=
n[2],
> >> but some complex scenarios and challenges are difficult to deal with.
> >> We now return to the method suggested in [1].
> >>
> >> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291.h=
tml
> >> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.ali=
baba.com/
> >>
> >> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >> v1->v2:
> >>      1. Modify full checksum functionality as a configurable offload
> >>         that is initially turned off. @Jason
> >>
> >>   device-types/net/description.tex | 54 ++++++++++++++++++++++++++++--=
--
> >>   1 file changed, 48 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex
> >> index 76585b0..3c34f27 100644
> >> --- a/device-types/net/description.tex
> >> +++ b/device-types/net/description.tex
> >> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
> >>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contro=
l
> >>       channel.
> >>
> >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets with =
full checksum.
> >> +
> >>   \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header has=
h for encapsulated packets.
> >>
> >>   \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notif=
ication coalescing.
> >> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{sec=
:Device Types / Network Device
> >>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSUM =
and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> >>
> >>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> >>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> > What about all of these:
> >
> > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4] Require=
s VIRTIO_NET_F_GUEST_CSUM.
> > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6] Require=
s VIRTIO_NET_F_GUEST_CSUM.
> > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] Requires=
 VIRTIO_NET_F_GUEST_CSUM.
> > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4] Require=
s VIRTIO_NET_F_GUEST_CSUM.
> > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6] Require=
s VIRTIO_NET_F_GUEST_CSUM.
> >
> >
> >
> > can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as opposed to VI=
RTIO_NET_F_GUEST_CSUM?
>
> Both GUEST_FULL_CSUM and GUEST_CSUM can work with GUEST_TSO/USO/UFO.

Yes. For software devices I guess it will have a lot of performance
penalty. So it should be disabled by default anyhow. The idea is to
delay the csum as late as possible.

> Their important difference is that if GUEST_CSUM is negotiated, the
> driver can handle partial checksum.
>
> >
> >
> >> @@ -390,6 +393,13 @@ \subsection{Device Initialization}\label{sec:Devi=
ce Types / Network Device / Dev
> >>   \ref{sec:Device Types / Network Device / Device Operation /
> >>   Processing of Incoming Packets}~\nameref{sec:Device Types /
> >>   Network Device / Device Operation / Processing of Incoming Packets} =
below.
> >> +
> >> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the dri=
ver handles
> >> +  packets with full checksum and does not handle packets with partial=
 checksum,
> >
> > So we need to change definition of VIRTIO_NET_F_GUEST_CSUM then.
> >
> >
> > Also this is not exactly right. As defined driver must be able to handl=
e
> > partial checksum too.
> >
> >
> > How about this:
> >
> > - change definition above to just "Driver handles packets with full che=
cksum."
> >
> > - if VIRTIO_NET_F_GUEST_FULL_CSUM is set but VIRTIO_NET_F_GUEST_CSUM is
> >    clear driver requires full checksum
> >
> > - if VIRTIO_NET_F_GUEST_FULL_CSUM is clear but VIRTIO_NET_F_GUEST_CSUM =
is
> >    set driver supports partial checksum
> >
> > - if VIRTIO_NET_F_GUEST_FULL_CSUM and VIRTIO_NET_F_GUEST_CSUM are
> >    set then the behavior is as you describe: VIRTIO_NET_F_GUEST_CSUM
> >    takes preference, but you can disable it with VIRTIO_NET_F_CTRL_GUES=
T_OFFLOADS
> >    if that is supported.
>
> Jason wanted this feature to be enabled only when XDP is loading,
> and this is the context in which this patch was proposed.
>
> How do you pay attention to this?

I don't see any conflict, or anything I miss?

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

