Return-Path: <virtio-comment-return-8107-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2AEC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 05:30:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 85BD32ACB9
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 05:30:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63206986BF2
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 05:30:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41DC7986BE7; Thu,  2 Nov 2023 05:30:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FA84986BE8
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 05:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: lQ1nJbsOONOhb0_sHTNbpw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698903034; x=1699507834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx6Q1V7KvNG27BybGyZ4wIuDL7lAOA2nWPykhKViMZo=;
        b=eErxzXuoQvVHv5C2V7k3DtD4KNEMAF4KsGKtO8zUYGdjwGDyZ2OFXPdi4XnyibfDG7
         jPjk1pQVdS7BquQX1tEDTwAwjJt0z5KVMWakKNb+hOduZen1qZsqZkIc+/OkNY3Q7xCK
         AGyor03Wqst6iMWxP5RJvWPOI3ZzMU/aFC0nSltfc2K0sSSA3IrC9X9n8BeEINzsOcwK
         wNyw3v6oR/h8xe0XJJ3Y3T5XZyBrSobyLhMrEfYAvfSY8IGeWKbWXW821in1kaCO5O3g
         wGl8Aqg0xJTy+cmEiDwQ4JiPMlFt/5Ds3LtXRyCErtbIBdzQJPe/yyOEFRqgTSjvKifv
         tF5A==
X-Gm-Message-State: AOJu0Yx8v5K/kSpOgIoTabUZNeifq9iIubAOQ2NDHrSjTPMT6YaTLSv7
	j+zvTmUmnFJvSRGkzNyOA+OL/Iu4Z50Wh74+aj0K8Py+kmZJtkcNhY9+6nuz3RoI/BO8hmWZVRa
	14xAW7qKjLm9ryMNq7JTjcPoXsgfx5zdTboKJfIJn1fR0j0jqPw==
X-Received: by 2002:a05:6512:695:b0:503:2567:c42f with SMTP id t21-20020a056512069500b005032567c42fmr3153273lfe.0.1698903033800;
        Wed, 01 Nov 2023 22:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0zqzO0TlY7HLu3p/qGlwde0w4i6LE2ebJiaVl0/wa1DOYcpqAhOAgqbGXxoBRCQSN7pI5bHG5HRE56rkFqnk=
X-Received: by 2002:a05:6512:695:b0:503:2567:c42f with SMTP id
 t21-20020a056512069500b005032567c42fmr3153264lfe.0.1698903033434; Wed, 01 Nov
 2023 22:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <fac1080d10df30450e889379b8da2a6db6523c23.1697695970.git.hengqi@linux.alibaba.com>
 <20231027032707-mutt-send-email-mst@kernel.org> <79a89ece-f931-4a59-ac5c-25b60c4102a1@linux.alibaba.com>
 <CACGkMEvzAyQmO=YBzqNjxjkCMyFw42bWD+RQ1Audb06WpeG6EA@mail.gmail.com> <7d8119c0-b27b-4f1a-93a6-57a2e0a6f94d@linux.alibaba.com>
In-Reply-To: <7d8119c0-b27b-4f1a-93a6-57a2e0a6f94d@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Nov 2023 13:30:22 +0800
Message-ID: <CACGkMEt8kuTbsB7v9Yd5XMenmsV4rSVRhRdumPewJz4GVr49iw@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Parav Pandit <parav@nvidia.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: support distinguishing
 between partial and full checksum

