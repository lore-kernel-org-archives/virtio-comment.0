Return-Path: <virtio-comment-return-8278-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548A4C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:55:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8F9362A829
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:55:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6949D986CC6
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:55:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4D3F9986CBC; Thu,  9 Nov 2023 03:55:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36B8B986CBD
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 03:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GzfB0Q7VPF-IBnfBESNmEw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699502113; x=1700106913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WtiitEVVbQdjzuXeuxjej7933iA6PRwozqBHaRO+i4=;
        b=Kxd8CukkyXH5v7d7qB9bYwz1pcbJkBY4RZitcwkDKcbdxl0Fo1CMZ3t2gZq5ZnbUUN
         zxjskvf1GGBMracKWpa/6qQgPOdPPRbPezjP8ZyvooCUJHeJoAkU7vPK+Bns/ekbS/8F
         6Ondvh0+Olys6NCMYRJBFzhnTNG1Ezq1DBOsLBlLFWdLzHXvsg55E5BaK5dU4cBKN+6f
         hD/f3cdfSUB1iKYNY8AdPY0GjerRVkCh5WrodY1a9nwSMnngWYj1ZBRspPSBxIbKl6P/
         4UgmpkNH7WiAwc/VwSmidjTYZI90OsRBxXluAKknXqY5dSPDDJn2gugRpPTLaysnhzuw
         QZoA==
X-Gm-Message-State: AOJu0Yx+e5lBiSZKJTt+blQG/UUuioXbZWDvtCn5kjazjjSGecrEt2cS
	hQ2IqbjD7hWRftmVqrOM3YACP6uKo2VkOtqgDWkqZCHQtTiKsGETe79zl0qZH+p351qgNSvky0M
	Zq/6JL6Ji3uFDtNbze5f0OQkmkRXwAxTFIkTsKKXMB6pXd9AC9A==
X-Received: by 2002:ac2:511b:0:b0:507:c7cc:12c4 with SMTP id q27-20020ac2511b000000b00507c7cc12c4mr303488lfb.57.1699502113222;
        Wed, 08 Nov 2023 19:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxeptz4z56DqgV0wf+kx3uDs9AP9knkid5L6L3FT8lErJ1YjbEj+WDNPeGR6KCv1PzDqiaE6ylZJA0pfmqwNE=
X-Received: by 2002:ac2:511b:0:b0:507:c7cc:12c4 with SMTP id
 q27-20020ac2511b000000b00507c7cc12c4mr303479lfb.57.1699502112856; Wed, 08 Nov
 2023 19:55:12 -0800 (PST)
MIME-Version: 1.0
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org> <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com>
 <20231101013634-mutt-send-email-mst@kernel.org> <CACGkMEucwwx2p1Y-3DN3yBAA6_Mu6pdmKxpCj8pDbD6YxjvFPg@mail.gmail.com>
 <20231102024425-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231102024425-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Nov 2023 11:55:01 +0800
Message-ID: <CACGkMEvXBjHUmHAjBvn8UE47Ca26vx0+J22=nAygB96nakXPcw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org, 
	Parav Pandit <parav@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Thu, Nov 2, 2023 at 2:50=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Nov 02, 2023 at 12:40:03PM +0800, Jason Wang wrote:
> > On Wed, Nov 1, 2023 at 1:37=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Nov 01, 2023 at 12:16:23PM +0800, Jason Wang wrote:
> > > > On Sat, Oct 28, 2023 at 10:36=E2=80=AFAM Heng Qi <hengqi@linux.alib=
aba.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > =E5=9C=A8 2023/10/27 =E4=B8=8B=E5=8D=883:39, Michael S. Tsirkin =
=E5=86=99=E9=81=93:
> > > > > > On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> > > > > >> virtio-net works in a virtualized system and is somewhat diffe=
rent from
> > > > > >> physical nics. One of the differences is that to save virtio d=
evice
> > > > > >> resources, rx may receive packets with partial checksum. Howev=
er, XDP may
> > > > > >> cause partially checksummed packets to be dropped. So XDP load=
ing conflicts
> > > > > >> with the feature VIRTIO_NET_F_GUEST_CSUM.
> > > > > >>
> > > > > >> This patch lets the device to supply fully checksummed packets=
 to the driver.
> > > > > >> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the=
 benefits of
> > > > > >> device verification checksum.
> > > > > >>
> > > > > >> In addition, implementation of some performant devices do not =
generate
> > > > > >> partially checksummed packets, but the standard driver still n=
eed to clear
> > > > > >> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices ena=
ble the
> > > > > >> full checksum offloading, then the driver can load XDP without=
 clearing