On Wed, Nov 1, 2023 at 12:59=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2023/11/1 =E4=B8=8B=E5=8D=8812:16, Jason Wang =E5=86=99=E9=81=
=93:
> > On Sat, Oct 28, 2023 at 10:36=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> >>
> >>
> >> =E5=9C=A8 2023/10/27 =E4=B8=8B=E5=8D=883:39, Michael S. Tsirkin =E5=86=
=99=E9=81=93:
> >>> On Thu, Oct 19, 2023 at 02:17:20PM +0800, Heng Qi wrote:
> >>>> virtio-net works in a virtualized system and is somewhat different f=
rom
> >>>> physical nics. One of the differences is that to save virtio device
> >>>> resources, rx may receive packets with partial checksum. However, XD=
P may
> >>>> cause partially checksummed packets to be dropped. So XDP loading co=
nflicts
> >>>> with the feature VIRTIO_NET_F_GUEST_CSUM.
> >>>>
> >>>> This patch lets the device to supply fully checksummed packets to th=
e driver.
> >>>> Then XDP can coexist with VIRTIO_NET_F_GUEST_CSUM to enjoy the benef=
its of
> >>>> device verification checksum.
> >>>>
> >>>> In addition, implementation of some performant devices do not genera=
te
> >>>> partially checksummed packets, but the standard driver still need to=
 clear
> >>>> VIRTIO_NET_F_GUEST_CSUM when loading XDP. If these devices enable th=
e
> >>>> full checksum offloading, then the driver can load XDP without clear=
ing
> >>>> VIRTIO_NET_F_GUEST_CSUM.
> >>>>
> >>>> A new feature bit VIRTIO_NET_F_GUEST_FULL_CSUM is added to solve the=
 above
> >>>> situation, which provides the driver with configurable receive full =
checksum
> >>>> offload. If the offload is enabled, then the device must supply full=
y
> >>>> checksummed packets to the driver.
> >>>>
> >>>> Use case example:
> >>>> If VIRTIO_NET_F_GUEST_FULL_CSUM is negotiated and receive full check=
sum
> >>>> offload is enabled, after XDP processes a packet with full checksum,=
 the