> > > > > >> VIRTIO_NET_F_GUEST_CSUM.
> > > > > >>
> > > > > >> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to sol=
ve the above
> > > > > >> situation, which provides the driver with configurable receive=
 full checksum
> > > > > >> offload. If the offload is enabled, then the device must suppl=
y fully
> > > > > >> checksummed packets to the driver.
> > > > > >>
> > > > > >> Use case example:
> > > > > >> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full=
 checksum
> > > > > >> offload is enabled, after XDP processes a packet with full che=
cksum, the
> > > > > >> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting i=
n the stack
> > > > > >> not needing to validate the checksum again. This is useful for=
 guests:
> > > > > >>    1. Bring the driver advantages such as cpu savings.
> > > > > >>    2. For devices that do not generate partially checksummed p=
ackets themselves,
> > > > > >>       XDP can be loaded in the driver without modifying the ha=
rdware behavior.
> > > > > >>
> > > > > >> Several solutions have been discussed in the previous proposal=
[1].
> > > > > >> After historical discussion, we have tried the method proposed=
 by Jason[2],
> > > > > >> but some complex scenarios and challenges are difficult to dea=
l with.
> > > > > >> We now return to the method suggested in [1].
> > > > > >>
> > > > > >> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/ms=
g00291.html
> > > > > >> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@l=
inux.alibaba.com/
> > > > > >>
> > > > > >> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > >> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > >> ---
> > > > > >> v1->v2:
> > > > > >>      1. Modify full checksum functionality as a configurable o=
ffload
> > > > > >>         that is initially turned off. @Jason
> > > > > >>
> > > > > >>   device-types/net/description.tex | 54 ++++++++++++++++++++++=
++++++----
> > > > > >>   1 file changed, 48 insertions(+), 6 deletions(-)
> > > > > >>
> > > > > >> diff --git a/device-types/net/description.tex b/device-types/n=
et/description.tex
> > > > > >> index 76585b0..3c34f27 100644
> > > > > >> --- a/device-types/net/description.tex
> > > > > >> +++ b/device-types/net/description.tex
> > > > > >> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device T=
ypes / Network Device / Feature bits
> > > > > >>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address throug=
h control
> > > > > >>       channel.
> > > > > >>
> > > > > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packe=
ts with full checksum.
> > > > > >> +
> > > > > >>   \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner he=
ader hash for encapsulated packets.
> > > > > >>
> > > > > >>   \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtque=
ue notification coalescing.
> > > > > >> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\l=
abel{sec:Device Types / Network Device
> > > > > >>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CS=
UM.
> > > > > >>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_C=
SUM.
> > > > > >>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_C=
SUM.
> > > > > >> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUE=
ST_CSUM and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> > > > > >>
> > > > > >>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> > > > > >>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> > > > > > What about all of these:
> > > > > >
> > > > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4]=
 Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6]=
 Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] =
Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4]=
 Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > > device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6]=
 Requires VIRTIO_NET_F_GUEST_CSUM.
> > > > > >
> > > > > >
> > > > > >
> > > > > > can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as oppos=
ed to VIRTIO_NET_F_GUEST_CSUM?
> > > > >
> > > > > Both GUEST_FULL_CSUM and GUEST_CSUM can work with GUEST_TSO/USO/U=
FO.
> > > >
> > > > Yes. For software devices I guess it will have a lot of performance
> > > > penalty. So it should be disabled by default anyhow. The idea is to
> > > > delay the csum as late as possible.
> > >
> > > But for hardware it's actually better.
> >
> > I can't think of a case where it might be better than XDP.
>
> Of course CHECKSUM_COMPLETE is better than CHECKSUM_PARTIAL if you can
> support it: you don't even need to look at csum_start + csum_offset.

I may miss something here, if the packet was delivered to the
userspace then they don't care.

> And the hardware doesn't need to parse L3/L4 headers to implement
> CHECKSUM_COMPLETE.

Hardware may choose to coalesce packets.

>
>
> > Most userspace doesn't care about the checksum though.
> >
> > > Maybe we need a flag
> > > to say which offloads are expensive?
> > >
> >
> > That exposes some device details which seem not good (e.g we may want
> > to do migration among hardware and software).
> >
> > Thanks
>
> If you do then things will be less well tuned on one of the migration
> ends but then that is by design, isn't it?

Ok, so I'm fine to enable it by default.

Thanks

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