> >>>> VIRTIO_NET_HDR_F_DATA_VALID bit is still retained, resulting in the =
stack
> >>>> not needing to validate the checksum again. This is useful for guest=
s:
> >>>>     1. Bring the driver advantages such as cpu savings.
> >>>>     2. For devices that do not generate partially checksummed packet=
s themselves,
> >>>>        XDP can be loaded in the driver without modifying the hardwar=
e behavior.
> >>>>
> >>>> Several solutions have been discussed in the previous proposal[1].
> >>>> After historical discussion, we have tried the method proposed by Ja=
son[2],
> >>>> but some complex scenarios and challenges are difficult to deal with=
.
> >>>> We now return to the method suggested in [1].
> >>>>
> >>>> [1] https://lists.oasis-open.org/archives/virtio-dev/202305/msg00291=
.html
> >>>> [2] https://lore.kernel.org/all/20230628030506.2213-1-hengqi@linux.a=
libaba.com/
> >>>>
> >>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>>> ---
> >>>> v1->v2:
> >>>>       1. Modify full checksum functionality as a configurable offloa=
d
> >>>>          that is initially turned off. @Jason
> >>>>
> >>>>    device-types/net/description.tex | 54 +++++++++++++++++++++++++++=
+----
> >>>>    1 file changed, 48 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/device-types/net/description.tex b/device-types/net/des=
cription.tex
> >>>> index 76585b0..3c34f27 100644
> >>>> --- a/device-types/net/description.tex
> >>>> +++ b/device-types/net/description.tex
> >>>> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
> >>>>    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through con=
trol
> >>>>        channel.
> >>>>
> >>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (50)] Driver handles packets wit=
h full checksum.
> >>>> +
> >>>>    \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header =
hash for encapsulated packets.
> >>>>
> >>>>    \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue no=
tification coalescing.
> >>>> @@ -133,6 +135,7 @@ \subsubsection{Feature bit requirements}\label{s=
ec:Device Types / Network Device
> >>>>    \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>>>    \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>>>    \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
> >>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM] Requires VIRTIO_NET_F_GUEST_CSU=
M and VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
> >>>>
> >>>>    \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
> >>>>    \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
> >>> What about all of these:
> >>>
> >>> device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO4] Requi=
res VIRTIO_NET_F_GUEST_CSUM.
> >>> device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_TSO6] Requi=
res VIRTIO_NET_F_GUEST_CSUM.
> >>> device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_UFO] Requir=
es VIRTIO_NET_F_GUEST_CSUM.
> >>> device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO4] Requi=
res VIRTIO_NET_F_GUEST_CSUM.
> >>> device-types/net/description.tex:\item[VIRTIO_NET_F_GUEST_USO6] Requi=
res VIRTIO_NET_F_GUEST_CSUM.
> >>>
> >>>
> >>>
> >>> can TSO/UFO/USO work with VIRTIO_NET_F_GUEST_FULL_CSUM as opposed to =
VIRTIO_NET_F_GUEST_CSUM?
> >> Both GUEST_FULL_CSUM and GUEST_CSUM can work with GUEST_TSO/USO/UFO.
> > Yes. For software devices I guess it will have a lot of performance
> > penalty. So it should be disabled by default anyhow. The idea is to
> > delay the csum as late as possible.
>
> Yes. I totally agree.
>
> >
> >> Their important difference is that if GUEST_CSUM is negotiated, the
> >> driver can handle partial checksum.
> >>
> >>>
> >>>> @@ -390,6 +393,13 @@ \subsection{Device Initialization}\label{sec:De=
vice Types / Network Device / Dev
> >>>>    \ref{sec:Device Types / Network Device / Device Operation /
> >>>>    Processing of Incoming Packets}~\nameref{sec:Device Types /
> >>>>    Network Device / Device Operation / Processing of Incoming Packet=
s} below.
> >>>> +
> >>>> +\item The VIRTIO_NET_F_GUEST_FULL_CSUM feature indicates that the d=
river handles
> >>>> +  packets with full checksum and does not handle packets with parti=
al checksum,
> >>> So we need to change definition of VIRTIO_NET_F_GUEST_CSUM then.
> >>>
> >>>
> >>> Also this is not exactly right. As defined driver must be able to han=
dle
> >>> partial checksum too.
> >>>
> >>>
> >>> How about this:
> >>>
> >>> - change definition above to just "Driver handles packets with full c=
hecksum."
> >>>
> >>> - if VIRTIO_NET_F_GUEST_FULL_CSUM is set but VIRTIO_NET_F_GUEST_CSUM =
is
> >>>     clear driver requires full checksum
> >>>
> >>> - if VIRTIO_NET_F_GUEST_FULL_CSUM is clear but VIRTIO_NET_F_GUEST_CSU=
M is
> >>>     set driver supports partial checksum
> >>>
> >>> - if VIRTIO_NET_F_GUEST_FULL_CSUM and VIRTIO_NET_F_GUEST_CSUM are
> >>>     set then the behavior is as you describe: VIRTIO_NET_F_GUEST_CSUM
> >>>     takes preference, but you can disable it with VIRTIO_NET_F_CTRL_G=
UEST_OFFLOADS
> >>>     if that is supported.
> >> Jason wanted this feature to be enabled only when XDP is loading,
> >> and this is the context in which this patch was proposed.
> >>
> >> How do you pay attention to this?
> > I don't see any conflict, or anything I miss?
>
> Yes, our request was met.
>
> If GUEST_FULL_CSUM and GUEST_CSUM are independent,
> that is, GUEST_FULL_CSUM can be successfully validated without GUEST_CSUM=
.
> Then we need to re-describe most of the existing behavior of GUEST_CSUM
> for FULL_CSUM
> in the spec, this part is overlapping. Moreover, the relationship
> between FULL_CSUM
> and GUEST_CSUM also needs to be processed in the full text.
>
> So I think it seems clearer to constrain the behavior of GUEST_CSUM by
> treating FULL_CSUM as a subset of GUEST_CSUM.

This seems to work.

Thanks

>
> For example we don't need to make the following changes:
> \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM or
> VIRTIO_NET_F_GUEST_FULL_CSUM.
> \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM or
> VIRTIO_NET_F_GUEST_FULL_CSUM.
> \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM or
> VIRTIO_NET_F_GUEST_FULL_CSUM.
> \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM or
> VIRTIO_NET_F_GUEST_FULL_CSUM.
> \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM or
> VIRTIO_NET_F_GUEST_FULL_CSUM.
>
> Thanks!
>
> >
> > Thanks
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

